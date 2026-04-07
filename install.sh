#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${HOME}/.atom"
BIN_DIR="${INSTALL_DIR}/bin"
REPO="novaqore/atom-code"
BRANCH="main"
BIN_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/bin/atom"

echo "Installing Atom..."
mkdir -p "${BIN_DIR}"

echo "Downloading binary..."
curl -fsSL "${BIN_URL}" -o "${BIN_DIR}/atom"
chmod +x "${BIN_DIR}/atom"

# Add to PATH if not already there
SHELL_RC=""
if [ -n "${ZSH_VERSION:-}" ] || [ -f "${HOME}/.zshrc" ]; then
  SHELL_RC="${HOME}/.zshrc"
else
  SHELL_RC="${HOME}/.bashrc"
fi

if [ -n "${SHELL_RC}" ]; then
  if ! grep -q '\.atom/bin' "${SHELL_RC}" 2>/dev/null; then
    echo '' >> "${SHELL_RC}"
    echo '# Atom CLI' >> "${SHELL_RC}"
    echo 'export PATH="$HOME/.atom/bin:$PATH"' >> "${SHELL_RC}"
  fi
fi

echo ""
echo "Atom installed successfully!"
echo "  Location: ${BIN_DIR}/atom"
echo ""
echo "Restart your terminal, then run: atom"
