param(
  [switch]$Drafts = $true,
  [int]$Port = 1313
)

$hugoCmd = Get-Command hugo -ErrorAction SilentlyContinue
$localHugo = Join-Path $PSScriptRoot "tools\hugo.exe"
if (-not $hugoCmd -and -not (Test-Path $localHugo)) {
  Write-Error "Hugo was not found. Install Hugo Extended or put hugo.exe in the tools folder."
  exit 1
}

$args = @("server", "--bind", "0.0.0.0", "--port", $Port)
if ($Drafts) {
  $args += "-D"
}

Write-Host "Starting Hugo dev server on port $Port"
if ($hugoCmd) {
  & hugo @args
} else {
  & $localHugo @args
}
