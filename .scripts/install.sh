#!/bin/bash
#
# Genie Installer for macOS/Linux
# Usage: curl -fsSL https://raw.githubusercontent.com/glvent/Genie/main/install.sh | bash
#

set -e

REPO="glvent/Genie"
BRANCH="main"

CURSOR_DIR=".cursor/rules"
TEMPLATES_DIR=".templates"

echo "Installing Genie..."

# Check if .cursor/rules already exists
if [ -d "$CURSOR_DIR" ]; then
    printf "%s already exists. Overwrite? (y/N) " "$CURSOR_DIR"
    read -n 1 -r REPLY < /dev/tty
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
    rm -rf "$CURSOR_DIR"
fi

# Check if .templates already exists
if [ -d "$TEMPLATES_DIR" ]; then
    printf "%s already exists. Overwrite? (y/N) " "$TEMPLATES_DIR"
    read -n 1 -r REPLY < /dev/tty
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
    rm -rf "$TEMPLATES_DIR"
fi

# Create directory
mkdir -p "$CURSOR_DIR"
mkdir -p "$TEMPLATES_DIR"

# Download and extract rules
echo "Downloading Genie..."

if command -v curl &> /dev/null; then
    curl -sL "https://api.github.com/repos/$REPO/tarball/$BRANCH" | \
        tar -xz --strip-components=1 -C "." --wildcards "*/.cursor/rules/*" "*/.templates/*"
elif command -v wget &> /dev/null; then
    wget -qO- "https://api.github.com/repos/$REPO/tarball/$BRANCH" | \
        tar -xz --strip-components=1 -C "." --wildcards "*/.cursor/rules/*" "*/.templates/*"
else
    echo "Error: curl or wget required"
    exit 1
fi

echo ""
echo "Genie installed successfully!"
echo ""
echo "Open this project in Cursor and run 'genie init' within the agent chat to get started."
echo ""
echo "Documentation: https://github.com/$REPO"