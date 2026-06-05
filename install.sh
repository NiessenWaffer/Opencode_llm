#!/bin/bash
# Installation Script: OpenCode AI Mode (Unix)

GLOBAL_CONFIG="$HOME/.config/opencode"
TOOLS_DIR="$GLOBAL_CONFIG/tools"
LOCAL_TOOLS_DIR=".opencode/tools"
AGENT_DIR=".opencode/agent"
AGENTS_DIR=".opencode/agents"

# 1. Pre-flight Check
echo "Cleaning existing environment..."
rm -rf "$GLOBAL_CONFIG/node_modules"
rm -f "$GLOBAL_CONFIG/package-lock.json"

echo "Creating Directories..."
mkdir -p "$TOOLS_DIR"
mkdir -p "$LOCAL_TOOLS_DIR"
mkdir -p "$AGENT_DIR"
mkdir -p "$AGENTS_DIR"
mkdir -p ".opencode/backups"
mkdir -p ".opencode/snapshots"

echo "Copying Tools..."
cp -rf install_payload/tools/* "$TOOLS_DIR/"
cp -rf install_payload/tools/* "$LOCAL_TOOLS_DIR/"
cp -rf .opencode/agent/* "$AGENTS_DIR/"

echo "Installing Dependencies..."
cd "$GLOBAL_CONFIG"
npm install typescript @types/node @opencode-ai/plugin --force

echo "Initializing Project..."
cd - > /dev/null
opencode run "MAP(root)"

echo "Installation Complete."
