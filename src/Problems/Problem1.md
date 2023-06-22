# Coding Exposition

## [Problem 1](https://projecteuler.net/problem=1)

### Problem Statement

If we list all the natural numbers below 10 that are multiples of $3$ or $5$,
we get $3$, $5$, $6$ and $9$. The sum of these multiples is $23$.

Find the sum of all the multiples of $3$ and $5$ below $1000$.

### Utility Functions

```haskell
-- | Check if any of the divisors divide the number n.
anyDivisor :: (Foldable container, Integral a) => a -> container a -> Bool
anyDivisor n divisors =
  foldr (\x acc -> acc || n `mod` x == 0) False divisors
```

### Approach 1

Generate a list of all the numbers below $1000$ that are multiples of $3$ or
$5$, then sum them.

```haskell
solve1 :: Int -> [Int] -> Int
solve1 bound divisors =
  sum $ nub $ filter (`anyDivisor` divisors) [1..bound-1]
  -- ^ sum the list of *unique* elements (nub)

-- >>> solve1 1000 [3,5]
-- 233168
```

### Approach 2

Avoid generating a list and instead use a tail-recursive iteration
to sum the multiples.

```haskell
solve2 :: Int -> [Int] -> Int
solve2 bound divisors = iter 0 0 bound
  where
    iter :: Int -> Int -> Int -> Int
    iter acc curr end
      | curr == end = acc
      | anyDivisor curr divisors
        = iter (acc + curr) (curr + 1) end
      | otherwise = iter acc (curr + 1) end

-- >>> solve2 1000 [3,5]
-- 271066
```

#### Approach 3

Instead of a tail recursion (which is unrolled into a loop by [GHC](https://www.haskell.org/ghc/)) anyway,
use the state monad to maintain the state of the accumulator
an explicit loop to check multiples.

```haskell
solve3 :: Int -> [Int] -> Int
solve3 bound divisors = unsafePerformIO $ do
  
  total <- newIORef 0                     -- initialize sum to 0

  forM [1..bound-1] $ \curr -> do         -- iterate upto bound using curr as index
    when (anyDivisor curr divisors) $ do  -- when curr is a multiple...
      modifyIORef total (+ curr)          -- add curr to sum

  readIORef total                         -- return final value of sum

-- >>> solve3 1000 [3,5]
-- 233168
```
