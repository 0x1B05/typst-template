# Lecture Notes Template

一份基于 Typst 的现代化课程笔记模板。

## ✨ 特性

- **学术排版**：基于 `Tex Gyre Termes` (衬线) 和 `Noto Serif CJK SC` (宋体) 的混排。
- **智能封面**：
  - 自动区分 **Published** (发布日期) 和 **Last Updated** (编译时的最后更新日期)。
  - 支持带超链接的作者列表。
  - 风格化的摘要 (Abstract) 区域。
- **功能集成**：
  - **定理环境**：内置 Definition, Theorem, Proof 等环境 (基于 `theorion`)。
  - **代码高亮**：美观的代码块，支持图标和行号 (基于 `codly`)。
  - **三线表**：支持三线表 (基于 `tablem`)。
- **视觉优化**：
  - 各级标题颜色区分（深蓝/浅蓝）。
  - 内置 `#redt`, `#bluet`, `#greent` 等快捷颜色标记。
  - 自动生成页眉（支持短标题）。

## 🚀 安装

本模板设计为 Typst **本地包 (Local Package)**。

假设你使用 `install.sh` 脚本管理，或者手动链接(请确保 typst.toml 中的 version 为 0.1.0)：

```bash
mkdir -p ~/.local/share/typst/packages/local/notes
ln -s $(pwd)/notes ~/.local/share/typst/packages/local/notes/0.1.0
```

## 📝 快速开始

在你的笔记项目（如 `main.typ`）中：

```typst
#import "@local/notes:0.2.0": *

#show: notes.with(
  title: "EE219: AI Computing Systems",
  short_title: "EE219 Notes", // 用于页眉

  authors: (
    (name: "0x1B05", link: "https://github.com/0x1B05"),
  ),

  date: datetime(year: 2025, month: 10, day: 1), // 发布日期

  abstract: [
    This document covers the architectural design of AI accelerators,
    focusing on Systolic Arrays and RISC-V integration.
  ],

  toc: true, // 生成目录
  // bibliography-file: "refs.bib",
)

= Introduction

System architecture is the art of designing complex systems.

== Core Concepts

#definition(title: "Systolic Array")[
  A network of processors that compute data and pass it through the system.
]

We can emphasize text with #redt("important keywords").

```

## ⚙️ 参数配置

`notes` 函数支持以下参数：

| 参数                | 类型           | 默认值                     | 说明                                             |
| :------------------ | :------------- | :------------------------- | :----------------------------------------------- |
| `title`             | string/content | Required                   | 文档主标题                                       |
| `short_title`       | string         | `none`                     | 页眉显示的短标题，若为空则显示主标题             |
| `authors`           | array          | `("Author")`               | 作者列表。支持字符串或 `(name:"", link:"")` 字典 |
| `date`              | datetime       | `today()`                  | **发布日期** (Published Date)                    |
| `abstract`          | content        | `none`                     | 封面页摘要                                       |
| `toc`               | bool           | `true`                     | 是否生成目录                                     |
| `bibliography-file` | string         | `none`                     | `.bib` 文件路径                                  |
| `paper_size`        | string         | `"a4"`                     | 纸张大小                                         |
| `font`              | array          | `("Tex Gyre Termes", ...)` | 正文字体 (英, 中)                                |
| `code_font`         | string         | `"FiraCode..."`            | 代码块字体                                       |

### 自定义颜色

你可以通过 `colors` 参数覆盖默认配色：

```typst
#show: notes.with(
  // ... 其他参数
  colors: (
    primary: rgb("#006400"),   // 深绿
    secondary: rgb("#228B22"), // 森林绿
    accent: rgb("#FF4500"),    // 橙红
    text: rgb("#000000"),      // 纯黑
  )
)
```

## 🛠️ 内置工具

### 1. 定理环境 (Theorion)

模板直接导出了 `theorion` 的所有环境，开箱即用：

- `#definition(title: "...")[]`
- `#theorem(title: "...")[]`
- `#lemma[]`, `#corollary[]`, `#proof[]`
- `#example[]`, `#remark[]`

### 2. 颜色高亮函数

用于在正文中快速标记重点：

- `#redt[...]`: <span style="color:#DC143C">Crimson text (Accent color)</span>
- `#bluet[...]`: <span style="color:#1E90FF">Blue text</span>
- `#greent[...]`: <span style="color:#32CD32">Green text</span>

### 3. 代码块 (Codly)

直接使用标准 Markdown 语法，会自动添加行号和图标：

````typst
```python
def hello():
    print("Hello World")
```
````

### 4. 自动日期处理

封面页底部会自动生成两行日期：

- **Published**: 显示你传入 `notes.with(date: ...)` 的日期。
- **Last Updated**: 自动显示当前编译时的日期 (`datetime.today()`)。
