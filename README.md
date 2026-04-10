# video子系统 博客工程

这是一个基于 Hugo 搭建、通过 GitHub Pages 自动部署的个人博客工程，当前站点地址为：

- `https://sdasdasda111.github.io/Blog/`

站点名称、作者和首页主题样式都已经按当前项目做过定制，可直接继续写文章与发布。

## 目录结构

- `config.toml`：站点配置
- `content/posts/`：博客文章目录
- `content/about.md`：关于页面
- `layouts/`：页面模板
- `static/css/style.css`：主题样式
- `.github/workflows/hugo-gh-pages.yml`：GitHub Pages 自动部署工作流
- `dev.ps1`：本地开发启动脚本
- `build.ps1`：生产构建脚本
- `tools/hugo.exe`：本地 Hugo 可执行文件

## 运行环境

推荐方式：

1. 本机已安装 Hugo Extended
2. 或直接使用工程内自带的 `tools/hugo.exe`

如果需要安装 Hugo（Windows）：

```powershell
winget install Hugo.Hugo.Extended
```

安装后可验证：

```powershell
hugo version
```

## 本地开发

如果 PowerShell 不允许直接执行脚本，可以使用下面任一方式。

### 方式 1：临时绕过执行策略启动

```powershell
powershell -ExecutionPolicy Bypass -File .\dev.ps1
```

### 方式 2：当前窗口放行后启动

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\dev.ps1
```

### 指定端口启动

```powershell
powershell -ExecutionPolicy Bypass -File .\dev.ps1 -Port 1400
```

启动后访问：

- `http://localhost:1313/`

## 生产构建

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

构建完成后，产物位于：

- `public/`

## 写文章

文章目录：

- `content/posts/`

你可以手动创建 Markdown 文件，也可以使用 Hugo 命令新建：

```powershell
hugo new posts/my-first-post.md
```

示例 front matter：

```toml
---
title: "我的第一篇文章"
date: 2026-04-10T22:00:00+08:00
draft: false
tags: ["video", "system"]
---
```

写完后把 `draft` 设为 `false`，页面才会在正式发布时显示。

## 修改站点信息

当前站点配置文件：`config.toml`

目前的关键配置为：

- 站点标题：`video子系统`
- 副标题：`N/A`
- 作者：`dongzhichao`
- GitHub Pages 地址：`https://sdasdasda111.github.io/Blog/`

如果仓库名或用户名变化，需要同步更新 `baseURL`。

## Git 提交与推送

当前仓库远程已配置为 SSH：

```bash
git@github.com:sdasdasda111/Blog.git
```

常用流程：

```powershell
git add .
git commit -m "feat: update blog content"
git push origin main
```

如果当前环境下 Git 默认没有使用指定私钥，可临时指定：

```powershell
$env:GIT_SSH_COMMAND='ssh -i "g:\aistore\markdown\blog\id_ed25519" -o IdentitiesOnly=yes'
git push origin main
```

## 自动部署

每次推送到 `main` 分支后，GitHub Actions 会自动执行：

- 构建 Hugo 站点
- 部署到 GitHub Pages

可以在这里查看部署状态：

- `https://github.com/sdasdasda111/Blog/actions`

## 当前主题说明

当前主题是项目内自定义主题，特点包括：

- 深色科技风首页
- 卡片化文章列表
- 统一的文章详情布局
- 自定义导航、页脚与字体风格

主题相关文件主要在：

- `layouts/_default/baseof.html`
- `layouts/index.html`
- `layouts/_default/list.html`
- `layouts/_default/single.html`
- `static/css/style.css`

## 注意事项

1. 不要把私钥文件提交到仓库
   - `id_ed25519`
   - `id_ed25519.pub`

2. 如果本地能构建但 GitHub Actions 失败，优先检查：
   - `config.toml`
   - GitHub Pages 设置是否为 `GitHub Actions`
   - 工作流日志

3. 如果 PowerShell 报脚本执行限制，优先使用：

```powershell
powershell -ExecutionPolicy Bypass -File .\dev.ps1
```

## 下一步建议

- 把 `about.md` 改成正式个人介绍
- 把示例文章 `Hello Hugo` 换成真实文章
- 将 `video子系统i` 整理成第一篇正式博客内容
