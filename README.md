# $\varepsilon$

A collection of interesting coding challenges,
mostly inspited by [Project Euler](https://projecteuler.net/).

This repository is structured as a standard Haskell project,
using [`cabal`](https://www.haskell.org/cabal/), as a package manager
and build tool that uses the [**GHC**](https://www.haskell.org/ghc) compiler for Haskell.

The easiest way to get `cabal`, **GHC**, and all others relevant to the Haskell toolchain
is using [`ghcup`](https://www.haskell.org/ghcup/).

To build the project, run `cabal build` in the root directory.

To _build and run_, use `cabal run`.

All solutions are written in Haskell.

---

## CHANGELOG

| Problem | Date | Description | Rust | Haskell |
| :--- |:--- | :---| ---: | ---: |
| N/A | 21/06/2023 | Created repository | N/A | N/A |
| #1 | 21/06/2023 | [Sum of multiples of 3 or 5 below 1000][discussion-1] ([rs](./src/problem1.rs), [hs](./src/Problems/Problem1.hs)) | $3.7078\ \mu\mathbf{s}$ | $46.64\  \mu\mathbf{s}$ | [link][discussion-1] |
| #2 | 22/06/2023 | Sum of even terms of fibonacci sequence below 4,000,000 ([rs](./src/problem2.rs), [hs](./src/Problems/Problem2.hs)) | $19.855\ n\mathbf{s}$ | $563.0\ n\mathbf{s}$ |
| #3 | 23/06/2023 | Largest prime factor of 600851475143 ([rs](./src/problem3.rs), [hs](./src/Problems/Problem3.hs)) | $10.390\ \mu\mathbf{s}$| $26.68\ \mu\mathbf{s}$ |
| #4 | 24/06/2023 | Largest palindrome made from the product of two 3-digit numbers(rs, [hs](./src/Problems/Problem4.hs)) |  $74.218\ m\mathbf{s}$| $323.8\ m\mathbf{s}$ |
| #5 | 25/06/2023 | Smallest number evenly divisible by all numbers from 1 to 20(rs, [hs](./src/Problems/Problem5.hs)) | $77.210 m\mathbf{s}$ | $1.315\ \mu\mathbf{s}$ |
| #6 | 26/06/2023 | Difference between the sum of the squares of the first one hundred natural numbers and the square of the sum (rs, [hs](./src/Problems/Problem6.hs)) | | $3.881\ \mu\mathbf{s}$ |
| #7 | 27/06/2023 | 10001st prime (rs, [hs](./src/Problems/Problem7.hs)) | | $19.63\ \mu\mathbf{s}$ |
| #8 | 28/06/2023 | Largest product in a series (rs, [hs](./src/Problems/Problem8.hs)) | | $1.905\ m\mathbf{s}$ |
| #9 | 29/06/2023 | Special Pythagorean triplet that sums up to 1000 (rs, [hs](./src/Problems/Problem9.hs)) | | $3.314\ m\mathbf{s}$ |
| #10 | 30/06/2023 | Sum of all primes below two million (rs, [hs](./src/Problems/Problem10.hs)) | | $1.550\ m\mathbf{s}$ |

---

[discussion-1]: https://amitt.ai/writing/computing/exposition/001-multiples-sum/
