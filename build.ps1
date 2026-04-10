$hugoCmd = Get-Command hugo -ErrorAction SilentlyContinue
$localHugo = Join-Path $PSScriptRoot "tools\\hugo.exe"
if (-not $hugoCmd -and -not (Test-Path $localHugo)) {
  Write-Error "未找到 Hugo。请先安装 Hugo Extended，或将 hugo.exe 放到 tools 目录。"
  exit 1
}

Write-Host "构建生产站点..."
if ($hugoCmd) {
  hugo --minify
} else {
  & $localHugo --minify
}
Write-Host "完成，输出目录: public/"
