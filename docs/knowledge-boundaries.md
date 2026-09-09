# 知识与工具边界

## 各类内容放在哪里

| 内容 | 位置 |
| --- | --- |
| 个人偏好、长期方向 | memory/user.md |
| 可复用经验摘要 | memory/knowledge/ |
| 项目状态和下一步 | memory/projects/，逐项目显式选择 |
| 规范操作步骤 | runbooks/ |
| 正式架构决策 | architecture/decisions/ |
| 脱敏复盘 | memory/incidents/ |
| 实测过程 | labs/ |
| 仓库安装与维护 | scripts/ |
| 具体技能的小型辅助脚本 | 对应 skills/*/scripts/ |

成熟的巡检、备份、采集程序可以独立建仓库，在 docs/tool-catalog.md 登记，不塞进 bootstrap。公共知识与工具原生入口通过适配器衔接。

## 可迁移范围

只沉淀有权复用的通用方法、个人经验及脱敏案例。客户日志、凭据、真实拓扑和受限文档留在所属环境；不要将 local/ 当作客户资料归档区。

profile 中的 memory 使用显式文件列表，不默认加载整个 projects/。切换项目时重新选择上下文，避免把一个环境的结论应用到另一个环境。
