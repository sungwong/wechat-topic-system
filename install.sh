#!/bin/bash

# 选题生产系统 · 安装脚本
# 用法：curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/topic-system/main/install.sh | bash

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

# 下载 SKILL.md
echo "→ 下载 skill 文件..."
curl -fsSL "$REPO/.claude/skills/topic-system/SKILL.md" -o .claude/skills/topic-system/SKILL.md

# 建定位文件（已有则跳过，不覆盖）
if [ ! -f "我的定位.md" ]; then
  echo "→ 创建定位文件..."
  curl -fsSL "$REPO/templates/positioning.md" -o 我的定位.md
else
  echo "→ 定位文件已存在，跳过"
fi

# 建选题库（已有则跳过）
if [ ! -f "选题库/原创选题.md" ]; then
  curl -fsSL "$REPO/templates/topic-library/original-topics.md" -o 选题库/原创选题.md
fi

if [ ! -f "选题库/拆解选题.md" ]; then
  curl -fsSL "$REPO/templates/topic-library/analyzed-topics.md" -o 选题库/拆解选题.md
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
