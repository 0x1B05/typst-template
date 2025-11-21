#import "@local/notes:0.1.0": *

#show: notes.with(
  title: "Modern Computational Methods",
  short_title: "Comp Methods 2025",
  authors: (
    (name: "Alan Turing", link: "mailto:alan@enigma.com"),
    "Grace Hopper",
  ),
  date: datetime(year: 2025, month: 3, day: 14),
  abstract: [
    This document demonstrates the capabilities of the `notes` template.
    It includes examples of *mathematical theorems*, *syntax-highlighted code*, and *data tables*.
    The layout is optimized for A4 academic papers.
  ],
  toc: true,
  colors: (
    primary: rgb("#1A41AC"),
    secondary: rgb("#2A51BC"),
    accent: rgb("#DC143C"),
    text: rgb("#000000"),
  ),
)

= Introduction

The styling of Level 1 headings includes a page break and a heavy underline.

This template provides helper functions for colored text. You can use #redt[red text for emphasis], #bluet[blue text for information], and #greent[green text for success states].

== Background

Level 2 headings have a full-width underline.

The font settings combine _Tex Gyre Termes_ for English and _Noto Serif CJK SC_ for Chinese characters (if installed), providing a professional academic look.

= Mathematical Tools

Since `@preview/theorion` is integrated, we can easily define beautiful environments.

// 使用我们在文件开头定义的 definition
#definition[
  A *Prime Number* is a natural number greater than 1 that has no positive divisors other than 1 and itself.
]

We can then formulate theorems based on these definitions.

// 使用我们在文件开头定义的 theorem
#theorem[
  *Euclid's Theorem:*
  There are infinitely many prime numbers.

  $ exists P subset NN, |P| = infinity $
]

#proof[
  Assume there is a finite list of primes $p_1, p_2, ..., p_n$.
  Let $N = p_1 p_2 ... p_n + 1$.
  $N$ is not divisible by any $p_i$, implying $N$ is either prime or has a prime factor not in the list. Contradiction.
]

= Code Implementation

The template integrates `@preview/codly`. Code blocks are automatically beautified with line numbers and icons (thanks to `codly-languages`).

// 直接使用 Markdown 风格的代码块
```rust
fn is_prime(n: u64) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..=(n as f64).sqrt() as u64 {
        if n % i == 0 {
            return false;
        }
    }
    true
}
```

Inline code like `let x = 10;` is also styled with a gray background box as defined in the template's `show raw` rule.

= Data Representation

The template includes `@preview/tablem`, allowing you to write tables using Markdown-like syntax.

#figure(
  caption: [Performance Comparison],
  tablem[
    | Algorithm | Complexity | Memory |
    |:----------|:-----------|:-------|
    | Bubble Sort | $O(n^2)$ | $O(1)$ |
    | Merge Sort  | $O(n log n)$ | $O(n)$ |
    | Quick Sort  | $O(n log n)$ | $O(log n)$ |
  ],
)

#figure(
  caption: [Performance Comparison(Three-line-table)],
  three-line-table[
    | Algorithm | Complexity | Memory |
    |:----------|:-----------|:-------|
    | Bubble Sort | $O(n^2)$ | $O(1)$ |
    | Merge Sort  | $O(n log n)$ | $O(n)$ |
    | Quick Sort  | $O(n log n)$ | $O(log n)$ |
  ],
)


== Conclusion

This template wraps multiple complex packages into a unified `notes` function, handling the layout, headers, footers, and typography consistency automatically.
