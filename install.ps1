# Installation Script: OpenCode AI Mode (Windows)

# 1. Setup Directories
$GlobalConfig = "$env:USERPROFILE\.config\opencode"
$ToolsDir = "$GlobalConfig\tools"
$AgentDir = ".opencode\agent"

Write-Host "Creating Directories..."
New-Item -ItemType Directory -Force -Path $ToolsDir
New-Item -ItemType Directory -Force -Path $AgentDir
New-Item -ItemType Directory -Force -Path ".opencode\backups"
New-Item -ItemType Directory -Force -Path ".opencode\snapshots"

# 2. Copy Tools
Write-Host "Copying Tools..."
Copy-Item "install_payload\tools\*" -Destination $ToolsDir -Force

# 3. Install Dependencies
Write-Host "Installing Dependencies..."
Set-Location -Path $GlobalConfig
npm install glob typescript @opencode-ai/plugin

# 4. Initialize Project
Write-Host "Initializing Project..."
Set-Location -Path $PSScriptRoot
# Assuming opencode CLI is in path
opencode run "MAP(root)"

Write-Host "Installation Complete."
