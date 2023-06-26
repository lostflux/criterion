{-# LANGUAGE ImportQualifiedPost #-}

module Problems(
  solutions
) where

import Problems.Problem1 qualified as P1
import Problems.Problem2 qualified as P2
import Problems.Problem3 qualified as P3
import Problems.Problem4 qualified as P4
import Problems.Problem5 qualified as P5


-- | List of solutions to the problems.
-- solutions :: [Int]
solutions :: [Integer]
solutions = [
      P1.solution
    , P2.solution
    , P3.solution
    , P4.solution
    , P5.solution
  ]
