#!/bin/bash
#
# Genie Installer for macOS/Linux
# Usage: curl -fsSL https://raw.githubusercontent.com/glvent/Genie/main/install.sh | bash
#

set -e

REPO="glvent/Genie"
BRANCH="main"
TARGET_DIR=".cursor/rules"

echo "Installing Genie..."

# Check if .cursor/rules already exists
if [ -d "$TARGET_DIR" ]; then
    read -p "$TARGET_DIR already exists. Overwrite? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
    rm -rf "$TARGET_DIR"
fi

# Create directory
mkdir -p "$TARGET_DIR"

# Download and extract rules
echo "Downloading Genie rules..."

if command -v curl &> /dev/null; then
    curl -sL "https://api.github.com/repos/$REPO/tarball/$BRANCH" | \
        tar -xz --strip-components=2 -C "$TARGET_DIR" --wildcards "*/\.cursor/rules/*"
elif command -v wget &> /dev/null; then
    wget -qO- "https://api.github.com/repos/$REPO/tarball/$BRANCH" | \
        tar -xz --strip-components=2 -C "$TARGET_DIR" --wildcards "*/\.cursor/rules/*"
else
    echo "Error: curl or wget required"
    exit 1
fi

echo ""
echo "Genie installed successfully!"
echo ""
echo "Next steps:"
echo "  1. Open this project in Cursor"
echo "  2. Run: genie init"
echo ""
echo "Documentation: https://github.com/$REPO"
