# 🚨 ZeroPager

> **Less toil. Fewer pages. Better sleep.**  
> **少一点重复劳动，少一点深夜告警，多一点踏实睡眠。**

![阶段：骨架建设](https://img.shields.io/badge/status-scaffolding-orange)
![方向：SRE](https://img.shields.io/badge/focus-SRE-blue)
![环境：Windows / Linux](https://img.shields.io/badge/platform-Windows%20%7C%20Linux-informational)

**ZeroPager 是面向 SRE 的个人工具配置与工程知识仓库。**

统一维护 Codex、Claude Code、Cursor 等工具所需的配置、Skills、Rules、Plugins、MCP 和显式记忆，同时沉淀操作手册、可靠性方案、架构决策与演练证据。

换电脑时恢复熟悉的工作环境，接手系统时复用验证过的方法，处理完故障后留下下一次能用的经验。

**名字叫 ZeroPager，目标是减少需要半夜爬起来处理的问题。该响的告警，仍然要响。**

---

## 🛠️ 为什么需要 ZeroPager？

- **配置跟着人走**：共享内容集中维护，工具差异留在各自的适配层。
- **经验能够复用**：把排障、交付和恢复经验整理成手册，避免每次从聊天记录里重新找答案。
- **判断有据可查**：记录验证环境、架构取舍和演练结果，明确哪些结论仍然适用。
- **从交付走向可靠性设计**：逐步积累服务目标、容量成本、灾备和架构决策能力。

核心思路：**用规则约束操作，用技能组织任务，用手册沉淀方法，用演练验证结论。**

## 🚧 当前能做什么？

当前处于**仓库骨架建设阶段**。

| 已有内容 | 当前边界 |
| --- | --- |
| 共享规则、部署审查 Skill 和工具配置目录 | 工具配置目录主要是职责说明，尚未实现自动接入 |
| 插件与 MCP registry 示例 | 使用仓库自定义格式，示例服务和插件未启用 |
| 三个 profile 示例 | 用于描述选择范围，尚无解析器与安装器 |
| Windows / Linux bootstrap | 仅检查核心目录和 profile 文件是否存在 |
| SRE 手册、可靠性方案与演练模板 | 保持 `draft`，需要结合实际环境补齐并验证 |

自动配置、插件安装、告警处理、生产排障执行与回滚仍是后续工作。当前不承诺自动降低 MTTR 或实现无人值守运维。

## 📂 仓库结构

```text
ZeroPager/
├── AGENTS.md                  # 仓库协作规范
├── config/                    # 工具原生配置与适配位置
│   ├── codex/
│   ├── claude/
│   └── cursor/
├── skills/                    # 可复用任务能力
│   └── deployment-review/     # 部署方案审查示例
├── rules/                     # 通用、Shell、Kubernetes、SRE 规范
├── plugins/                   # 插件 registry 与自有插件位置
├── mcp/                       # MCP 服务 registry、配置草稿与实现位置
├── memory/                    # 个人偏好、经验摘要与项目上下文
├── profiles/                  # base / sre / delivery-offline
├── scripts/                   # 仓库引导与维护脚本
│   ├── windows/
│   ├── linux/
│   └── shared/
├── runbooks/                  # 环境检查、交付验收、故障闭环
├── reliability/               # 服务目标、容量成本、灾备恢复
├── architecture/              # 架构评审与决策记录
├── labs/                      # 隔离演练与验证记录
├── roles/                     # 可复用角色职责
├── prompts/                   # 手动使用的提示词
├── hooks/                     # 工具特定 Hook 预留目录
├── templates/                 # 手册、复盘、评审、决策与演练模板
├── docs/                      # 架构、格式约定与实施路线
├── local/                     # 本机覆盖，除 README 外不纳入 Git
└── vendor/                    # 离线载荷，除 README 外不纳入 Git
```

这里的 **MCP** 指 Model Context Protocol。生产拓扑和告警路由目前没有实现，不属于现有功能。

## 🚀 快速开始

### 1. 获取仓库

```bash
git clone https://github.com/ZeroPager/ZeroPager.git
cd ZeroPager
```

### 2. 检查骨架

Windows PowerShell：

```powershell
./scripts/windows/bootstrap.ps1 -Profile sre
```

Linux / Git Bash：

```bash
bash scripts/linux/bootstrap.sh --profile sre
```

脚本成功仅表示目录与所选 profile 文件存在，**不会安装工具、解析清单或修改本机配置**。

| Profile | 用途 |
| --- | --- |
| [`base`](profiles/base.yaml) | 日常开发基础配置 |
| [`sre`](profiles/sre.yaml) | SRE 日常工作与可靠性改进 |
| [`delivery-offline`](profiles/delivery-offline.yaml) | Kubernetes 私有化与离线交付 |

### 3. 从一个真实场景开始

1. 阅读 [环境检查草稿](runbooks/environment-check.md)，补齐目标环境、命令与通过条件。
2. 在隔离环境执行验证，记录实际版本和脱敏证据。
3. 按 [资产状态约定](docs/asset-lifecycle.md) 更新文档状态。
4. 将经验摘要写入 `memory/`，引用完整手册，避免维护多份步骤。

当前可以手动向工具提供所需规则或文档；放入本仓库不代表工具会自动读取。各工具的加载入口需后续适配与验证。

## 🧭 SRE 工作入口

| 你要做的事 | 从这里开始 |
| --- | --- |
| 接手环境、部署前检查 | [环境检查](runbooks/environment-check.md) |
| 上线验收、确认交付质量 | [交付验收](runbooks/delivery-acceptance.md) |
| 处理故障并形成改进项 | [故障闭环](runbooks/incident-response.md) |
| 明确可靠性目标 | [服务目标](reliability/service-objectives.md) |
| 评估增长与资源投入 | [容量与成本](reliability/capacity-cost.md) |
| 验证备份确实能恢复 | [灾备恢复](reliability/disaster-recovery.md) · [恢复演练](labs/restore-drill.md) |
| 比较方案并记录取舍 | [架构评审模板](templates/architecture-review.md) · [ADR 模板](templates/adr.md) |

## 🧠 配置与知识如何协作？

```text
rules / skills / memory + config + plugins / mcp
                          ↓
                 profile 显式选择
                          ↓
              适配、预览、备份、应用（待实现）
                          ↓
                本机工具的原生配置
```

- `runbooks/` 保存人也能独立使用的操作流程，`skills/` 按需引用。
- `architecture/decisions/` 保存正式决策，`memory/` 保存摘要和链接。
- `labs/` 保存实测过程，`draft → verified → deprecated` 表达资产状态。
- `scripts/` 管理仓库自身；成熟的巡检、备份等工具可独立维护，在 [工具目录](docs/tool-catalog.md) 中登记。

格式与边界详见 [架构约定](docs/architecture.md)、[清单格式](docs/manifests.md) 和 [知识边界](docs/knowledge-boundaries.md)。

## 📦 多电脑与离线环境

通过 Git 同步有权复用的配置、个人偏好、通用经验和脱敏案例。工具内部会话数据库、缓存与凭据不参与同步，客户受限资料留在所属环境。

`local/` 保存个人本机覆盖，`vendor/` 预留离线载荷位置。离线 profile 表达禁止下载的意图；依赖完整性、版本与摘要校验需由后续安装器实现。

提交前检查暂存内容：`.gitignore` 不会移除已跟踪的敏感文件。

## 🗺️ 接下来完善什么？

- [ ] 完成清单解析、引用校验与工具版本检查。
- [ ] 为一个工具实现配置预览、备份、应用与回滚。
- [ ] 补齐离线依赖校验与本机环境变量注入。
- [ ] 将环境检查、交付验收、恢复演练跑通并留下证据。
- [ ] 根据实际使用逐步扩展技能与独立工具。

详细顺序见 [实施路线](docs/roadmap.md)。

## 🤝 贡献经验

欢迎提交可复现的排障方法、经过验证的手册，以及有依据的架构取舍。

提交时请说明适用环境、前提、验证结果和限制；涉及变更的流程补齐中止与回滚步骤。未经验证的内容保持 `draft`，并遵循 [仓库协作规范](AGENTS.md)。

---

**愿每次故障都留下经验，愿下一次值班能睡个好觉。** ☕
