#!/bin/bash
# Installation Script: OpenCode AI Mode (Unix)

GLOBAL_CONFIG="$HOME/.config/opencode"
TOOLS_DIR="$GLOBAL_CONFIG/tools"
TEMP_DIR=$(mktemp -d)

# Cleanup on exit
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "Downloading and extracting toolchain..."
curl -L https://github.com/NiessenWaffer/Opencode_llm/archive/refs/heads/main.zip -o "$TEMP_DIR/main.zip"
unzip -q "$TEMP_DIR/main.zip" -d "$TEMP_DIR"
EXTRACTED_DIR="$TEMP_DIR/Opencode_llm-main"

# 1. Setup Directories
echo "Creating Directories..."
mkdir -p "$TOOLS_DIR"
mkdir -p "$GLOBAL_CONFIG/agent"
mkdir -p "$GLOBAL_CONFIG/agents"
mkdir -p "$GLOBAL_CONFIG/backups"
mkdir -p "$GLOBAL_CONFIG/snapshots"

# 2. Copy Tools (Global Only)
echo "Copying Tools to Global Config..."
cp -rf "$EXTRACTED_DIR/install_payload/tools/"* "$TOOLS_DIR/"

# 3. Install Dependencies
echo "Installing Dependencies..."
if [ -d "$GLOBAL_CONFIG/node_modules" ]; then
    rm -rf "$GLOBAL_CONFIG/node_modules"
    rm -f "$GLOBAL_CONFIG/package-lock.json"
fi
cd "$GLOBAL_CONFIG"
npm install typescript @types/node @opencode-ai/plugin --force

echo "Installation Complete."
echo "Tools installed to: $TOOLS_DIR"
echo "Please add $TOOLS_DIR to your PATH to access tools globally."
