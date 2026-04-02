# Diary Template

一份为日记、每日记录和轻量复盘准备的 Typst 本地包。

它保持正文的纸感与克制，只给高频重复内容加一层足够轻的封装：按天自动分页、常用分区标题，以及“成功日记 / 明日行动”这种复盘卡片。

## ✨ 特性

- **按天自动分页**：每个 `#day(...)` 会自动作为一级标题单独起页，不需要手动 `pagebreak`。
- **兼容轻量写法**：提供 `#day`、`#section`、`#invest`、`#success`、`#tomorrow` 等快捷接口。
- **视觉克制**：正文维持极简层级，只有少数复盘卡片使用浅底色和细边框。
- **中英混排**：默认使用 `TeX Gyre Termes` 和 `Noto Serif CJK SC`。

## 🚀 安装

如果你已经在仓库根目录运行过 `install.sh`，这个包会自动被链接到 Typst 本地包目录。

也可以手动安装：

```bash
mkdir -p ~/.local/share/typst/packages/local/diary
ln -s $(pwd)/diary ~/.local/share/typst/packages/local/diary/0.1.0
```

## 📝 快速开始

```typst
#import "@local/diary:0.1.0": *

#show: diary

#day(date: "2026-04-02")[
  #section("今日记事")

  今天开始使用 diary 本地包写日记。

  #invest[
    继续记录投资复盘。
  ]

  #success[
    + 抽出了重复样式
  ]

  #tomorrow[
    + 继续补充今天的总结
  ]
]
```

## ⚙️ 主题入口

`diary` 是主题入口函数，通常通过 `#show: diary` 使用。

可选参数：

| 参数 | 类型 | 默认值 | 说明 |
| :--- | :--- | :--- | :--- |
| `paper` | string | `"a5"` | 页面尺寸 |
| `margin` | length/dictionary | `1.5cm` | 页面边距 |
| `font` | array | `("Tex Gyre Termes", "Noto Serif CJK SC")` | 正文字体 |
| `size` | length | `10pt` | 正文字号 |

## 📦 快捷接口

### `#day(date: "...")[ ... ]`

生成一天的主标题，并自动触发新页。默认会把 `YYYY-MM-DD` 格式转换成 `YYYY年M月D日`。

```typst
#day(date: "2026-04-02")[
  这是今天的内容。
]
```

如果你想自己控制标题文案，也可以显式传入 `title`：

```typst
#day(date: "2026-04-02", title: "2026年4月2日 · 周四")[
  ...
]
```

### `#section("今日记事")`

生成轻量的二级分区标题。像“今日记事”“A股投资复盘”这类标题会自动补常用图标。

### `#invest[ ... ]`

快速生成 “A股投资复盘” 分区。

### `#review("标题")[ ... ]`

通用复盘卡片接口。

### `#success[ ... ]`

等价于 `#review("成功日记")[ ... ]`。

### `#tomorrow[ ... ]`

等价于 `#review("明日行动")[ ... ]`。

### `#note[ ... ]`

中性的补充说明卡片，不会像复盘卡片那样强调标题。

## 📄 参考示例

可以直接查看 [`examples/diary/main.typ`](/home/ethan/typst-template/examples/diary/main.typ)。
