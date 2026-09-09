# 仅检查骨架并展示待实现步骤，不修改工具配置。
[CmdletBinding()]
param(
    [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9_-]*$')]
    [string]$Profile = 'base'
)
$ErrorActionPreference = 'Stop'
$repoRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$profilePath = Join-Path $repoRoot "profiles/$Profile.yaml"
if (-not (Test-Path -LiteralPath $profilePath -PathType Leaf)) {
    throw "找不到 profile：$profilePath"
}
foreach ($name in @('config', 'skills', 'rules', 'plugins', 'mcp', 'memory', 'profiles', 'scripts')) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $name) -PathType Container)) {
        throw "缺少核心目录：$name"
    }
}
Write-Output "Bastion 骨架检查通过，profile：$Profile"
Write-Output '占位步骤：解析清单 → 校验依赖 → 渲染预览 → 备份 → 应用 → 验证。'
Write-Output '尚未解析或应用 profile；未安装任何工具、插件或 MCP 服务。'
