-- If we list all the natural numbers below that are multiples of 3 or 5, we get 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.
module Problems.Problem1 (
    solve
  , solution

  -- Others
  , anyDivisor
  , solve1
  , solve2
  , solve3
) where


import Data.List (nub)
import Control.Monad (when)
import Data.STRef.Strict (readSTRef, modifySTRef, newSTRef)
import Control.Monad.ST.Strict (runST)
import Data.Foldable (for_)


-- | Using a tail-recursive function.
--
-- This is the most efficient solution,
-- and by large the preferred coding pattern in Haskell.
solve :: Integer -> Integer
solve n = n `solve3` [3,5]

solution :: Integer
solution = solve 1000

-- >>> solution
-- 233168

-- | Check if any of the divisors divide the number n.
anyDivisor :: (Foldable c, Integral a) => a -> c a -> Bool
anyDivisor n = any (\x -> n `mod` x == 0)
  -- ^ NOTE: this short-circuits,
  --   i.e. it stops as soon as it finds a divisor.


-- | Using a **lazy** list comprehension.
--
-- This is the most concise &mdash; arguably, simplest &mdash; solution.
--
-- It doesn't blow up since Haskell is lazy by design,
-- which means Haskell generates each element of the list as-needed,
-- and discards it once it's no longer needed.
-- (comparable to `generators` in Python).
--
-- If you try the same in @{C, C++, Java, Python, ...}@,
-- you'll get a stack overflow if the problem is large-enough.
--
-- Examples:
-- >>> solve1 1000 [3,5]
-- 233168
solve1 :: (Foldable c, Integral a) => a -> c a -> a
solve1 bound divisors =
  sum $ filter (`anyDivisor` divisors) [1..bound-1]
  -- ^ sum the list of elements in the range [1..bound-1]
  --   that are divisible by any of the divisors


-- | Using a tail-recursive function.
--
-- This is the most efficient solution,
-- and by large the preferred coding pattern in Haskell.
--
-- Examples:
-- >>> solve2 1000 [3,5]
-- 233168

solve2 :: (Foldable c, Integral a) => a -> c a -> a
solve2 bound divisors = iter 0 0
  where
    iter acc curr
      | curr == bound             = acc
      | anyDivisor curr divisors  = iter (acc + curr) (curr + 1)
      | otherwise                 = iter acc (curr + 1)


-- | Solve using the state monad to track the sum.
-- 
-- This is an anti-pattern,
-- and should be avoided in favor of pure functions.
--
-- Examples:
-- >>> solve3 1000 [3,5]
-- 233168
solve3 :: (Foldable c, Integral a) => a -> c a -> a
solve3 bound divisors =
  runST $ newSTRef 0 >>= compute
  where
    compute total = do
      for_ [1..bound-1] $ \curr -> do
        let status = curr `anyDivisor` divisors
        when status $ modifySTRef total (+ curr)
      readSTRef total


-- >>> solve3 1000 [3,5]
-- 214216
