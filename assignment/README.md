# Assignment Template

一份专为大学作业、实验报告和课程项目设计的 Typst 模板。

该模板特点是包含一个**垂直居中的独立封面页**，以及内置的 `task`（题目）和 `tip`（提示）环境，帮助你快速排版出整洁的作业文档。

## ✨ 特性

- **独立封面页**：自动生成包含课程信息、截止日期、教授姓名和作者的封面，布局垂直居中。
- **页眉页脚**：
  - 首页（封面）隐藏页眉页脚。
  - 正文页自动显示 `Author | Course: Title` 页眉和 `Page X of Y` 页脚。
- **题目环境 (`#task`)**：自动计数的绿色圆角边框盒子，适合放置作业题目。
- **提示环境 (`#tip`)**：醒目的黄色背景盒子，适合放置提示或注意点。
- **中英混排**：默认配置 `TeX Gyre Termes` (英) 和 `Noto Serif CJK SC` (中) 字体。

## 🚀 安装

本模板设计为 Typst **本地包 (Local Package)**。

假设你使用 `install.sh` 脚本管理，或者手动链接(请确保 typst.toml 中的 version 为 0.1.0)：

```bash
mkdir -p ~/.local/share/typst/packages/local/assignment
ln -s $(pwd)/assignment ~/.local/share/typst/packages/local/assignment/0.1.0
```

## 📝 快速开始

在你的作业文件（如 `hw1.typ`）中：

```typst
#import "@local/assignment:0.1.0": *

#show: assignment.with(
  title: "Homework 1: Linear Algebra",
  author: "0x1B05",
  course_id: "MATH 101",
  professor_name: "Alan Turing",
  semester: "Fall 2025",
  due_time: "2025-11-20",
)

// --- 正文开始 ---

#task[
  Calculate the eigenvalues of the following matrix $A$.
]

The solution is derived as follows...

#tip[
  Remember that the sum of eigenvalues equals the trace of the matrix.
]

#task[
  Prove that if $A$ is symmetric, all eigenvalues are real.
]

Proof: Let $lambda$ be an eigenvalue...
```

## ⚙️ 参数配置

`assignment` 函数支持以下参数：

| 参数             | 类型   | 说明                                         |
| :--------------- | :----- | :------------------------------------------- |
| `title`          | string | 作业标题                                     |
| `author`         | string | 作者姓名                                     |
| `course_id`      | string | 课程代码 (如 "CS101")                        |
| `professor_name` | string | 教授姓名 (无需加 "Prof." 前缀，模板会自动加) |
| `semester`       | string | 学期 (如 "Fall 2025")                        |
| `due_time`       | string | 截止日期                                     |

## 📦 内置组件

### 1. 题目盒子 (`#task`)

用于包裹题目内容。

- **自动计数**：每次调用会自动增加编号（Task 1, Task 2...）。
- **样式**：浅绿色背景，深绿色边框。

```typst
#task[
  Describe the architecture of a Transformer model.
]
```

### 2. 提示盒子 (`#tip`)

用于包裹额外的说明、提示或警告。

- **样式**：浅黄色背景，橙色边框。

```typst
#tip[
  Make sure to double-check your calculation.
]
```

## 📄 页面布局细节

- **纸张大小**：默认设置为 `us-letter`。
- **字体**：
  - 英文：`TeX Gyre Termes` (Times New Roman 的替代品)
  - 中文：`Noto Serif CJK SC`
- **间距**：字间距设置为 `.35em` 以优化阅读体验。
