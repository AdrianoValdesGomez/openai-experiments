#!/bin/bash

echo "🔧 Matando procesos de Podman, Lima, QEMU y gvproxy..."
killall -9 podman lima gvproxy qemu-system-x86_64 2>/dev/null

echo "🧹 Eliminando máquinas y conexiones previas..."
podman machine stop || true
podman machine rm -f || true
podman system connection rm podman-machine-default || true
podman system connection rm podman-machine-default-root || true

echo "🗑️ Borrando configuración residual..."
rm -rf ~/.local/share/containers/podman
rm -rf ~/.config/containers/podman
rm -rf ~/.cache/containers/podman
rm -rf ~/.ssh/podman*

echo "✅ Máquina limpiada. Por favor, reinicia tu computadora antes de continuar."
echo "Luego podrás correr:"
echo ""
echo "  podman machine init --cpus 2 --memory 2048 --disk-size 10"
echo "  podman machine start"
