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

# 4. Copy Tools (Global Only)
Write-Host "Copying Tools to Global Config..."
$SourceTools = Join-Path $ExtractedDir "install_payload\tools\*"
Copy-Item -Path $SourceTools -Destination $ToolsDir -Force -Recurse

# 5. Configure CLI
Write-Host "Configuring CLI..."
$ConfigPath = "$GlobalConfig\opencode.jsonc"
$NewConfig = @{
    "`$schema" = "https://opencode.ai/config.json"
    toolsPath = $ToolsDir
}
$NewConfig | ConvertTo-Json | Set-Content -Path $ConfigPath

# 6. Install Dependencies
Write-Host "Installing Dependencies..."
Push-Location -Path $GlobalConfig
npm install typescript @types/node @opencode-ai/plugin --force
Pop-Location

# 7. Cleanup and Finalize
Remove-Item $TempDir -Recurse -Force
Write-Host "Installation Complete. Tools installed to: $ToolsDir"
Write-Host "CLI configured to use: $ToolsDir"

