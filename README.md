# Hugo + GitHub Pages 个人博客脚手架

这是 `Blog` 仓库当前使用的 Hugo 博客项目，可用于学习、写作与发布到 GitHub Pages。

## 1. 安装 Hugo（Windows）

推荐使用 `winget`：

```powershell
winget install Hugo.Hugo.Extended
```

安装完成后，重新打开终端执行：

```powershell
hugo version
```

如果你的环境没有 `winget/choco`，可以手动下载 Hugo Extended 的 Windows 包并解压，把 `hugo.exe` 放到当前项目的 `tools` 目录，`dev.ps1` 和 `build.ps1` 会自动优先使用它。

## 2. 本地预览

你可以直接运行：

```powershell
.\dev.ps1
```

打开 `http://localhost:1313/` 查看效果（默认包含 draft 文章）。

## 3. 新建文章

```powershell
hugo new posts/my-first-post.md
```

把文章里的 `draft` 改成 `false` 后即可发布。

## 4. 发布到 GitHub Pages

1. 创建 GitHub 仓库并推送到 `main` 分支
2. 在仓库设置里启用 Pages，Source 选择 **GitHub Actions**
3. 修改 `config.toml` 中 `baseURL` 为你的地址，例如：
   - 用户主页仓库：`https://<username>.github.io/`
   - 项目页仓库：`https://<username>.github.io/<repo>/`
4. 推送后会自动触发 `.github/workflows/hugo-gh-pages.yml` 进行构建和部署

## 5. 常用命令

```powershell
# 本地开发
.\dev.ps1

# 指定端口
.\dev.ps1 -Port 1400

# 生产构建
.\build.ps1
```
