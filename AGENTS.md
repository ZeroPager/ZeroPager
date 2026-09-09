# 仓库协作规范

- 始终使用中文沟通和注释，优先提供可执行命令与简洁说明。
- 修改前阅读相关文件，保持既有目录、命名与格式，采用最小修改。
- 公共行为放 rules/，工具特定格式放 config/，不要重复维护同一份内容。
- registry/profile 是仓库自定义格式，变更时同步 docs/manifests.md。
- 不提交密钥、真实客户资料、会话数据库和本机缓存。
- bootstrap 当前为占位脚本，不得把检查通过描述为安装成功。
- 实现安装时考虑 Windows/Linux、离线依赖、备份、幂等和回滚。

- SRE 文档遵循 docs/asset-lifecycle.md；没有实测或评审证据不得标为 verified。
- 操作流程放 runbooks/，正式决策放 architecture/decisions/，memory 只做摘要和索引。
- 客户受限资料留在所属环境；本仓库只沉淀有权复用的脱敏内容。
