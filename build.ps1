$hugoCmd = Get-Command hugo -ErrorAction SilentlyContinue
$localHugo = Join-Path $PSScriptRoot "tools\hugo.exe"
if (-not $hugoCmd -and -not (Test-Path $localHugo)) {
  Write-Error "Hugo was not found. Install Hugo Extended or put hugo.exe in the tools folder."
  exit 1
}

Write-Host "Building production site..."
if ($hugoCmd) {
  & hugo --minify
} else {
  & $localHugo --minify
}
Write-Host "Done. Output directory: public/"
