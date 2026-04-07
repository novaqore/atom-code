#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${HOME}/.atom"
REPO="https://github.com/novaqore/atom-code.git"

if [ -d "${INSTALL_DIR}/.git" ]; then
  echo "Updating Atom..."
  cd "${INSTALL_DIR}"
  git pull
else
  echo "Installing Atom..."
  git clone "${REPO}" "${INSTALL_DIR}"
fi

echo ""
echo "Done. Location: ${INSTALL_DIR}"
