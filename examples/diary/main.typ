#import "@local/diary:0.1.0": *

#show: diary

#day(date: "2026-04-01")[
  #section("今日记事")

  今天把 diary 的样式收进了本地包，后面可以直接导入使用。

  #invest[
    继续保留投资复盘的常用区块。
  ]

  #success[
    + 完成了样式抽取
    + 保留了更轻的书写节奏
  ]

  #tomorrow[
    + 继续写新的日记内容
  ]
]

#day(date: "2026-04-02", title: "2026年4月2日 · 保持轻量")[
  #section("今日记事")

  如果只想写正文，也可以只用 `#day` 和 `#section`。

  #note[
    `#review("标题")[...]` 依然可用，适合临时自定义复盘卡片。
  ]
]
