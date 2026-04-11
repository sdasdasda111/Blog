param(
  [int]$Port = 1313
)

$nodeRoot = Join-Path $PSScriptRoot "tools\node"
$nodeExe = Join-Path $nodeRoot "node.exe"
$npmCmd = Join-Path $nodeRoot "npm.cmd"

if (-not (Test-Path $nodeExe) -or -not (Test-Path $npmCmd)) {
  Write-Error "Portable Node.js not found in tools\\node."
  exit 1
}

$env:Path = "$nodeRoot;$env:Path"

Write-Host "Starting Hexo dev server on port $Port"
& $npmCmd run server -- --port $Port
