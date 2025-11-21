# Resume Template

一份基于 Typst 的简洁、现代且支持中英文混排的简历模板。专为 **Local Package** 管理方式设计。

## ✨ 特性

- **中英混排**：预设 `IBM Plex Serif` (西文) 和 `Noto Serif CJK SC` (中文) 字体组合。
- **自动布局**：支持带照片/无照片的头部布局，自动居中或左右对齐。
- **语义化组件**：内置 `sidebar` (侧边栏)、`item` (项目经历)、`info` (个人信息) 等排版组件。
- **图标支持**：支持 SVG 图标自动变色以匹配主题。

## 🛠️ 前置要求 (字体)

为了获得最佳显示效果，请确保你的系统安装了以下字体（或在 `lib.typ` 中修改为你喜欢的字体）：

- **Main**: `IBM Plex Serif`
- **Mono**: `IBM Plex Mono`
- **CJK**: `Noto Serif CJK SC` (思源宋体)

## 🚀 安装

本模板设计为 Typst **本地包**

假设你使用 `install.sh` 脚本管理，或者手动链接(请确保 typst.toml 中的 version 为 0.1.0)：

```bash
mkdir -p ~/.local/share/typst/packages/local/resume
ln -s $(pwd)/resume ~/.local/share/typst/packages/local/resume/0.1.0
```

## 📝 快速开始

在你的简历项目（如 `~/workspace/my-cv/main.typ`）中：

```typst
#import "@local/resume:0.1.0": *

// 定义一些图标 (可以使用包内图标或本地图标)
#let fa-github = icon("icons/fa-github.svg")
#let fa-envelope = icon("icons/fa-envelope.svg")

#show: resume.with(
  size: 10pt,
  theme-color: rgb("#26267d"), // 设置主题色

  // --- 照片设置 ---
  // 必须传入 image 对象，路径相对于 main.typ
  photograph: image("profile.jpg"),
  photograph-width: 10em,
  gutter-width: 2em,

  // 如果不需要照片，注释掉 photograph 参数，
  // 并开启 header-center: true
)[
  = 你的名字

  #info(
    color: rgb("#26267d"),
    (icon: fa-envelope, content: "email@example.com", link: "mailto:..."),
    (icon: fa-github, content: "github.com/user", link: "https://github.com/..."),
  )
][
  这里是个人简介...
]

// --- 正文内容 ---

== 教育背景

#sidebar[
  2020 - 2024
][
  *某某大学* · 计算机科学与技术
]

== 项目经历

#item(
  [*项目名称*],
  [项目描述/技术栈],
  date[2023.10]
)
```

## 🧩 组件文档

### 1. 基础配置 `resume`

主模板函数，用于 `#show` 规则。

| 参数            | 类型    | 说明                                           |
| :-------------- | :------ | :--------------------------------------------- |
| `theme-color`   | color   | 主题色 (影响标题、链接、图标)                  |
| `photograph`    | content | **必须是 `image(...)` 对象**，不能是路径字符串 |
| `header-center` | bool    | 是否居中显示头部 (无照片时推荐 `true`)         |
| `font`          | dict    | 覆盖默认字体设置                               |

### 2. 侧边栏布局 `sidebar`

常用于教育背景或技能列表，左侧是时间/标签，右侧是详情，中间有一条竖线。

```typst
#sidebar(side-width: 12%)[
  2024.06
][
  *毕业设计*
]
```

- `with-line`: (bool) 是否显示中间的竖线。
- `side-width`: (ratio) 左侧栏的宽度。

### 3. 项目条目 `item`

用于列出项目或工作经历，三栏布局：左侧标题，中间描述，右侧时间/备注。

```typst
#item(
  [*My Project*],
  [Built with Rust and Typst],
  date[2023]
)
```

### 4. 个人信息栏 `info`

用于头部显示联系方式。

```typst
#info(
  color: theme-color,
  (icon: fa-phone, content: "123456"),
  (icon: fa-github, content: "github", link: "..."),
)
```

### 5. 辅助文本

- `#date[内容]`: 生成灰色的日期文本。
- `#tech[内容]`: 生成极细字重 (Extralight) 的文本，适合罗列技术栈。

## 🖼️ 关于图标 (Icons)

模板内置了 `icon(path, fill: color)` 函数。

- **包内图标**：如果 SVG 位于模板包的 `icons/` 目录下，可以直接调用。
- **本地图标**：如果 SVG 位于你的简历项目目录下，你需要确保 `icon` 函数能读取到文件。
  - _注意_：由于 Typst 沙箱限制，建议在 `main.typ` 中读取文件内容，或者确保路径正确。模板中的 `read(path)` 是相对于调用位置或包根目录的。

为了方便，建议在 `main.typ` 中定义你的图标快捷方式：

```typst
// 读取 main.typ 同级目录下的 icons/my-icon.svg
#let my-icon = icon("icons/my-icon.svg")
```
