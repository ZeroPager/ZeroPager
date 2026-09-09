# Bastion

把工具配置、可复用能力和长期知识收拢到一座堡垒。

Bastion 是个人 SRE 工作体系仓库骨架：统一管理 Codex、Claude Code、Cursor 等工具配置，沉淀操作手册、可靠性方法、架构决策和演练证据，支持 Windows/Linux、多电脑维护与离线交付。

## 当前状态

这是可扩展的目录骨架。registry/profile 使用 **Bastion 自定义 v1 示例格式**，各工具不会直接读取它们。bootstrap 仅检查目录、展示后续步骤；尚未实现配置渲染、安装、同步、链接、插件下载和回滚。

## 目录结构

```text
bastion/
├── README.md
├── AGENTS.md
├── .gitignore
├── config/                    # 各工具原生配置模板
│   ├── codex/
│   ├── claude/
│   └── cursor/
├── skills/                    # 任务能力，按技能独立维护
│   └── deployment-review/
│       ├── SKILL.md
│       ├── scripts/
│       └── references/
├── rules/                     # 公共行为规范
│   ├── common.md
│   ├── shell.md
│   └── kubernetes.md
├── plugins/                   # 插件清单与自有插件源代码
│   ├── registry.yaml
│   └── local/
├── mcp/                       # MCP 服务清单、模板与自有实现
│   ├── registry.yaml
│   ├── configs/
│   └── servers/
├── memory/                    # 显式维护、可跨工具使用的长期知识
│   ├── index.md
│   ├── user.md
│   ├── environment.example.md
│   ├── projects/
│   ├── incidents/
│   └── decisions/
├── profiles/                  # 按机器用途选择配置集合
│   ├── base.yaml
│   ├── delivery-offline.yaml
│   └── sre.yaml
├── scripts/
│   ├── windows/bootstrap.ps1
│   ├── linux/bootstrap.sh
│   └── shared/
├── roles/                     # 可移植角色描述
├── prompts/                   # 手动使用的提示词
├── hooks/                     # 工具特定生命周期脚本
│   ├── codex/
│   ├── claude/
│   └── cursor/
├── runbooks/                  # 环境检查、交付验收、故障闭环
├── reliability/               # 服务目标、容量成本、灾备恢复
├── architecture/              # 架构评审与正式决策
│   ├── reviews/
│   └── decisions/
├── labs/                      # 隔离演练与验证记录
├── templates/                 # 手册、评审、决策、演练等模板
├── docs/                      # 架构、清单约定与路线图
├── local/                     # 本机覆盖与敏感配置（忽略内容）
└── vendor/                    # 离线依赖载荷（忽略内容）
```

各目录内均有 README.md，说明职责和边界。

## 快速开始

解压后在 bastion 根目录运行：

Windows PowerShell：

```powershell
./scripts/windows/bootstrap.ps1 -Profile base
./scripts/windows/bootstrap.ps1 -Profile delivery-offline
```

Linux：

```bash
bash scripts/linux/bootstrap.sh --profile base
bash scripts/linux/bootstrap.sh --profile delivery-offline
```

脚本成功退出只表示骨架检查通过，不代表工具已完成配置。脚本不访问网络，不修改用户目录，不读取密钥。

如需初始化为 Git 仓库：

```bash
git init
git add .
git commit -m "chore: 初始化 Bastion 配置仓库骨架"
```

## 配置组织方式

1. 在 rules/、skills/、memory/ 中维护共享内容。
2. 在 config/ 中维护各工具原生格式模板，工具差异留在这一层。
3. 在 plugins/registry.yaml 和 mcp/registry.yaml 中登记外部能力。
4. 在 profiles/ 中用明确列表选择所需内容。
5. 后续实现适配器，将所选内容渲染到本机；写入前备份，并保留回滚记录。

## 多电脑与记忆

Git 同步经过整理的偏好、操作规范、项目状态和决策记录。会话历史、内部记忆数据库、缓存、凭据及机器运行状态不进入本仓库。工具是否加载共享内容，需要由后续适配器或项目入口指令明确接入；放入目录并不等于自动加载。

个人本机覆盖和访问令牌放在被忽略的 local/ 中；客户资料和受限信息留在所属环境。提交前人工检查暂存区，.gitignore 不能替代敏感信息检查，也不会移除已跟踪文件。

## 离线交付

delivery-offline profile 表达禁止下载、使用本地载荷的意图。后续安装器应校验版本、SHA-256 和依赖完整性；载荷统一放 vendor/，真实私有仓库地址由 local/ 覆盖。详细约定见 [架构说明](docs/architecture.md)、[清单格式](docs/manifests.md) 和 [实施路线](docs/roadmap.md)。

## SRE 工作入口

- [操作手册](runbooks/README.md)：先完善环境检查、交付验收、故障闭环三个草稿。
- [可靠性工程](reliability/README.md)：逐步补齐服务目标、容量成本和恢复能力。
- [架构决策](architecture/README.md)：记录需求、选型取舍、成本风险和退出条件。
- [演练验证](labs/README.md)：在隔离环境记录实测证据。
- [资产状态](docs/asset-lifecycle.md)与[知识边界](docs/knowledge-boundaries.md)：区分草稿和验证结果、公共经验与项目资料。

新增文档均为 draft，未执行集群操作或恢复演练。先补齐一个实际场景，再验证、脱敏、沉淀，不按目录数量衡量成熟度。

运行 `./scripts/windows/bootstrap.ps1 -Profile sre` 或 `bash scripts/linux/bootstrap.sh --profile sre` 可检查新 profile 的骨架。profile 仍不解析或自动加载新增文档；任务需要时按上述入口读取。
