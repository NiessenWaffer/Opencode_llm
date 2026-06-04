#!/bin/bash
# Installation Script: OpenCode AI Mode (Unix)

GLOBAL_CONFIG="$HOME/.config/opencode"
TOOLS_DIR="$GLOBAL_CONFIG/tools"
AGENT_DIR=".opencode/agent"

echo "Creating Directories..."
mkdir -p "$TOOLS_DIR"
mkdir -p "$AGENT_DIR"
mkdir -p ".opencode/backups"
mkdir -p ".opencode/snapshots"

echo "Copying Tools..."
cp install_payload/tools/* "$TOOLS_DIR/"

echo "Installing Dependencies..."
cd "$GLOBAL_CONFIG"
npm install glob typescript @opencode-ai/plugin

echo "Initializing Project..."
cd - > /dev/null
opencode run "MAP(root)"

echo "Installation Complete."
