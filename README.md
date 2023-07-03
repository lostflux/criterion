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

| Problem | Date | Description | Rust | Haskell | Discussion |
| :--- |:--- | ---:| ---: | ---: | ---: |
| N/A | 21/06/2023 | Created repository | N/A | N/A | N/A |
| #1 | 21/06/2023 | Sum of all the multiples of 3 or 5 below 1000 | [$3.7078\ \mu\mathbf{s}$](./src/problem1.rs) | [$46.64\  \mu\mathbf{s}$](./src/Problems/Problem1.hs) | [link](https://amitt.ai/writing/computing/exposition/001-multiples-sum/) |
| #2 | 22/06/2023 | [Sum of even terms of fibonacci sequence below 4,000,000](./src/Problems/Problem2.hs) | [$20.683\ n\mathbf{s}$](./src/problem1.rs)| [$563.0\ n\mathbf{s}$](./src/Problems/Problem2.hs) | N/A |
| #3 | 23/06/2023 | [Largest prime factor of 600851475143](./src/Problems/Problem3.hs) | $26.68\ \mu\mathbf{s}$ | N/A |
| #4 | 24/06/2023 | [Largest palindrome made from the product of two 3-digit numbers](./src/Problems/Problem4.hs) | $323.8\ m\mathbf{s}$ | N/A |
| #5 | 25/06/2023 | [Smallest number evenly divisible by all numbers from 1 to 20](./src/Problems/Problem5.hs) | $1.315\ \mu\mathbf{s}$ | N/A |
| #6 | 26/06/2023 | [Difference between the sum of the squares of the first one hundred natural numbers and the square of the sum](./src/Problems/Problem6.hs) | $3.881\ \mu\mathbf{s}$ | N/A |
| #7 | 27/06/2023 | [10001st prime](./src/Problems/Problem7.hs) | $19.63\ \mu\mathbf{s}$ | N/A |
| #8 | 28/06/2023 | [Largest product in a series](./src/Problems/Problem8.hs) | $1.905\ m\mathbf{s}$ | N/A |
| #9 | 29/06/2023 | [Special Pythagorean triplet that sums up to 1000](./src/Problems/Problem9.hs) | $3.314\ m\mathbf{s}$ | N/A |
| #10 | 30/06/2023 | [Sum of all primes below two million](./src/Problems/Problem10.hs) | $1.550\ m\mathbf{s}$ | N/A |

---
