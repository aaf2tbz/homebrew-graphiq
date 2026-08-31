#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?usage: update-formula.sh <version>}"
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
FORMULA="$ROOT_DIR/Formula/graphiq.rb"

for triple in \
    aarch64-apple-darwin \
    x86_64-apple-darwin \
    aarch64-unknown-linux-gnu \
    x86_64-unknown-linux-gnu; do
    archive="graphiq-${triple}.tar.gz"
    url="https://github.com/aaf2tbz/graphiq/releases/download/v${VERSION}/${archive}"
    echo "Fetching SHA256 for ${archive}..."
    sha=$(curl --fail --location --silent --show-error "${url}" | shasum -a 256 | awk '{print $1}')
    if [[ ! "$sha" =~ ^[0-9a-f]{64}$ ]]; then
        echo "failed to calculate a SHA256 for ${archive}" >&2
        exit 1
    fi
    echo "  ${sha}"

    FORMULA="$FORMULA" TRIPLE="$triple" VERSION="$VERSION" SHA="$sha" python3 - <<'PY'
import os
import re
from pathlib import Path

path = Path(os.environ["FORMULA"])
triple = os.environ["TRIPLE"]
version = os.environ["VERSION"]
sha = os.environ["SHA"]
lines = path.read_text().splitlines(keepends=True)
archive = f"graphiq-{triple}.tar.gz"

for index, line in enumerate(lines):
    if archive not in line:
        continue
    lines[index] = re.sub(r"/v[^/]+/", f"/v{version}/", line, count=1)
    if index + 1 >= len(lines) or "sha256" not in lines[index + 1]:
        raise SystemExit(f"could not find sha256 line after {archive}")
    lines[index + 1] = re.sub(
        r'(sha256\s+")[0-9a-f]+(")',
        rf'\g<1>{sha}\g<2>',
        lines[index + 1],
        count=1,
    )
    break
else:
    raise SystemExit(f"could not find {archive} in {path}")

text = "".join(lines)
text, replacements = re.subn(
    r'(?m)^  version "[^"]+"$',
    f'  version "{version}"',
    text,
    count=1,
)
if replacements != 1:
    raise SystemExit(f"could not update formula version in {path}")
path.write_text(text)
PY
done

echo "Formula updated to v${VERSION}"
echo "Review and commit:"
echo "  cd ${ROOT_DIR} && git add Formula/graphiq.rb update-formula.sh && git commit -m \"graphiq v${VERSION}\" && git push"
