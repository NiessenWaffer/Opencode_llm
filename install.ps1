# Installation Script: OpenCode AI Mode (Windows)

# Get script location for reliable pathing
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# 1. Pre-flight Check: Clean environment
Write-Host "Checking environment integrity..."
$GlobalConfig = "$env:USERPROFILE\.config\opencode"
if (Test-Path "$GlobalConfig\node_modules") {
    Write-Host "Cleaning existing dependencies..."
    Remove-Item -Path "$GlobalConfig\node_modules" -Recurse -Force
    Remove-Item -Path "$GlobalConfig\package-lock.json" -ErrorAction SilentlyContinue
}

# 2. Setup Directories
Write-Host "Creating Directories..."
$ToolsDir = "$GlobalConfig\tools"
$AgentDir = "$GlobalConfig\agent"
$AgentsDir = "$GlobalConfig\agents"
New-Item -ItemType Directory -Force -Path $ToolsDir
New-Item -ItemType Directory -Force -Path $AgentDir
New-Item -ItemType Directory -Force -Path $AgentsDir
New-Item -ItemType Directory -Force -Path "$GlobalConfig\backups"
New-Item -ItemType Directory -Force -Path "$GlobalConfig\snapshots"

# 2. Copy Tools (Global Only)
Write-Host "Copying Tools to Global Config..."
$SourceTools = Join-Path -Path $ScriptDir -ChildPath "install_payload\tools\*"
Copy-Item -Path $SourceTools -Destination $ToolsDir -Force -Recurse

# 3. Install Dependencies
Write-Host "Installing Dependencies..."
Push-Location -Path $GlobalConfig
npm install typescript @types/node @opencode-ai/plugin --force
Pop-Location

# 4. Initialize Project
Write-Host "Installation Complete. Tools installed to: $GlobalConfig\tools"
Write-Host "Please add $ToolsDir to your system PATH to access tools globally."

