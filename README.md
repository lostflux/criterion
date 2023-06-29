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

## CHANGELOG

| Problem | Date | Description | Performance | Discussion |
| :--- |:--- | ---:| ---: | ---: |
| N/A | 21/06/2023 | N/A | Created repository | N/A |
| #1 | 21/06/2023 | $46.64 \mu s$ | [Sum of all the multiples of 3 or 5 below 1000](./src/Problems/Problem1.hs) | [link](https://amitt.ai/blog/posts/computing/exposition/001-multiples-sum/) |
| #2 | 22/06/2023 | $563.0 ns$ |  [Sum of even terms of fibonacci sequence below 4,000,000](./src/Problems/Problem2.hs) | [link](https://amitt.ai/blog/posts/computing/exposition/002-fibonacci-sum/) |
| #3 | 23/06/2023 | $26.68 \mu s$ | [Largest prime factor of 600851475143](./src/Problems/Problem3.hs) | [link](https://amitt.ai/blog/posts/computing/exposition/003-largest-prime-factor/) |
| #4 | 24/06/2023 | $323.8 ms$ | [Largest palindrome made from the product of two 3-digit numbers](./src/Problems/Problem4.hs) | [link](https://amitt.ai/blog/posts/computing/exposition/004-largest-palindrome/) |
| #5 | 25/06/2023 | $1.315 \mu s$ | [Smallest number evenly divisible by all numbers from 1 to 20](./src/Problems/Problem5.hs) | [link](https://amitt.ai/blog/posts/computing/exposition/005-least-common-multiple/) |
