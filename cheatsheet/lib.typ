#import "@preview/theorion:0.4.1": *
#import "@preview/codly:1.3.0": codly, codly-init
#import "@preview/codly-languages:0.1.1": codly-languages
#import "@preview/tablem:0.3.0": tablem, three-line-table

#let default-colors = (
  primary: rgb("#1A41AC"),
  secondary: rgb("#2A51BC"),
  accent: rgb("#DC143C"),
  text: rgb("#000000"),
  background: rgb("#ffffff"),
  header-bg: rgb("#e6eefc"),
)

#let redt(content) = text(fill: default-colors.accent, content)
#let bluet(content) = text(fill: rgb("#1E90FF"), content)
#let greent(content) = text(fill: rgb("#32CD32"), content)

#let cheatsheet(
  title: "Cheat Sheet",
  short_title: none,
  authors: (),
  date: datetime.today(),
  columns-count: 3,
  font-size: 7pt,
  colors: default-colors,
  font: ("Tex Gyre Termes", "Noto Serif CJK SC"),
  code_font: "FiraCode Nerd Font Mono",
  body,
) = {
  set document(title: title)

  // 1. 页面设置：极窄边距
  set page(
    paper: "a4",
    flipped: true, // 横向排版，适合三栏。如果是 false，建议 columns-count 设为 2
    margin: 0.5cm, // 5mm 边距
    header: context {
      // 极简页眉，仅显示标题和页码，字号极小
      set text(size: 6pt, fill: gray)
      if counter(page).get().first() > 0 {
        align(right)[#title - Page #counter(page).display()]
      }
    },
  )

  // 2. 全局字体与间距设置
  set text(font: font, size: font-size, fill: colors.text)
  // 压缩行间距 (leading) 和段落间距 (spacing)
  set par(
    justify: true,
    leading: 0.45em,
    spacing: 0.5em,
    first-line-indent: 0pt,
  )

  // 3. 代码块设置 (Codly) - 紧凑模式
  show: codly-init.with()
  codly(
    languages: codly-languages,
    stroke: 0.5pt + gray, // 细边框
    inset: 0.2em, // 极小内边距
    radius: 2pt,
  )
  // 调整原生 raw 字体大小
  show raw: set text(font: code_font, size: font-size * 0.9)
  show raw.where(block: true): set par(leading: 0.35em)
  show raw.where(block: true): it => {
    block(
      fill: luma(245),
      inset: 3pt,
      radius: 2pt,
      width: 100%,
      it,
    )
  }

  // 4. 列表设置 - 消除缩进浪费
  set list(indent: 0pt, body-indent: 0.5em, marker: [•])
  set enum(indent: 0pt, body-indent: 0.5em)
  // 列表项之间不留空隙
  show list: set block(spacing: 0.4em)
  show enum: set block(spacing: 0.4em)

  // 5. 标题设置 - 视觉强区隔，但空间占用小

  // Level 1: 色块背景，醒目
  show heading.where(level: 1): it => {
    // 移除原有的大片空白和分页
    v(0.5em)
    block(
      fill: colors.primary,
      width: 100%,
      inset: (x: 4pt, y: 2pt),
      radius: 2pt,
      below: 0.5em,
    )[
      #set text(fill: white, weight: "bold", size: font-size * 1.2)
      #upper(it.body)
    ]
  }

  // Level 2: 只有下划线，紧凑
  show heading.where(level: 2): it => {
    v(0.3em)
    block(
      stroke: (bottom: 1pt + colors.secondary),
      width: 100%,
      below: 0.4em,
    )[
      #set text(fill: colors.secondary, weight: "bold", size: font-size * 1.1)
      #it.body
    ]
  }

  // Level 3: 行内标题或微小标题
  show heading.where(level: 3): it => {
    v(0.2em)
    text(fill: colors.text, weight: "bold", size: font-size * 1.05)[#it.body]
    v(0em) // 紧跟正文
  }

  // 6. 数学公式 - 压缩垂直空间
  show math.equation.where(block: true): set block(above: 0.4em, below: 0.4em)

  // 7. 图片表格
  show image: it => align(center, it)
  // 表格文字缩小
  show table: set text(size: font-size * 0.9)

  // 8. Theorion 定理环境集成
  show: show-theorion

  // --- 内容开始 ---

  // 顶部极简信息栏
  align(center)[
    #text(size: font-size * 1.5, weight: "bold", fill: colors.primary)[#title]
    #h(1em)
    #text(fill: gray)[#(authors.map(a => a.name).join(", "))]
    #h(1em)
    #text(fill: gray)[#date.display("[year]-[month]-[day]")]
  ]

  line(length: 100%, stroke: 0.5pt + gray)
  v(-0.5em)

  // 核心：分栏
  columns(columns-count, gutter: 1em)[
    #body
  ]
}
