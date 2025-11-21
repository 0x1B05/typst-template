# My Typst Templates Collection

这个仓库收集并维护了我个人使用的 Typst 模板集合。这些模板被设计为 **Typst 本地包 (Local Packages)**，旨在通过逻辑与内容分离，实现高效、统一的文档排版。

## 📂 包含的模板

| 模板名称          | 包名 (`@local/...`) | 版本    | 描述                                                                    |
| :---------------- | :------------------ | :------ | :---------------------------------------------------------------------- |
| **Lecture Notes** | `notes`             | `0.1.0` | 适用于课程笔记、学术文档。集成定理环境、代码高亮和学术配色。            |
| **Assignment**    | `assignment`        | `0.1.0` | 适用于作业、实验报告。包含独立的封面页、题目(`task`)和提示(`tip`)盒子。 |
| **Resume**        | `resume`            | `0.1.0` | 适用于个人简历。支持中英混排、头像布局调整及 FontAwesome 图标。         |

> ⚠️ **注意**：版本号可能会随 `typst.toml` 更新，请以实际文件为准。

## 🚀 安装 (Installation)

本项目提供了一个自动安装脚本，它会将模板文件夹软链接 (Symbolic Link) 到 Typst 的系统数据目录中。

### 1. 克隆仓库

将本仓库克隆到本地任意位置（建议放在 `~/Documents/templates` 或 `~/workspace/templates`）：

```bash
git clone https://github.com/your-username/typst-templates.git
cd typst-templates
```

### 2. 运行安装脚本

脚本会自动扫描每个子目录下的 `typst.toml`，并将其链接到 `~/.local/share/typst/packages/local/`。

```bash
chmod +x install.sh
./install.sh
```

**脚本功能：**

- 自动识别包名和版本号。
- 自动清理旧的无效链接。
- 支持增量更新（修改模板代码后无需重新运行，除非修改了版本号）。
- 自动忽略 `examples` 等非模板目录。

> 注意，如果先前`~/.local/share/typst/packages/local/`路径下有与本仓库中同名的本地包，将会被强制覆盖。

## 📝 使用方法 (Usage)

安装完成后，你可以在任何目录下的 Typst 项目中通过 `@local` 命名空间引用这些模板。

### 1. 课程笔记 (Notes)

```typst
#import "@local/notes:0.1.0": *

#show: notes.with(
  title: "Course Title",
  authors: ("Your Name",),
  toc: true,
  // ...
)
```

### 2. 作业报告 (Assignment)

```typst
#import "@local/assignment:0.1.0": *

#show: assignment_class.with(
  title: "Homework 1",
  course_id: "CS101",
  // ...
)
```

### 3. 个人简历 (Resume)

```typst
#import "@local/resume:0.1.0": *

#show: resume.with(
  name: "Your Name",
  photograph: image("profile.jpg"),
  // ...
)
```

👉 **查看示例**：你可以参考 `examples/` 文件夹下的 `.typ` 文件，了解每个模板的具体用法和效果。

## 🛠️ 字体依赖 (Prerequisites)

为了获得最佳的显示效果，请确保你的系统已安装以下字体（或者在各模板的 `lib.typ` 中修改为你喜欢的字体）：

- **Serif (衬线体)**: `TeX Gyre Termes` (推荐) 或 `IBM Plex Serif`
- **Sans/Mono (等宽)**: `FiraCode Nerd Font Mono` (用于代码块和图标)
- **CJK (中文)**: `Noto Serif CJK SC` (思源宋体)

## 🏗️ 目录结构

```text
.
├── install.sh          # 自动化安装脚本
├── examples/           # 各个模板的使用范例
│   ├── assignment/
│   ├── notes/
│   └── resume/
├── assignment/         # [模板] 作业
│   ├── lib.typ         # 核心逻辑
│   └── typst.toml      # 包配置
├── notes/              # [模板] 笔记
│   ├── lib.typ
│   └── typst.toml
└── resume/             # [模板] 简历
    ├── icons/          # 简历专用图标资源
    ├── lib.typ
    └── typst.toml
```

## 🤝 开发与维护

如果你修改了某个模板的 `lib.typ`，**所有引用该模板的文档在下一次编译时会自动应用新样式**，无需手动同步。

如果你修改了 `typst.toml` 中的 `version`（例如从 `0.1.0` 升级到 `0.2.0`），请重新运行 `./install.sh` 以创建新版本的链接。
