#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${HOME}/.atom"
REPO="https://github.com/novaqore/atom-code.git"

if [ -d "${INSTALL_DIR}/.git" ]; then
  echo "Updating Atom..."
  git -C "${INSTALL_DIR}" pull --ff-only
else
  echo "Installing Atom..."
  rm -rf "${INSTALL_DIR}"
  git clone "${REPO}" "${INSTALL_DIR}"
fi

chmod +x "${INSTALL_DIR}/bin/atom"

# Add to PATH if not already there
SHELL_RC=""
if [ -n "${ZSH_VERSION:-}" ] || [ -f "${HOME}/.zshrc" ]; then
  SHELL_RC="${HOME}/.zshrc"
elif [ -f "${HOME}/.bashrc" ]; then
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

echo ""
echo "Atom installed successfully!"
echo "  Location: ${INSTALL_DIR}/bin/atom"
echo ""
echo "Restart your terminal, then run: atom"
