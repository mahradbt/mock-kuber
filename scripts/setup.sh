#!/usr/bin/env bash
# Installs k3d and kubectl into ~/.local/bin if missing (no sudo needed).
set -euo pipefail
BIN="$HOME/.local/bin"
mkdir -p "$BIN"
if ! command -v k3d >/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | USE_SUDO=false K3D_INSTALL_DIR="$BIN" bash
fi
if ! command -v kubectl >/dev/null; then
  VER=$(curl -fsSL https://dl.k8s.io/release/stable.txt)
  curl -fsSL -o "$BIN/kubectl" "https://dl.k8s.io/release/$VER/bin/linux/amd64/kubectl"
  chmod +x "$BIN/kubectl"
fi
echo "Done. Make sure $BIN is in your PATH."
