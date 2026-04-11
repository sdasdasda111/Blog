# video子系统 博客工程

这是一个基于 `Hexo + Butterfly` 搭建、通过 GitHub Pages 自动部署的个人博客工程，当前站点地址为：

- `https://sdasdasda111.github.io/Blog/`

当前工程已经从 Hugo 迁移为 Hexo，并内置便携式 Node.js，开箱即可本地运行与构建。

## 当前技术栈

- 框架：`Hexo`
- 主题：`Butterfly`
- 部署：`GitHub Pages + GitHub Actions`
- 本地 Node：`tools/node/`

## 目录结构

- `_config.yml`：Hexo 主配置
- `_config.butterfly.yml`：Butterfly 主题配置
- `source/_posts/`：文章目录
- `source/about/index.md`：关于页
- `source/search/index.md`：搜索页
- `source/img/`：站点资源
- `.github/workflows/hexo-gh-pages.yml`：GitHub Pages 自动部署工作流
- `dev.ps1`：本地开发启动脚本
- `build.ps1`：生产构建脚本
- `tools/node/`：便携式 Node.js

## 本地开发

直接运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\dev.ps1
```

指定端口：

```powershell
powershell -ExecutionPolicy Bypass -File .\dev.ps1 -Port 1400
```

启动后访问：

- `http://localhost:1313/Blog/`

## 安装依赖

如果是第一次拉取仓库，先安装依赖：

```powershell
g:\aistore\markdown\blog\tools\node\npm.cmd install
```

## 生产构建

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

构建完成后，产物位于：

- `public/`

## 写文章

文章目录：

- `source/_posts/`

你可以直接创建 Markdown 文件，示例 front matter：

```yaml
---
title: Linux 视频子系统入门：从 V4L2 到视频采集链路
date: 2026-04-11 21:30:00
tags:
  - linux
  - v4l2
categories:
  - 视频子系统
---
```

## 修改站点信息

### 主配置

文件：`_config.yml`

关键项：

- 站点标题：`video子系统`
- 根路径：`/Blog/`
- 永久链接：`posts/:title/`

### 主题配置

文件：`_config.butterfly.yml`

可修改：

- 顶部导航
- 头像
- 社交链接
- 公告
- 搜索
- 侧栏卡片

## Git 提交与推送

当前仓库远程已配置为 SSH：

```bash
git@github.com:sdasdasda111/Blog.git
```

常用流程：

```powershell
git add .
git commit -m "feat: update hexo blog"
git push origin main
```

如果当前环境下 Git 默认没有使用指定私钥，可临时指定：

```powershell
$env:GIT_SSH_COMMAND='ssh -i "g:\aistore\markdown\blog\id_ed25519" -o IdentitiesOnly=yes'
git push origin main
```

## 自动部署

每次推送到 `main` 分支后，GitHub Actions 会自动执行：

- 安装依赖
- 生成 Hexo 站点
- 部署到 GitHub Pages

查看部署状态：

- `https://github.com/sdasdasda111/Blog/actions`

## 注意事项

1. 不要把私钥文件提交到仓库
   - `id_ed25519`
   - `id_ed25519.pub`

2. 如果更新依赖后本地异常，可执行：

```powershell
g:\aistore\markdown\blog\tools\node\npm.cmd install
```

3. 如果 PowerShell 报脚本执行限制，优先使用：

```powershell
powershell -ExecutionPolicy Bypass -File .\dev.ps1
```

## 当前迁移结果

已完成：

- Hugo -> Hexo 迁移
- 主题切换为 Butterfly
- 关于页迁移
- 搜索页迁移
- 首篇文章迁移
- GitHub Pages 工作流切换为 Hexo

后续可以继续做：

- 精细化 Butterfly 主题配置
- 增加更多文章
- 自定义 about 页面内容
- 添加评论系统
