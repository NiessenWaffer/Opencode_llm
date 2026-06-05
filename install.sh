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

# 2. Copy Tools and Agents (Global Only)
echo "Copying Tools and Agents to Global Config..."
cp -rf "$EXTRACTED_DIR/install_payload/tools/"* "$TOOLS_DIR/"
cp -rf "$EXTRACTED_DIR/.opencode/agents/"* "$GLOBAL_CONFIG/agents/"

# 3. Configure CLI with Global Commands
echo "Configuring CLI with global commands..."
cat > "$GLOBAL_CONFIG/opencode.jsonc" << 'CONFIGEOF'
{
  "$schema": "https://opencode.ai/config.json",

  "command": {
    "developer": {
      "description": "Run implementation workflow with the Developer agent",
      "template": "Use Developer mode for implementation. Follow RULES.md <IMPLEMENTATION>, <SAFETY>, and <LEXICON>. User request: $ARGUMENTS",
      "agent": "developer"
    },
    "debugger": {
      "description": "Run debugging workflow with the Debugger agent",
      "template": "Use Debugger mode for scientific error triage. Follow RULES.md <DEBUGGING>, <SAFETY>, and <LEXICON>. User request: $ARGUMENTS",
      "agent": "debugger"
    },
    "planning": {
      "description": "Run planning workflow with the Planning agent",
      "template": "Use Planning mode for architecture and project management. Follow RULES.md <PLANNING>, <COMPLEXITY>, <ARTIFACTS>, and <LEXICON>. Produce or update plan.md, workflow.md, and task.md when the request requires planning. User request: $ARGUMENTS",
      "agent": "planning",
      "subtask": false
    },
    "study": {
      "description": "Run study workflow with the Study agent",
      "template": "Use Study mode for read-only code education and architectural analysis. Follow the Study agent depth protocol and ask comprehension checks before advancing levels. User request: $ARGUMENTS",
      "agent": "study",
      "subtask": false
    },
    "suggestion": {
      "description": "Run read-only optimization workflow with the Suggestion agent",
      "template": "Use Suggestion mode for read-only optimization advice. Do not edit files. Follow RULES.md <MODES>, <APPROVAL>, and <LEXICON>. User request: $ARGUMENTS",
      "agent": "suggestion",
      "subtask": false
    },
    "model": {
      "description": "Show current AI model or switch to a different model",
      "template": "The user wants to manage the AI model. $ARGUMENTS"
    },
    "agent": {
      "description": "List available agents or switch to a different agent",
      "template": "The user wants to manage agents. $ARGUMENTS"
    },
    "export": {
      "description": "Export conversation, plans, or project artifacts",
      "template": "The user wants to export something. $ARGUMENTS"
    },
    "connect": {
      "description": "Connect to external services, APIs, or remote resources",
      "template": "The user wants to connect to a service. $ARGUMENTS"
    }
  }
}
CONFIGEOF

# 4. Install Dependencies
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
