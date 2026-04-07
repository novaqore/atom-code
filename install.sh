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
sudo ln -sf "${INSTALL_DIR}/bin/atom" /usr/local/bin/atom

echo ""
echo "Atom installed successfully!"
echo "  Run: atom"
