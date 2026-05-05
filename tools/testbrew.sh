#!/usr/bin/env bash
set -euo pipefail

git pull

DEPS="brew jq"
which $DEPS || (echo missing deps, need $DEPS; exit 1)

# Remove the existing local installation
brew uninstall pdftl

# Untap and retap to clear any cached local formula metadata
brew untap pdftl/pdftl
brew tap pdftl/pdftl

# Install fresh from the remote tap
brew install pdftl

jq .source < $(brew --prefix pdftl)/INSTALL_RECEIPT.json
short_hash=$(jq .source.tap_git_head < $(brew --prefix pdftl)/INSTALL_RECEIPT.json | cut -c 2-8)

git_log=$(git log --color=always --format="%C(auto)%h %C(green)%cr %C(magenta)%cn %C(reset)%s" -n 5)
echo "$git_log" | sed -e 's/\(.*'"$short_hash"'.*\)/>>>> \1 <<<</'
