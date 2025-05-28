#!/usr/bin/env bash
#
# 000-GROW.sh
# A script to:
# 1) Install fish & zig on Arch Linux using pacman if not already installed
# 2) Execute all numeric .fish scripts in ascending order

set -euo pipefail

echo "Checking for Arch Linux dependencies..."
sudo pacman -S --needed --noconfirm fish zig

echo ""
echo "All required packages installed or already present."
echo ""

echo "Locating and running numeric .fish scripts in ascending order..."
# Use version-sort (-v) to ensure 002-API-1.fish runs before 002-API-2.fish, etc.
for script in $(ls -1v [0-9][0-9][0-9]-*.fish 2>/dev/null || true); do
  echo "Executing $script ..."
  fish "$script"
done

echo ""
echo "✅ Finished running all numeric .fish scripts."
