module Problems.Problem7 (
    solve
) where

-- | What is the 10 001st prime number?

import Problems.Problem3 (primes)

solve :: Int -> Integer
solve = (primes !!) . (subtract 1)

-- >>> map solve [1..10]
-- [2,3,5,7,11,13,17,19,23,29]

-- >>> solve 10001
-- 104743
