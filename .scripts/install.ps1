#
# Genie Installer for Windows PowerShell
# Usage: irm https://raw.githubusercontent.com/glvent/Genie/main/install.ps1 | iex
#

$ErrorActionPreference = "Stop"

$Repo = "glvent/Genie"
$Branch = "main"
$RulesDir = ".cursor\rules"
$TemplatesDir = ".templates"
$TempZip = "$env:TEMP\genie-temp.zip"
$TempDir = "$env:TEMP\genie-extract"

Write-Host "Installing Genie..." -ForegroundColor Magenta

# Check if .cursor/rules already exists
if (Test-Path $RulesDir) {
    $response = Read-Host "$RulesDir already exists. Overwrite? (y/N)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Installation cancelled."
        exit 1
    }
    Remove-Item -Recurse -Force $RulesDir
}

# Check if .templates already exists
if (Test-Path $TemplatesDir) {
    $response = Read-Host "$TemplatesDir already exists. Overwrite? (y/N)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Installation cancelled."
        exit 1
    }
    Remove-Item -Recurse -Force $TemplatesDir
}

# Download repository as zip
Write-Host "Downloading Genie..." -ForegroundColor Cyan

$ZipUrl = "https://github.com/$Repo/archive/refs/heads/$Branch.zip"
Invoke-WebRequest -Uri $ZipUrl -OutFile $TempZip

# Extract
if (Test-Path $TempDir) {
    Remove-Item -Recurse -Force $TempDir
}
Expand-Archive -Path $TempZip -DestinationPath $TempDir

# Find the extracted root folder
$ExtractedRoot = Get-ChildItem -Path $TempDir -Directory | Select-Object -First 1

if (-not $ExtractedRoot) {
    Write-Host "Error: Could not find extracted content" -ForegroundColor Red
    exit 1
}

# Copy .cursor/rules
$ExtractedRules = Join-Path $ExtractedRoot.FullName ".cursor\rules"
if (Test-Path $ExtractedRules) {
    New-Item -ItemType Directory -Force -Path $RulesDir | Out-Null
    Copy-Item -Path "$ExtractedRules\*" -Destination $RulesDir -Recurse -Force
} else {
    Write-Host "Error: Could not find .cursor/rules in downloaded archive" -ForegroundColor Red
    exit 1
}

# Copy .templates
$ExtractedTemplates = Join-Path $ExtractedRoot.FullName ".templates"
if (Test-Path $ExtractedTemplates) {
    New-Item -ItemType Directory -Force -Path $TemplatesDir | Out-Null
    Copy-Item -Path "$ExtractedTemplates\*" -Destination $TemplatesDir -Recurse -Force
} else {
    Write-Host "Warning: Could not find .templates in downloaded archive" -ForegroundColor Yellow
}

# Cleanup
Remove-Item -Force $TempZip
Remove-Item -Recurse -Force $TempDir

Write-Host ""
Write-Host "Genie installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Open this project in Cursor and run 'genie init' within the agent chat to get started."
Write-Host ""
Write-Host "Documentation: https://github.com/$Repo" -ForegroundColor Blue