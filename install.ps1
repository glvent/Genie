#
# Genie Installer for Windows PowerShell
# Usage: irm https://raw.githubusercontent.com/glvent/Genie/main/install.ps1 | iex
#

$ErrorActionPreference = "Stop"

$Repo = "glvent/Genie"
$Branch = "main"
$TargetDir = ".cursor\rules"
$TempZip = "$env:TEMP\genie-temp.zip"
$TempDir = "$env:TEMP\genie-extract"

Write-Host "Installing Genie..." -ForegroundColor Magenta

# Check if .cursor/rules already exists
if (Test-Path $TargetDir) {
    $response = Read-Host "$TargetDir already exists. Overwrite? (y/N)"
    if ($response -ne "y" -and $response -ne "Y") {
        Write-Host "Installation cancelled."
        exit 1
    }
    Remove-Item -Recurse -Force $TargetDir
}

# Create directory
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

# Download repository as zip
Write-Host "Downloading Genie rules..." -ForegroundColor Cyan

$ZipUrl = "https://github.com/$Repo/archive/refs/heads/$Branch.zip"
Invoke-WebRequest -Uri $ZipUrl -OutFile $TempZip

# Extract
if (Test-Path $TempDir) {
    Remove-Item -Recurse -Force $TempDir
}
Expand-Archive -Path $TempZip -DestinationPath $TempDir

# Find and copy rules
$ExtractedRules = Get-ChildItem -Path $TempDir -Recurse -Directory | Where-Object { $_.Name -eq "rules" -and $_.Parent.Name -eq ".cursor" } | Select-Object -First 1

if ($ExtractedRules) {
    Copy-Item -Path "$($ExtractedRules.FullName)\*" -Destination $TargetDir -Recurse -Force
} else {
    Write-Host "Error: Could not find .cursor/rules in downloaded archive" -ForegroundColor Red
    exit 1
}

# Cleanup
Remove-Item -Force $TempZip
Remove-Item -Recurse -Force $TempDir

Write-Host ""
Write-Host "Genie installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open this project in Cursor"
Write-Host "  2. Run: genie init"
Write-Host ""
Write-Host "Documentation: https://github.com/$Repo" -ForegroundColor Blue
