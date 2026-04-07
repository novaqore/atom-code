#!/usr/bin/env bash
set -euo pipefail

REPO="novaqore/atom-code"
BRANCH="main"
BIN_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/bin/atom"

echo "Installing Atom..."
curl -fsSL "${BIN_URL}" -o /tmp/atom
chmod +x /tmp/atom
sudo mv /tmp/atom /usr/local/bin/atom

echo ""
echo "Done. Run: atom"
