# 公众号选题生产系统

帮你持续稳定地生产公众号选题，装进 Claude Code 就能用。

## 能做什么

- **定位细化 → 批量选题**：把你的定位拆成人群×阶段×痛点矩阵，每个交叉点生成多个选题角度
- **观点成题**：把你的想法/判断/案例，变成有钩子的可发标题
- **拆解对标文章**：输入爆款链接，三层拆解后生成仿写选题（不抄内容，抄结构）
- **热点选题**：热点+你的定位，找到不强行蹭的真实切入角度
- **选题库管理**：所有选题自动入库，随时调用

---

## 安装（1分钟）

在 Claude Code 的终端里运行：

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/topic-system/main/install.sh | bash
```

运行完会自动创建所有文件，跟着提示填写你的定位就行。

> 没有终端？在 Claude Code 对话框里说：
> `帮我运行这个命令：curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/topic-system/main/install.sh | bash`

---

## 用法

安装完成后，在 Claude Code 里直接说：

| 说这个 | 做什么 |
|--------|--------|
| `定位细化` | 拆定位矩阵，批量生成选题 |
| `生成选题` | 快速出15个选题 |
| `[链接] 拆解选题` | 拆解爆款文章，生成仿写选题 |
| `观点成题` | 把你的想法变成选题 |
| `热点选题` | 热点借势 |
| `存选题` | 把选好的题存入选题库 |

---

## 文件结构

安装后你的项目里会多出这些：

```
.claude/skills/topic-system/SKILL.md   ← 系统主体，不需要动
我的定位.md                             ← 填你的定位，越具体越好
选题库/
  ├── 原创选题.md                        ← 定位/观点/热点产出的选题
  ├── 拆解选题.md                        ← 对标文章拆解出的仿写选题
  └── 来源文章/                          ← 每篇拆解文章的原文+分析+仿写
```

---

## 更新

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/topic-system/main/install.sh | bash
```

重新运行安装命令即可更新 skill 文件，**已有的定位和选题库不会被覆盖**。
