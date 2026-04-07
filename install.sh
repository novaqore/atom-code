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
    echo "Added ~/.atom/bin to PATH in ${SHELL_RC}"
  fi
fi

# Symlink to /usr/local/bin so it works immediately
if [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
  ln -sf "${BIN_DIR}/atom" /usr/local/bin/atom
elif command -v sudo &>/dev/null; then
  sudo ln -sf "${BIN_DIR}/atom" /usr/local/bin/atom
fi

echo ""
echo "Atom installed successfully!"
echo "  Location: ${BIN_DIR}/atom"
echo ""
echo "Run: atom"
