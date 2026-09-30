<#
    setup-windows.ps1

    Downloads the w64devkit toolchain (gcc + make + unix tools) into
    external\w64devkit and initializes the raylib submodule, so Windows
    users can build bszgame without installing anything system-wide.

    Usage (from the repo root):
        powershell -ExecutionPolicy Bypass -File tools\setup-windows.ps1
#>

$ErrorActionPreference = "Stop"

# Pinned version so setups are reproducible. Bump when you want a newer toolchain.
$W64Version = "2.10.0"
$Asset      = "w64devkit-x64-$W64Version.7z.exe"
$Url        = "https://github.com/skeeto/w64devkit/releases/download/v$W64Version/$Asset"

# Resolve repo root (parent of this script's folder).
$RepoRoot   = Split-Path -Parent $PSScriptRoot
$External   = Join-Path $RepoRoot "external"
$DevkitDir  = Join-Path $External "w64devkit"
$Installer  = Join-Path $External $Asset

Write-Host "==> bszgame Windows setup" -ForegroundColor Cyan

# 1. Make sure the raylib submodule is present.
Write-Host "==> Initializing raylib submodule..."
& git -C $RepoRoot submodule update --init --recursive
if ($LASTEXITCODE -ne 0) { throw "git submodule update failed" }

# 2. Download + extract w64devkit (skip if already present).
$Gcc = Join-Path $DevkitDir "bin\gcc.exe"
if (Test-Path $Gcc) {
    Write-Host "==> w64devkit already installed at $DevkitDir" -ForegroundColor Green
} else {
    New-Item -ItemType Directory -Force -Path $External | Out-Null

    Write-Host "==> Downloading w64devkit v$W64Version (~90 MB)..."
    Invoke-WebRequest -Uri $Url -OutFile $Installer

    Write-Host "==> Extracting toolchain..."
    # The asset is a 7-Zip self-extracting archive. -y = assume yes, -o = output dir.
    # It unpacks a "w64devkit" folder into the target directory.
    & $Installer -y "-o$External" | Out-Null
    if (-not (Test-Path $Gcc)) { throw "Extraction did not produce $Gcc" }

    Remove-Item $Installer -Force
    Write-Host "==> Toolchain ready at $DevkitDir" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setup complete. Build & run with:" -ForegroundColor Cyan
Write-Host "    .\build.bat"
