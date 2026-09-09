# 架构约定

## 数据流

公共内容（rules/skills/memory）＋工具模板（config）＋能力清单（plugins/mcp）→ profile 显式选择 → 适配器渲染 → 本机工具配置。

当前只实现左侧源文件和 bootstrap 骨架检查，右侧适配器与安装流程为后续工作。

## 职责边界

- rules 约束如何工作，skills 描述如何完成某类任务，roles 定义职责。
- prompts 是手动调用模板，hooks 是工具触发的代码，plugins 是工具能力包。
- mcp 管理外部服务连接，memory 保存经过整理的稳定知识。
- profile 只负责选取集合，工具专属语法由 config 与适配器承担。
- local 是机器差异与敏感信息，vendor 是离线载荷；两者不通过 Git 分发。

## 后续安装原则

先校验引用和工具版本，再生成预览；备份原配置后才写入，记录由 Bastion 管理的文件。重复运行应得到相同结果，撤销时只处理已管理的文件。Windows 路径及链接权限与 Linux 权限差异需在适配层处理。

不假定不同工具的技能、规则、插件格式通用。公共 Markdown 是维护来源，原生加载入口需要显式生成和验证。

## SRE 资产层

runbooks 提供人工可执行流程，reliability 定义服务目标和改进依据，architecture 保存正式设计决策，labs 记录实测过程。memory 以摘要和链接连接这些内容；skills 按需引用手册。仓库管理脚本仍放 scripts/，成熟业务工具独立维护并登记 docs/tool-catalog.md。
