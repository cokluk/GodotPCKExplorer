# Build Godot PCK Explorer + PCK Bruteforcer (all variants).
# Needs .NET 9 SDK. Run from repo root:  .\scripts\build.ps1
# Output goes to .\build\

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$verExplorer = (Get-Content "version.txt").Trim()
$verBf = (Get-Content "Bruteforcer\bruteforcer_version.txt").Trim()
$outRoot = Join-Path $root "build"

function Strip-DebugFiles($dir) {
    Get-ChildItem $dir -Recurse -Include *.pdb, *.exp, *.lib -File -EA SilentlyContinue |
        Remove-Item -Force -EA SilentlyContinue
}

# mbedTLS ships all platforms; leave only the one we need
function Trim-MbedTls($dir, $keep) {
    $mbed = Join-Path $dir "mbedTLS"
    if (-not (Test-Path $mbed)) { return }
    Get-ChildItem $mbed -Directory | Where-Object Name -ne $keep | Remove-Item -Recurse -Force
}

function Publish-DotnetApp($proj, $folder) {
    $dest = Join-Path $outRoot $folder
    Write-Host "Building $folder ..."
    dotnet publish $proj -c Release --self-contained false -p:UseAppHost=true -o $dest
    if ($LASTEXITCODE) { exit $LASTEXITCODE }
    Strip-DebugFiles $dest
}

function Publish-ExplorerNative($profile, $folder, $mbed) {
    $dest = Join-Path $outRoot $folder
    Write-Host "Building $folder ..."
    dotnet publish Explorer/Console/GodotPCKExplorer.Console.csproj -p:PublishProfile=$profile -o $dest
    if ($LASTEXITCODE) { exit $LASTEXITCODE }
    Strip-DebugFiles $dest
    Trim-MbedTls $dest $mbed
}

function Publish-BfNative($rid, $folder, $mbed) {
    $dest = Join-Path $outRoot $folder
    Write-Host "Building $folder ..."
    dotnet publish Bruteforcer/Console/PCKBruteforcer.Console.csproj `
        -c Release -r $rid --self-contained true `
        -p:PublishSingleFile=true -p:PublishTrimmed=false `
        -o $dest
    if ($LASTEXITCODE) { exit $LASTEXITCODE }
    Strip-DebugFiles $dest
    Trim-MbedTls $dest $mbed
}

# wipe previous output
if (Test-Path $outRoot) { Remove-Item $outRoot -Recurse -Force }
New-Item -ItemType Directory -Path $outRoot | Out-Null

$ex = "GodotPCKExplorer_$verExplorer"
$bf = "PCKBruteforcer_$verBf"

# --- Explorer ---
Publish-DotnetApp "Explorer/UI/GodotPCKExplorer.UI.csproj" "${ex}_dotnet-ui-win"
# UI build pulls in the console exe; drop it from the UI folder
Get-ChildItem (Join-Path $outRoot "${ex}_dotnet-ui-win") -Filter "GodotPCKExplorer.Console*" -File |
    Remove-Item -Force

Publish-DotnetApp "Explorer/Console/GodotPCKExplorer.Console.csproj" "${ex}_dotnet-console-win-linux-mac"

Publish-ExplorerNative Win64   "${ex}_native-console-win-x64"        win_x64
Publish-ExplorerNative Win86   "${ex}_native-console-win-x86"        win_x86
Publish-ExplorerNative Linux64 "${ex}_native-console-linux-x64"      linux_x64
Publish-ExplorerNative Mac64   "${ex}_native-console-mac-x64"        mac_universal
Publish-ExplorerNative MacArm  "${ex}_native-console-mac-arm64"      mac_universal

# --- Bruteforcer ---
Publish-DotnetApp "Bruteforcer/UI/PCKBruteforcer.UI.csproj" "${bf}_dotnet-ui-win"
Get-ChildItem (Join-Path $outRoot "${bf}_dotnet-ui-win") -Filter "PCKBruteforcer.Console*" -File |
    Remove-Item -Force

Publish-DotnetApp "Bruteforcer/Console/PCKBruteforcer.Console.csproj" "${bf}_dotnet-console-win-linux-mac"

Publish-BfNative win-x64   "${bf}_native-console-win-x64"   win_x64
Publish-BfNative win-x86   "${bf}_native-console-win-x86"   win_x86
Publish-BfNative linux-x64 "${bf}_native-console-linux-x64" linux_x64
Publish-BfNative osx-x64   "${bf}_native-console-mac-x64"   mac_universal
Publish-BfNative osx-arm64 "${bf}_native-console-mac-arm64" mac_universal

Write-Host ""
Write-Host "Done. Folders under: $outRoot"
Get-ChildItem $outRoot -Directory | ForEach-Object { Write-Host "  $($_.Name)" }
