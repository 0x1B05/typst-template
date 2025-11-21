#import "@local/assignment:0.1.0": *

#show: assignment.with(
  title: "Assignment 3: Probability & Statistics",
  author: "Alex Smith",
  course_id: "STAT 201",
  professor_name: "Dr. Gauss",
  semester: "Spring 2025",
  due_time: "March 15, 2025",
)

= Part A: Theoretical Questions

In this section, we derive the fundamental properties of the distributions.

#task[
  Problem 1:
  Let $X$ be a random variable following a normal distribution $N(mu, sigma^2)$.
  Calculate the probability that $X$ falls within one standard deviation of the mean.

  _Solution:_
  We know that:
  $
    P(mu - sigma <= X <= mu + sigma) = integral_(mu - sigma)^(mu + sigma) 1/(sigma sqrt(2 pi)) e^(-1/2 ((x - mu)/sigma)^2) dif x
  $

  Using the standard normal table, this value is approximately 0.6827.
]

#tip[
  *Note:* Remember to standardize the variable $Z = (X - mu) / sigma$ before looking up the Z-table.
]

#task[
  Problem 2:
  Define the term "Independent Events" in the context of probability theory.

  _Answer:_
  Two events $A$ and $B$ are independent if and only if:
  $ P(A inter B) = P(A) P(B) $
]

#pagebreak()

= Part B: Applied Problems

#lorem(50)

#task[
  Problem 3:
  A fair six-sided die is rolled 10 times. What is the probability of rolling exactly three 6s?

  _Solution:_
  This follows a Binomial Distribution with $n=10$ and $p=1/6$.
  $ P(X = 3) = binom(10, 3) (1/6)^3 (5/6)^7 $

  Calculating the value:
  $ P(X = 3) approx 0.155 $
]

#tip[
  *Coding Hint:* You can verify this result using Python:
  ```python
  from scipy.stats import binom
  print(binom.pmf(3, 10, 1/6))
  ```
]

#pagebreak()
= Part C: Conclusion

#lorem(60)

#task[
  Final Task:
  Summarize the findings of the experiment described in the appendix.

  _Summary:_
  The data converges to the expected mean as the sample size $N$ increases, satisfying the Law of Large Numbers.
]
