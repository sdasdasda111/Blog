param(
  [switch]$Drafts = $true,
  [int]$Port = 1313
)

$hugoCmd = Get-Command hugo -ErrorAction SilentlyContinue
$localHugo = Join-Path $PSScriptRoot "tools\\hugo.exe"
if (-not $hugoCmd -and -not (Test-Path $localHugo)) {
  Write-Error "未找到 Hugo。请先安装 Hugo Extended，或将 hugo.exe 放到 tools 目录。"
  exit 1
}

$draftFlag = ""
if ($Drafts) {
  $draftFlag = "-D"
}

Write-Host "启动 Hugo 开发服务器，端口: $Port"
if ($hugoCmd) {
  hugo server $draftFlag --bind 0.0.0.0 --port $Port
} else {
  & $localHugo server $draftFlag --bind 0.0.0.0 --port $Port
}
