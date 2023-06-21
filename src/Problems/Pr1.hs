-- If we list all the natural numbers below that are multiples of 3 or 5, we get 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.
module Problems.Pr1 (
  solve
) where

import Data.List (nub)
import Control.Monad (forM, when)
import Control.Monad.State (state, evalStateT, get, put) 
import System.IO.Unsafe (unsafePerformIO)
import Data.IORef (newIORef, IORef, readIORef, modifyIORef)

solve :: Int -> Int
solve n = n `solve2` [3, 5]

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
solve1 :: Int -> [Int] -> Int
solve1 bound divisors = sum $ nub $ filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) [1..bound-1]

-- | Using a tail-recursive function.
--
-- This is the most efficient solution,
-- and by large the preferred coding pattern in Haskell.
solve2 :: Int -> [Int] -> Int
solve2 bound divisors = iter 0 0 bound
  where
    iter :: Int -> Int -> Int -> Int
    iter acc curr end
      | curr == end = acc
      | any (\x -> curr `mod` x == 0) divisors
        = iter (acc + curr) (curr + 1) end
      | otherwise = iter acc (curr + 1) end

-- | Solve using the state monad to track the sum.
-- 
-- This is an anti-pattern,
-- and should be avoided in favor of pure functions.
solve3 :: Int -> [Int] -> Int
solve3 bound divisors = unsafePerformIO $ do
  total <- newIORef 0

  -- iterate up to bound
  forM [1..bound-1] $ \curr -> do
    let cmod i = (curr `mod` i) == 0

    -- check if divisible by any of the divisors
    when (any (cmod) divisors) $ do
      modifyIORef total (+ curr)

  -- return sum
  readIORef total

-- >>> solve3 102 [3,5]
-- 3415
  

  
