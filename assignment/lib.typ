#let task_counter = counter("task")

#let task(body) = {
  task_counter.step()
  context [== task  #task_counter.display()]
  block(
    fill: rgb(250, 255, 250),
    width: 100%,
    inset: 8pt,
    radius: 4pt,
    stroke: rgb(31, 199, 31),
    body,
  )
}

#let tip(body) = {
  block(
    fill: rgb(255, 250, 230),
    width: 100%,
    inset: 8pt,
    radius: 4pt,
    stroke: rgb(250, 170, 0),
    body,
  )
}

#let assignment(
  title: "",
  author: "",
  course_id: "",
  professor_name: "",
  semester: "",
  due_time: "",
  body,
) = {
  set document(title: title, author: author)
  set text(
    font: ("TeX Gyre Termes", "Noto Serif CJK SC"),
    size: 11pt,
    spacing: .35em,
  )
  set page(
    paper: "us-letter",
    header: context {
      let page_number = here().page()
      if (page_number == 1) { none } else if (page_number == 2) {
        align(right, [*#author* | *#course_id: #title* ])
      } else {
        align(right, [*#author* | *#course_id: #title* ])
      }
    },
    footer: context {
      let page_number = here().page()
      let total_pages = counter(page).final().first()
      align(center)[Page #page_number of #total_pages]
    },
  )
  block(height: 25%, fill: none)
  align(center, text(17pt)[
    *#course_id: #title*])
  align(center, text(10pt)[
    Due on #due_time])
  align(center, [_Prof. #professor_name _, #semester])
  block(height: 35%, fill: none)
  align(center)[*#author*]

  pagebreak(weak: false)
  body
}
