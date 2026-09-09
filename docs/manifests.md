# 清单格式 v1

以下均为 Bastion 自定义约定。目前无解析器或自动 schema 校验，bootstrap 只检查所选 profile 文件存在。

## 通用规则

- schema_version 固定为整数 1。
- 路径相对仓库根目录，使用正斜杠；未来解析器应拒绝绝对路径及越界路径。
- tools 的取值为 codex、claude、cursor，其中 claude 表示 Claude Code。
- 未知字段应在后续校验器中报错，ID 在对应 registry 中唯一。
- null 表示尚未填写，不代表已锁定版本或完成摘要校验。

## profiles/*.yaml

| 字段 | 类型 | 含义 |
| --- | --- | --- |
| name / description | 字符串 | 配置名称与用途 |
| tools | 字符串列表 | 目标工具 |
| rules / skills / memory | 路径列表 | 要接入的公共文件或技能目录 |
| plugins / mcp | ID 列表 | 对应 registry 中的条目 |
| network.allow_downloads | 布尔值 | 后续安装流程是否允许下载 |
| artifacts.directory | 路径 | 离线载荷根目录 |

不支持继承、变量展开、自动发现或隐式合并。profile 选择到的插件或服务必须 enabled: true；禁用或缺失的 ID 应报错。当前示例的能力列表为空。

## plugins/registry.yaml

plugins 为对象列表，每项包含 id、enabled、description、tools、source、version、sha256。示例 source 仅定义 type: local 与仓库相对 path；远程来源格式留待实现。禁用项可以保留缺失的占位路径，启用项须具备有效包、版本和摘要。

## mcp/registry.yaml

servers 为对象列表，每项包含 id、enabled、tools、config、required_env。config 引用中间配置，required_env 只记录环境变量名称，不记录值。

MCP 中间配置示例包含 transport、command、args、env 和 offline。env 的 from_env 表示运行时从本机环境注入；offline 包含 artifact、version、sha256。示例 command 为占位值；启用前必须换成真实程序，并在各系统上验证。此格式不是 MCP 标准客户端配置。
