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
$LocalToolsDir = ".opencode\tools"
$AgentDir = ".opencode\agent"
$AgentsDir = ".opencode\agents"
New-Item -ItemType Directory -Force -Path $ToolsDir
New-Item -ItemType Directory -Force -Path $LocalToolsDir
New-Item -ItemType Directory -Force -Path $AgentDir
New-Item -ItemType Directory -Force -Path $AgentsDir
New-Item -ItemType Directory -Force -Path ".opencode\backups"
New-Item -ItemType Directory -Force -Path ".opencode\snapshots"

# 2. Copy Tools
Write-Host "Copying Tools..."
Copy-Item "install_payload\tools\*" -Destination $ToolsDir -Force -Recurse
Copy-Item "install_payload\tools\*" -Destination $LocalToolsDir -Force -Recurse
Copy-Item ".opencode\agent\*" -Destination $AgentsDir -Force -Recurse

# 3. Install Dependencies
Write-Host "Installing Dependencies..."
Push-Location -Path $GlobalConfig
npm install typescript @types/node @opencode-ai/plugin --force
Pop-Location

# 4. Initialize Project
Write-Host "Initializing Project..."
# Assuming opencode CLI is in path
opencode run "MAP(root)"

Write-Host "Installation Complete."

