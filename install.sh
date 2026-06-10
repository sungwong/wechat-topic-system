#!/bin/bash

# 选题生产系统 · 安装脚本
# 用法：在 Claude Code 里说「帮我运行：curl -fsSL https://raw.githubusercontent.com/sungwong/wechat-topic-system/main/install.sh | bash」

set -e

REPO="https://raw.githubusercontent.com/sungwong/wechat-topic-system/main"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "📦 正在安装选题生产系统..."
echo ""

# 建目录
mkdir -p .claude/skills/topic-system
mkdir -p 选题库/来源文章

# 下载 SKILL.md（用独立进程避免 stdin 占用问题）
echo "→ 下载 skill 文件..."
bash -c "curl -fsSL '$REPO/.claude/skills/topic-system/SKILL.md' -o .claude/skills/topic-system/SKILL.md"

# 建定位文件（已有则跳过，不覆盖）
if [ ! -f "我的定位.md" ]; then
  echo "→ 创建定位文件..."
  cat > 我的定位.md << 'TEMPLATE'
# 我的定位

## 我是谁
（一句话：我是做什么的，有什么经历或资历）


## 我帮谁
（我的内容是写给什么样的人看的）


## 我帮他们解决什么问题
（他们现在面临的核心困境是什么）


## 我能给他们带去什么结果
（找你之后，他们能得到什么具体改变）


## 我目前有什么产品或服务
（有就填，没有可以先空着）


## 我的公众号账号名

TEMPLATE
else
  echo "→ 定位文件已存在，跳过"
fi

# 建选题库（已有则跳过）
if [ ! -f "选题库/原创选题.md" ]; then
  cat > 选题库/原创选题.md << 'TEMPLATE'
# 原创选题库

来源：定位生成 / 观点成题 / 热点选题

| 标题方向 | 写给谁（人群+阶段+痛点） | 核心角度 | 切入角度 | 大概怎么写 | 来源 | 日期 |
|---------|----------------------|---------|---------|-----------|------|------|
TEMPLATE
fi

if [ ! -f "选题库/拆解选题.md" ]; then
  cat > 选题库/拆解选题.md << 'TEMPLATE'
# 拆解选题库

来源：对标爆款文章拆解后改造

| 原文标题 | 原文链接 | 拆解分析 | 切入角度 | 仿写 |
|---------|---------|---------|---------|------|
TEMPLATE
fi

echo ""
echo -e "${GREEN}✅ 安装完成！${NC}"
echo ""
echo "已创建："
echo "  .claude/skills/topic-system/SKILL.md"
echo "  我的定位.md"
echo "  选题库/原创选题.md"
echo "  选题库/拆解选题.md"
echo ""
echo -e "${YELLOW}下一步：${NC}"
echo "  在 Claude Code 里说「帮我梳理定位」"
echo "  填完定位后说「定位细化」开始生成选题"
echo ""
