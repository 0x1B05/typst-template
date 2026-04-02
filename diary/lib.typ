#let palette = (
  text: rgb("#202020"),
  muted: rgb("#66625C"),
  line: rgb("#CFC6B8"),
  strong-line: rgb("#A9967A"),
  review-fill: rgb("#F6F1E8"),
  review-stroke: rgb("#D7CCBC"),
  note-fill: rgb("#F8F6F2"),
  note-stroke: rgb("#DDD6CA"),
)

#let trim-leading-zero(part) = {
  if part.len() > 1 and part.at(0) == "0" {
    part.slice(1)
  } else {
    part
  }
}

#let display-date(date) = {
  let parts = date.split("-")

  if parts.len() == 3 {
    let year = parts.at(0)
    let month = trim-leading-zero(parts.at(1))
    let day = trim-leading-zero(parts.at(2))
    year + "年" + month + "月" + day + "日"
  } else {
    date
  }
}

#let section-icon(title) = (
  "今日记事": "✍️",
  "A股投资复盘": "📈",
  "投资复盘": "📈",
).at(title, default: none)

#let decorated-section-title(title) = {
  let icon = section-icon(title)

  if icon == none {
    title
  } else {
    icon + " " + title
  }
}

#let diary(
  paper: "a5",
  margin: 1.5cm,
  font: ("Tex Gyre Termes", "Noto Serif CJK SC"),
  size: 10pt,
  body,
) = {
  set page(paper: paper, margin: margin)
  set text(font: font, size: size, fill: palette.text)
  set par(leading: 0.75em, spacing: 0.95em)
  set list(indent: 0pt, body-indent: 1.1em, spacing: 0.4em)
  set enum(indent: 0pt, body-indent: 1.1em, spacing: 0.4em)

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(0.35em, weak: true)
    block(width: 100%)[
      #set text(size: 15pt, weight: "bold")
      #it.body
      #v(0.45em)
      #line(length: 100%, stroke: 1pt + palette.strong-line)
    ]
    v(1.1em)
  }

  show heading.where(level: 2): it => {
    v(1.2em, weak: true)
    block(width: 100%)[
      #set text(size: 11.5pt, weight: "semibold", fill: palette.text)
      #it.body
      #v(0.3em)
      #line(length: 100%, stroke: 0.6pt + palette.line)
    ]
    v(0.7em, weak: true)
  }

  show heading.where(level: 3): it => {
    v(0.8em, weak: true)
    text(size: 10.5pt, weight: "semibold", fill: palette.muted)[#it.body]
    v(0.35em, weak: true)
  }

  body
}

#let day(body, date: "", title: auto) = [
  #heading(level: 1)[
    #(if title == auto { display-date(date) } else { title })
  ]

  #body
]

#let section(title) = heading(level: 2)[#decorated-section-title(title)]

#let review(title, body) = {
  block(
    width: 100%,
    fill: palette.review-fill,
    stroke: 0.6pt + palette.review-stroke,
    radius: 6pt,
    inset: 10pt,
    above: 1em,
    below: 1em,
  )[
    #text(size: 9pt, weight: "semibold", fill: palette.muted)[#title]
    #v(0.45em)
    #body
  ]
}

#let note(body) = {
  block(
    width: 100%,
    fill: palette.note-fill,
    stroke: 0.5pt + palette.note-stroke,
    radius: 5pt,
    inset: 10pt,
    above: 1em,
    below: 1em,
  )[
    #body
  ]
}

#let success(body) = review("成功日记", body)

#let tomorrow(body) = review("明日行动", body)

#let invest(body) = [
  #section("A股投资复盘")
  #body
]
