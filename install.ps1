# Installation Script: OpenCode AI Mode (Windows)

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
$AgentDir = ".opencode\agent"
New-Item -ItemType Directory -Force -Path $ToolsDir
New-Item -ItemType Directory -Force -Path $AgentDir
New-Item -ItemType Directory -Force -Path ".opencode\backups"
New-Item -ItemType Directory -Force -Path ".opencode\snapshots"

# 2. Copy Tools
Write-Host "Copying Tools..."
Copy-Item "install_payload\tools\*" -Destination $ToolsDir -Force -Recurse

# 3. Install Dependencies
Write-Host "Installing Dependencies..."
Set-Location -Path $GlobalConfig
npm install glob typescript @opencode-ai/plugin --force

# 4. Agent Refresh
Write-Host "Updating Agents..."
Copy-Item ".opencode\agent\*" -Destination ".opencode\agent" -Force -Recurse

# 4. Initialize Project
Write-Host "Initializing Project..."
Set-Location -Path $PSScriptRoot
# Assuming opencode CLI is in path
opencode run "MAP(root)"

Write-Host "Installation Complete."

