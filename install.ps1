# Installation Script: OpenCode AI Mode (Windows)

# 1. Pre-flight Check: Clean environment
Write-Host "Checking environment integrity..."
$GlobalConfig = "$env:USERPROFILE\.config\opencode"
$TempDir = Join-Path $env:TEMP "opencode-install"
if (Test-Path $TempDir) { Remove-Item $TempDir -Recurse -Force }
New-Item -ItemType Directory -Force -Path $TempDir

# 2. Download and Extract Payload
Write-Host "Downloading Toolchain..."
$ZipPath = Join-Path $TempDir "main.zip"
Invoke-WebRequest -Uri "https://github.com/NiessenWaffer/Opencode_llm/archive/refs/heads/main.zip" -OutFile $ZipPath
Expand-Archive -Path $ZipPath -DestinationPath $TempDir
$ExtractedDir = Join-Path $TempDir "Opencode_llm-main"

if (Test-Path "$GlobalConfig\node_modules") {
    Write-Host "Cleaning existing dependencies..."
    Remove-Item -Path "$GlobalConfig\node_modules" -Recurse -Force
    Remove-Item -Path "$GlobalConfig\package-lock.json" -ErrorAction SilentlyContinue
}

# 3. Setup Directories
Write-Host "Creating Directories..."
$ToolsDir = "$GlobalConfig\tools"
$AgentDir = "$GlobalConfig\agent"
$AgentsDir = "$GlobalConfig\agents"
New-Item -ItemType Directory -Force -Path $ToolsDir
New-Item -ItemType Directory -Force -Path $AgentDir
New-Item -ItemType Directory -Force -Path $AgentsDir
New-Item -ItemType Directory -Force -Path "$GlobalConfig\backups"
New-Item -ItemType Directory -Force -Path "$GlobalConfig\snapshots"

# 4. Copy Tools and Agents (Global Only)
Write-Host "Copying Tools and Agents to Global Config..."
$SourceTools = Join-Path $ExtractedDir "install_payload\tools\*"
$SourceAgents = Join-Path $ExtractedDir ".opencode\agents\*"
Copy-Item -Path $SourceTools -Destination $ToolsDir -Force -Recurse
Copy-Item -Path $SourceAgents -Destination $AgentsDir -Force -Recurse

# 5. Configure CLI with Global Commands
Write-Host "Configuring CLI..."
$ConfigPath = "$GlobalConfig\opencode.jsonc"
@'
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
'@ | Set-Content -Path $ConfigPath

# 6. Install Dependencies
Write-Host "Installing Dependencies..."
Push-Location -Path $GlobalConfig
npm install typescript @types/node @opencode-ai/plugin --force
Pop-Location

# 7. Cleanup and Finalize
Remove-Item $TempDir -Recurse -Force
Write-Host "Installation Complete. Tools and Agents installed to: $GlobalConfig"
Write-Host "CLI configured to use: $ToolsDir"
