class Pdftl < Formula
  include Language::Python::Virtualenv

  desc "Modern pdftk-compatible PDF CLI tool"
  homepage "https://github.com/pdftl/pdftl"
  url "https://files.pythonhosted.org/packages/50/87/8f3366be9017319ed097f48c2843b9be2fd43099abcd5ad9ebe0ea7f53a9/pdftl-0.11.1.tar.gz"
  sha256 "4df5a715320811c1cb741032bd801515d384a8b66c7bec3408e70f8c56ec16fb"
  license "MPL-2.0"
  revision 15

  PY_VER = "3.12".freeze

  depends_on "python@#{PY_VER}"
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  # Native Dependencies (Critical for wheels to link against)
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libffi"
  depends_on "libheif"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "little-cms2"
  depends_on "openjpeg"
  depends_on "openssl@3"
  depends_on "qpdf"
  depends_on "webp"

  if OS.linux?
    depends_on "libyaml"
    depends_on "libxcb"
    depends_on "zlib-ng-compat"
  else
    depends_on "zlib"
  end

  # --- Build Tools (MUST be installed first) ---
  resource "maturin" do
    url "https://files.pythonhosted.org/packages/b0/b9/322cd358fc20623a6358c2275d796693b4a242c97486e92994f31c22d0c6/maturin-1.8.1.tar.gz"
    sha256 "056637b57fc6a51d95c2567ae2c3eb39e4499b90c74384a3c20c02f741584c37"
  end

  resource "setuptools-rust" do
    url "https://files.pythonhosted.org/packages/97/99/36e053a6639c0c16353d262a05d15c7e1f4864fc674b778262a3273e46c7/setuptools_rust-1.10.2.tar.gz"
    sha256 "52c8a14b09b578c743f5456f5d8120d58850616900a6e0df0b46765d787d55f9"
  end

  # --- Runtime Resources ---
  # These were missing and causing your CI hang
  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1f/42/5c74462b4fd957fcd7b13b04fb3205ff8349236ea74c7c375766d6c82288/pillow-12.1.1.tar.gz"
    sha256 "9ad8fa5937ab05218e2b6a4cff30295ad35afd2f83ac592e68c0d871bb0fdbc4"
  end

  resource "img2pdf" do
    url "https://files.pythonhosted.org/packages/26/1e/85149bd4979e2760bf28e2448375e11d279bd5df3d0a2731885f8e561081/img2pdf-0.6.3.tar.gz"
    sha256 "c08611187427909b552d6a593309c6291a13e2d6776110f9175338a5ae74d538"
  end

  # ... [INSERT YOUR OTHER RESOURCES HERE: lxml, cryptography, pikepdf, pyhanko, etc.] ...

  def install
    # 1. Clean Environment
    ENV.delete("PYTHONPATH")

    # 2. Build Flags
    # Critical: Disable isolation so we control the build tools.
    # Critical: Disable binary to force linking against Homebrew system libs.
    ENV["PIP_NO_BUILD_ISOLATION"] = "1"
    ENV["PIP_NO_BINARY"] = ":all:"
    ENV["PIP_IGNORE_INSTALLED"] = "1"
    ENV["PYYAML_FORCE_LIBYAML"] = "1"

    # 3. Create Virtualenv
    python3 = "python#{PY_VER}"
    system python3, "-m", "venv", libexec
    venv_python = libexec/"bin/python"

    # 4. Install Build Backends FIRST
    # We manually install these to satisfy the build environment.
    build_tools = %w[setuptools wheel cffi maturin setuptools-rust]
    
    # Base tools
    system venv_python, "-m", "pip", "install", "wheel", "setuptools", "cffi"

    # Complex build tools (from resources)
    resources.each do |r|
      if %w[maturin setuptools-rust].include?(r.name)
        r.stage { system venv_python, "-m", "pip", "install", "." }
      end
    end

    # 5. Install Runtime Resources
    # This loop installs Pillow/img2pdf using the global flags (NO_BINARY, NO_ISOLATION)
    resources.each do |r|
      next if %w[maturin setuptools-rust].include?(r.name)
      r.stage do
        system venv_python, "-m", "pip", "install", "."
      end
    end

    # 6. Install Main Application (THE FIX)
    # We add --no-deps so it doesn't search for things we missed.
    # We add --no-build-isolation so it uses the build tools we just installed.
    system venv_python, "-m", "pip", "install", 
           "--no-deps", 
           "--no-build-isolation", 
           "."

    # 7. Link Executable
    bin.install_symlink libexec/"bin/pdftl"
    
    # 8. Completions
    site_packages = Language::Python.site_packages(python3)
    pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
    (libexec/site_packages/"homebrew-pdftl.pth").write pth_contents

    with_env(PYTHONPATH: libexec/site_packages) do
      if (bash_comp = Utils.safe_popen_read(libexec/"bin/pdftl", "--completion", "bash"))
        (buildpath/"pdftl.bash").write bash_comp
        bash_completion.install "pdftl.bash" => "pdftl"
      end
      if (zsh_comp = Utils.safe_popen_read(libexec/"bin/pdftl", "--completion", "zsh"))
        (buildpath/"_pdftl").write zsh_comp
        zsh_completion.install "_pdftl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pdftl --version")
    
    # Verify linking
    system libexec/"bin/python", "-c", <<~PYTHON
      import lxml.etree
      from cryptography.hazmat.backends import default_backend
      print(default_backend())
      import PIL.Image
      import pikepdf
    PYTHON
  end
end
