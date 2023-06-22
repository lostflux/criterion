{-# LANGUAGE ImportQualifiedPost #-}

module Problems(
  problem1
) where

import Problems.Problem1 qualified as P1



-- | Project Euler Problem 1
-- ---
-- Find the sum of all the multiples of 3 or 5 below 1000.
--
-- Brute-force approach using tail-recursion.
problem1 :: Int
problem1 = P1.solve 1000



-- >>> problem1
-- 233168
