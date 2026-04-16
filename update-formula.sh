#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?usage: update-formula.sh <version>}"
FORMULA_DIR="$(cd "$(dirname "$0")" && pwd)/Formula"
FORMULA="$FORMULA_DIR/graphiq.rb"

for triple in aarch64-apple-darwin x86_64-apple-darwin x86_64-unknown-linux-gnu; do
    archive="graphiq-${triple}.tar.gz"
    url="https://github.com/aaf2tbz/graphiq/releases/download/v${VERSION}/${archive}"
    echo "Fetching SHA256 for ${archive}..."
    sha=$(curl -sL "${url}" | shasum -a 256 | awk '{print $1}')
    echo "  ${sha}"

    if [[ "$triple" == "aarch64-apple-darwin" ]]; then
        sed -i '' "s/REPLACE_aarch64_SHA256/${sha}/" "$FORMULA"
    elif [[ "$triple" == "x86_64-apple-darwin" ]]; then
        sed -i '' "s/REPLACE_x86_64_SHA256/${sha}/" "$FORMULA"
    else
        sed -i '' "s/REPLACE_LINUX_SHA256/${sha}/" "$FORMULA"
    fi
done

sed -i '' "s/version \"[^\"]*\"/version \"${VERSION}\"/" "$FORMULA"

echo "Formula updated to v${VERSION}"
echo "Review and commit:"
echo "  cd $(dirname "$FORMULA_DIR") && git add Formula/graphiq.rb && git commit -m \"graphiq v${VERSION}\" && git push"
