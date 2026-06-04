#!/bin/bash
# Installation Script: OpenCode AI Mode (Unix)

GLOBAL_CONFIG="$HOME/.config/opencode"
TOOLS_DIR="$GLOBAL_CONFIG/tools"
AGENT_DIR=".opencode/agent"

# 1. Pre-flight Check
echo "Cleaning existing environment..."
rm -rf "$GLOBAL_CONFIG/node_modules"
rm -f "$GLOBAL_CONFIG/package-lock.json"

echo "Creating Directories..."
mkdir -p "$TOOLS_DIR"
mkdir -p "$AGENT_DIR"
mkdir -p ".opencode/backups"
mkdir -p ".opencode/snapshots"

echo "Copying Tools..."
cp -rf install_payload/tools/* "$TOOLS_DIR/"

echo "Installing Dependencies..."
cd "$GLOBAL_CONFIG"
npm install glob typescript @opencode-ai/plugin --force

echo "Updating Agents..."
cp -rf .opencode/agent/* "$AGENT_DIR/"

echo "Initializing Project..."
cd - > /dev/null
opencode run "MAP(root)"

echo "Installation Complete."
