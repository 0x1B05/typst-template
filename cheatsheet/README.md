# Compact Typst Cheatsheet Template

一个基于 [Typst](https://typst.app/) 的极简、紧凑型速查表（Cheatsheet）模板。专为 A4 横向打印设计，最大化利用空间，适合整理代码片段、数学公式和考试复习资料。

## ✨ 特性

- **极窄边距**：5mm 边距，不浪费任何纸张空间。
- **三栏布局**：默认 A4 横向 3 栏，阅读视线流畅。
- **集成 Codly**：内置精美的代码块高亮与格式化。
- **集成 Tablem**：支持类 Markdown 的三线表语法。
- **视觉分级**：
  - **一级标题**：色块背景，醒目分割区域。
  - **二级标题**：下划线分割，节省垂直空间。
  - **三级标题**：行内加粗，紧凑布局。
- **辅助工具**：内置 `#redt`, `#bluet`, `#greent` 快速调整文字颜色。

## 📦 依赖库

本模板依赖以下 Typst 官方 Preview 包（编译时会自动下载）：

- `@preview/theorion:0.6.0`
- `@preview/codly:1.3.0`
- `@preview/codly-languages:0.1.10`
- `@preview/tablem:0.3.0`

## 🚀 快速开始

1. 确保你安装了 [Typst](https://github.com/typst/typst)。
2. 将模板代码保存为 `template.typ`。
3. 创建 `main.typ` 并导入模板：

```typst
#import "template.typ": *

#show: doc => cheatsheet(
  title: "My Cheatsheet",
  authors: ((name: "Me", email: ""),),
  columns-count: 3,
  doc
)

= My First Section
Hello World!
```

4. 编译 PDF：

```bash
typst compile main.typ
```

## ⚙️ 配置参数

`cheatsheet` 函数支持以下参数：

| 参数            | 类型       | 默认值                     | 说明                                |
| :-------------- | :--------- | :------------------------- | :---------------------------------- |
| `title`         | string     | "Cheat Sheet"              | 文档主标题                          |
| `authors`       | array      | `()`                       | 作者列表，格式 `(name: "", ...)`    |
| `columns-count` | int        | `3`                        | 分栏数量，建议 3 或 4               |
| `font-size`     | length     | `7pt`                      | 全局字号，建议 6pt-9pt              |
| `colors`        | dictionary | `default-colors`           | 自定义主题色 (primary, secondary等) |
| `font`          | array      | `("Tex Gyre Termes", ...)` | 正文字体 (优先衬线体)               |
| `code_font`     | string     | `"FiraCode..."`            | 代码块字体                          |

## 🎨 颜色辅助函数

为了在密集的文字中快速标记重点，模板提供了以下简写：

- `#redt[Content]`: 红色文字（用于警告/重点）
- `#bluet[Content]`: 蓝色文字（用于术语/提示）
- `#greent[Content]`: 绿色文字（用于通过/正确）
