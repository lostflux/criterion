module Problems.Problem10 (
    solve
) where

import Problems.Problem3 (primes)

-- | Find the sum of all the primes below a given value.
solve :: Integer -> Integer
solve n = sum $ takeWhile (< n) primes

-- >>> solve 10
-- 17

-- >>> solve 2000000
-- 142913828922
