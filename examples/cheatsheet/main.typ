#import "@local/cheatsheet:0.1.0": *

#show: doc => cheatsheet(
  title: "Typst Cheatsheet Demo",
  short_title: "Typst CS",
  authors: (
    (name: "Typst User", email: "user@example.com"),
    (name: "Contributor", email: "dev@example.com"),
  ),
  columns-count: 3,
  font-size: 8pt,
  doc,
)

= 基础格式 (Heading 1)
这是正文文本。模板使用了 *Tex Gyre Termes* 和 *Noto Serif CJK SC*，适合中西文混排。

== 文本高亮 (Heading 2)
我们内置了几个快捷颜色函数：
- 重点：#redt[这是一段红色的重点文字]
- 提示：#bluet[这是一段蓝色的提示信息]
- 成功：#greent[这是一段绿色的成功状态]

=== 列表样式 (Heading 3)
列表被极致压缩以节省空间：
- 第一点内容
- 第二点内容非常紧凑
  - 支持嵌套列表
  - 不浪费缩进空间

= 数学公式 (Math)

行内公式 $E=m c^2$ 非常紧凑。
块级公式也被压缩了垂直间距：

$ nabla dot arrow(E) = rho / epsilon_0 $
$ nabla times arrow(E) = - (partial arrow(B)) / (partial t) $

== 矩阵示例
$
  A = mat(
    1, 2, 3;
    4, 5, 6;
    7, 8, 9
  )
$

= 代码高亮 (Codly)
模板集成了 `codly`，支持漂亮的圆角和行号（配置中已简化边框）：

== Python 示例
```python
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

print(factorial(5))
```

== Rust 示例
```rust
fn main() {
    let x = 5;
    println!("x is: {}", x);
}
```

= 表格 (Tablem)
使用了 `tablem` 支持 Markdown 风格表格，或者使用原生表格：

#three-line-table[
  | *命令* | *快捷键* | *说明* |
  | :--- | :---: | :--- |
  | Save | `Ctrl+S` | 保存文件 |
  | Run | `Ctrl+R` | 运行代码 |
  | Quit | `Ctrl+Q` | 退出程序 |
]

= 布局逻辑
本模板专为 *A4 横向* 设计：
1. *页边距*：仅 0.5cm，最大化利用纸张。
2. *三栏布局*：适合短句和公式速查。
3. *极小字号*：默认为 7pt，本例调整为 8pt。

= Theorion 定理环境
由于引入了 `theorion`，你可以自定义定理块（需在模板中进一步定义具体的环境函数，例如 `#let definition = ...`，或者直接利用其基本样式）。

== 占位符测试
#lorem(40)

= 结尾
记得经常更新你的 Cheatsheet！

$ f(x) = integral_0^oo e^(-t) t^(x-1) partial t $

#redt[*重要提示*]：
如果内容溢出，Typst 会自动将其排到下一页，保持三栏布局。
