class Pdftl < Formula
  include Language::Python::Virtualenv

  desc "Modern pdftk-compatible PDF CLI tool"
  homepage "https://github.com/pdftl/pdftl"
  url "https://files.pythonhosted.org/packages/50/87/8f3366be9017319ed097f48c2843b9be2fd43099abcd5ad9ebe0ea7f53a9/pdftl-0.11.1.tar.gz"
  sha256 "4df5a715320811c1cb741032bd801515d384a8b66c7bec3408e70f8c56ec16fb"
  license "MPL-2.0"

  depends_on "ccache" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build # for 'cryptography'
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
  depends_on "python@3.12"
  depends_on "qpdf"
  depends_on "webp"
  depends_on "zlib"

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
  end

  resource "cloudpickle" do
    url "https://files.pythonhosted.org/packages/27/fb/576f067976d320f5f0114a8d9fa1215425441bb35627b1993e5afd8111e5/cloudpickle-3.1.2.tar.gz"
    sha256 "7fda9eb655c9c230dab534f1983763de5835249750e85fbcef43aaa30a9a2414"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb/cryptography-46.0.5.tar.gz"
    sha256 "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
  end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/0f/d5/c66da9b79e5bdb124974bfe172b4daf3c984ebd9c2a06e2b8a4dc7331c72/defusedxml-0.7.1.tar.gz"
    sha256 "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
  end

  resource "Deprecated" do
    url "https://files.pythonhosted.org/packages/49/85/12f0a49a7c4ffb70572b6c2ef13c90c88fd190debda93b23f026b25f9634/deprecated-1.3.1.tar.gz"
    sha256 "b1b50e0ff0c1fddaa5708a2c6b0a6588bb09b892825ab2b214ac9ea9d92a5223"
  end

  resource "deprecation" do
    url "https://files.pythonhosted.org/packages/5a/d3/8ae2869247df154b64c1884d7346d412fed0c49df84db635aab2d1c40e62/deprecation-2.1.0.tar.gz"
    sha256 "72b3bde64e5d778694b0cf68178aed03d15e15477116add3fb773e581f9518ff"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  resource "img2pdf" do
    url "https://files.pythonhosted.org/packages/8e/97/ca44c467131b93fda82d2a2f21b738c8bcf63b5259e3b8250e928b8dd52a/img2pdf-0.6.3.tar.gz"
    sha256 "219518020f5bd242bdc46493941ea3f756f664c2e86f2454721e74353f58cd95"
  end

  resource "lark" do
    url "https://files.pythonhosted.org/packages/da/34/28fff3ab31ccff1fd4f6c7c7b0ceb2b6968d8ea4950663eadcb5720591a0/lark-1.3.1.tar.gz"
    sha256 "b426a7a6d6d53189d318f2b6236ab5d6429eaf09259f1ca33eb716eed10d2905"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb/lxml-6.0.2.tar.gz"
    sha256 "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "ocrmypdf" do
    url "https://files.pythonhosted.org/packages/8c/52/be1aaece0703a736757d8957c0d4f19c37561054169b501eb0e7132f15e5/ocrmypdf-16.13.0.tar.gz"
    sha256 "29d37e915234ce717374863a9cc5dd32d29e063dfe60c51380dda71254c88248"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/65/ee/299d360cdc32edc7d2cf530f3accf79c4fca01e96ffc950d8a52213bd8e4/packaging-26.0.tar.gz"
    sha256 "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
  end

  resource "pdfminer-six" do
    url "https://files.pythonhosted.org/packages/34/a4/5cec1112009f0439a5ca6afa8ace321f0ab2f48da3255b7a1c8953014670/pdfminer_six-20260107.tar.gz"
    sha256 "96bfd431e3577a55a0efd25676968ca4ce8fd5b53f14565f85716ff363889602"
  end

  resource "pi-heif" do
    url "https://files.pythonhosted.org/packages/c5/0b/0c97767b8171c7f9f0584c0a70e7b86655a1898c2f5b8ae04a69f4e481a1/pi_heif-1.2.0.tar.gz"
    sha256 "52bbbc8c30b803288a9f1bb02e4575797940fdc1f5091fce743c699e812418cc"
  end

  resource "pikepdf" do
    url "https://files.pythonhosted.org/packages/b6/ba/7635a5f4259a2a91ed4f094e358dec3068ecedc891d70b8e76a02904ca0c/pikepdf-10.3.0.tar.gz"
    sha256 "e2a64a5f1ebf8c411193126b9eeff7faf5739a40bce7441e579531422469fbb1"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1f/42/5c74462b4fd957fcd7b13b04fb3205ff8349236ea74c7c375766d6c82288/pillow-12.1.1.tar.gz"
    sha256 "9ad8fa5937ab05218e2b6a4cff30295ad35afd2f83ac592e68c0d871bb0fdbc4"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779/pluggy-1.6.0.tar.gz"
    sha256 "7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "reportlab" do
    url "https://files.pythonhosted.org/packages/48/57/28bfbf0a775b618b6e4d854ef8dd3f5c8988e5d614d8898703502a35f61c/reportlab-4.4.10.tar.gz"
    sha256 "5cbbb34ac3546039d0086deb2938cdec06b12da3cdb836e813258eb33cd28487"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298/rich-14.3.2.tar.gz"
    sha256 "e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "wrapt" do
    url "https://files.pythonhosted.org/packages/f7/37/ae31f40bec90de2f88d9597d0b5281e23ffe85b893a47ca5d9c05c63a4f6/wrapt-2.1.1.tar.gz"
    sha256 "5fdcb09bf6db023d88f312bd0767594b414655d58090fc1c46b3414415f67fac"
  end

  def install
    python_f = deps.map(&:to_formula).find { |f| f.name.start_with?("python@") }
    pyver = python_f.version.major_minor # e.g., "3.12"

    # 1. Compiler Setup
    if which("ccache")
      ENV["CC"] = "ccache #{ENV.cc}"
      ENV["CXX"] = "ccache #{ENV.cxx}"
    end
    ENV["MAKEFLAGS"] = "-j#{ENV.make_jobs}"
    ENV["MAX_CONCURRENCY"] = ENV.make_jobs.to_s

    # 2. Dependency Path Mapping
    # Collect all dependencies we need to "map" into CPATH/LIBRARY_PATH
    libs = %w[libxml2 libxslt libffi libtiff webp freetype].map { |name| Formula[name] }

    libs.each do |f|
      ENV.append_path "CPATH", f.opt_include
      ENV.append_path "LIBRARY_PATH", f.opt_lib
    end

    # 3. Handle Nested/Special Includes
    [
      python_f.opt_include/"python#{pyver}",
      Formula["libxml2"].opt_include/"libxml2",
      Formula["freetype"].opt_include/"freetype2",
      Dir[Formula["openjpeg"].opt_include/"openjpeg-*"].first,
    ].compact.each { |path| ENV.append_path "CPATH", path }

    # 4. Tool-Specific Variables
    ENV["XML2_CONFIG"] = Formula["libxml2"].opt_bin/"xml2-config"
    ENV["XSLT_CONFIG"] = Formula["libxslt"].opt_bin/"xslt-config"
    ENV["PYTHON_LXML_LIBRARY_DIRECTORY"] = Formula["libxml2"].opt_lib

    # Pillow Roots
    %w[openjpeg libtiff webp].each do |name|
      ENV["#{name.delete_prefix("lib").upcase}_ROOT"] = Formula[name].opt_prefix
    end

    venv = virtualenv_create(libexec, "python#{pyver}")

    # 'high priority'/problematic resources first
    first_resources = %w[pycparser cffi pillow lxml]
    first_resources.each do |res|
      ohai "Installing high-priority resource: #{res}"
      venv.pip_install resource(res)
    end

    ohai "Installing remaining resources"
    remaining = resources.reject { |r| first_resources.include?(r.name) }
    venv.pip_install remaining

    venv.pip_install_and_link buildpath

    site_packages = libexec/"lib/python#{pyver}/site-packages"

    # We use 'Language::Python.rewrite_python_shebang' style logic here
    with_env(PYTHONPATH: site_packages) do
      {
        "bash" => "pdftl",
        "zsh"  => "_pdftl",
      }.each do |shell, completion_name|
        path = buildpath/"pdftl.#{shell}"
        content = Utils.safe_popen_read(bin/"pdftl", "--completion", shell)

        # Replace the hardcoded Cellar version path with the stable 'opt' path
        content.gsub!(libexec.to_s, opt_libexec.to_s)

        path.write content
        ((shell == "bash") ? bash_completion : zsh_completion).install path => completion_name
      end
    end
  end

  def caveats
    <<~EOS
      Bash users:
        Add the following to your .bashrc:
          [ -f #{etc}/bash_completion.d/pdftl ] && . #{etc}/bash_completion.d/pdftl

      Zsh users:
        Ensure your FPATH includes the Homebrew site-functions directory:
          export FPATH="#{HOMEBREW_PREFIX}/share/zsh/site-functions:$FPATH"
        Then initialize completion by adding 'autoload -Uz compinit && compinit' to your .zshrc.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pdftl --version")
    system libexec/"bin/python", "-c", "import lxml.etree; import PIL; import cffi; import pikepdf; import pdftl"
  end
end
