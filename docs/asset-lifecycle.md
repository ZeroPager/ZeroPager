# 资产状态与验证约定

操作手册、可靠性方案、架构评审、ADR 和演练文档统一使用 YAML front matter：

```yaml
status: draft
last_verified: null
tested_on: []
requires_network: false
```

- draft：未验证或修改后待重新验证。
- verified：在明确范围完成验证，须填写日期、环境版本和证据链接。
- deprecated：已废弃，正文注明原因和替代记录。
- last_verified：实际验证日期（YYYY-MM-DD），不等于编辑日期。
- tested_on：实际验证环境列表；设计文档可以记录评审背景、约束版本和验证方式。
- requires_network：流程是否需要任何网络连接，包含内网和集群 API，不仅指互联网。false 不表示绝对安全或没有依赖。

正文应保留验证证据或脱敏证据位置。环境版本变化、关键步骤变更或原假设失效后退回 draft。当前没有自动状态校验器。

模板本身保持 draft；复制并完成具体内容后，才讨论是否通过验证。skill 的工具原生元数据不强行使用这套字段，可在正文记录验证信息。
