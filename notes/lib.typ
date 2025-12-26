#import "@preview/theorion:0.4.1": *
#import "@preview/codly:1.3.0": codly, codly-init
#import "@preview/codly-languages:0.1.1": codly-languages
#import "@preview/tablem:0.3.0": tablem, three-line-table

#let default-colors = (
  primary: rgb("#1A41AC"),
  secondary: rgb("#2A51BC"),
  accent: rgb("#DC143C"),
  text: rgb("#000000"),
)

#let redt(content) = text(fill: default-colors.accent, content)
#let bluet(content) = text(fill: rgb("#1E90FF"), content)
#let greent(content) = text(fill: rgb("#32CD32"), content)

#let notes(
  title: "Lecture Notes",
  short_title: none,
  authors: ("Author",),
  date: datetime.today(),
  abstract: none,
  bibliography-file: none,
  colors: default-colors,
  font: ("Tex Gyre Termes", "Noto Serif CJK SC"),
  code_font: "FiraCode Nerd Font Mono",
  paper_size: "a4",
  toc: true,
  body,
) = {
  let author_list = if type(authors) == array { authors } else { (authors,) }
  let author_names = author_list.map(a => if type(a) == dictionary {
    a.name
  } else { a })

  set document(title: title, author: author_names)

  set page(
    paper: paper_size,
    margin: (left: 2.5cm, right: 2.5cm, top: 3cm, bottom: 3cm),
    numbering: "1",
    number-align: center,
    header: context {
      if counter(page).get().first() > 1 {
        align(center, line(length: 100%, stroke: 0.5pt + gray))
        v(-0.75em)
        let header_text = if short_title != none { short_title } else { title }
        align(center, text(size: 10pt, fill: gray, header_text))
      }
    },
  )

  set text(font: font, size: 11pt, fill: colors.text, spacing: .35em)
  show raw: set text(font: code_font)
  set enum(indent: 0pt, body-indent: 6pt)
  set list(indent: 0pt, body-indent: 6pt)

  set par(justify: true, leading: 0.8em, spacing: 1.2em)

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2em)
    block[
      #set align(center)
      #set text(size: 20pt, weight: "bold", fill: colors.primary)
      #upper(it.body)
      #v(1em)
      #line(length: 60%, stroke: 2pt + colors.primary)
    ]
    v(1.5em)
  }

  show heading.where(level: 2): it => {
    v(1.5em)
    block[
      #set text(size: 16pt, weight: "bold", fill: colors.secondary)
      #it.body
      #v(0.5em)
      #line(length: 100%, stroke: 1pt + colors.secondary)
    ]
    v(1em)
  }

  show heading.where(level: 3): it => {
    v(1em)
    block[
      #set text(size: 14pt, weight: "bold", fill: colors.primary)
      #it.body
    ]
    v(0.75em)
  }

  // --- 核心功能集成 ---

  // A. 定理环境 (Theorion)
  show: show-theorion

  // B. 代码高亮 (Codly)
  // Configure code blocks.
  show: codly-init.with()
  codly(languages: codly-languages)

  show raw.where(block: false): it => box(
    fill: luma(236),
    inset: (x: 2pt),
    outset: (y: 3pt),
    radius: 1pt,
  )[#it]

  // C. 图片表格
  show image: it => align(center, it)
  show figure.where(kind: table): set figure.caption(position: top)

  // D. 数学公式
  // set math.equation(numbering: "(1)")

  // E. 链接
  show link: it => {
    set text(fill: colors.primary)
    underline(stroke: 0.5pt + colors.primary, offset: 1.5pt)[#it]
  }

  // --- 封面页 ---
  align(center)[
    #v(2cm)
    #text(size: 24pt, weight: "bold", fill: colors.primary)[
      #title
    ]
    #v(1cm)
    #text(size: 14pt, fill: colors.secondary)[
      #if short_title != none { short_title }
    ]
    #v(2cm)

    #block(width: 80%)[
      #set text(size: 12pt)
      *Author(s):* \
      #(
        author_list
          .map(a => {
            if type(a) == dictionary and "link" in a {
              link(a.link, a.name)
            } else if type(a) == dictionary {
              a.name
            } else {
              a
            }
          })
          .join(", ")
      )

      #v(1em)
      *Published:* #date.display("[month repr:long] [day], [year]") \
      #v(0.1em)
      *Last Updated:* #datetime.today().display("[month repr:long] [day], [year]")
    ]

    #v(0.3cm)
    #line(length: 50%, stroke: 1pt + colors.primary)

    #if abstract != none {
      v(2cm)
      block(
        width: 80%,
        stroke: (left: 2pt + colors.secondary),
        inset: (left: 1em),
      )[
        #set align(left)
        #text(weight: "bold", fill: colors.secondary)[Abstract] \
        #v(0.5em)
        #abstract
      ]
    }
  ]

  pagebreak()


  if toc {
    show outline.entry.where(level: 1): it => {
      v(12pt, weak: true)
      strong(it)
    }

    outline(title: "Table of Contents", indent: 2em, depth: 4)
    pagebreak()
  }

  body

  if bibliography-file != none {
    pagebreak()
    bibliography(bibliography-file)
  }
}
