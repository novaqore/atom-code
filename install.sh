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

# Ensure .profile exists and sources .bashrc (login shells need this)
PROFILE="${HOME}/.profile"
if [ ! -f "${PROFILE}" ]; then
  cat > "${PROFILE}" << 'PROF'
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
PROF
fi

# Add to PATH in .bashrc
BASHRC="${HOME}/.bashrc"
if ! grep -q '\.atom/bin' "${BASHRC}" 2>/dev/null; then
  echo '' >> "${BASHRC}"
  echo '# Atom CLI' >> "${BASHRC}"
  echo 'export PATH="$HOME/.atom/bin:$PATH"' >> "${BASHRC}"
fi

# Also add to .profile directly in case .bashrc sourcing is skipped
if ! grep -q '\.atom/bin' "${PROFILE}" 2>/dev/null; then
  echo '' >> "${PROFILE}"
  echo 'export PATH="$HOME/.atom/bin:$PATH"' >> "${PROFILE}"
fi

echo ""
echo "Atom installed successfully!"
echo ""
echo "Restart your terminal, then run: atom"
