#!/usr/bin/env bash
# 仅检查骨架并展示待实现步骤，不修改工具配置。
set -euo pipefail
profile='base'
while (( $# > 0 )); do
  case "$1" in
    --profile)
      if (( $# < 2 )); then
        printf '%s\n' '错误：--profile 缺少参数。' >&2
        exit 2
      fi
      profile="$2"
      shift 2
      ;;
    -h|--help)
      printf '%s\n' '用法：bash scripts/linux/bootstrap.sh [--profile 名称]'
      exit 0
      ;;
    *)
      printf '错误：未知参数 %s\n' "$1" >&2
      exit 2
      ;;
  esac
done
if [[ ! "$profile" =~ ^[A-Za-z0-9][A-Za-z0-9_-]*$ ]]; then
  printf '%s\n' '错误：profile 名称仅允许字母、数字、下划线和连字符，且须以字母或数字开头。' >&2
  exit 2
fi
script_dir="${BASH_SOURCE[0]%/*}"
if [[ "$script_dir" == "${BASH_SOURCE[0]}" ]]; then
  script_dir='.'
fi
repo_root="$(cd -- "$script_dir/../.." && pwd)"
if [[ ! -f "$repo_root/profiles/$profile.yaml" ]]; then
  printf '错误：找不到 profile：%s\n' "$profile" >&2
  exit 1
fi
for name in config skills rules plugins mcp memory profiles scripts; do
  if [[ ! -d "$repo_root/$name" ]]; then
    printf '错误：缺少核心目录：%s\n' "$name" >&2
    exit 1
  fi
done
printf 'Bastion 骨架检查通过，profile：%s\n' "$profile"
printf '%s\n' '占位步骤：解析清单 → 校验依赖 → 渲染预览 → 备份 → 应用 → 验证。'
printf '%s\n' '尚未解析或应用 profile；未安装任何工具、插件或 MCP 服务。'
