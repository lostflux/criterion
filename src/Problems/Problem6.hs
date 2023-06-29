{-# LANGUAGE ImportQualifiedPost #-}

-- | The sum of the squares of the first ten natural numbers is
--  1^2 + 2^2 + ... + 10^2 = 385.
--
-- The square of the sum of the first ten natural numbers is
--  (1 + 2 + ... + 10)^2 = 55^2 = 3025.
--
-- Hence the difference between the sum of the squares of the first ten natural numbers
-- and the square of the sum is 3025 - 385 = 2640.
--
-- Find the difference between the sum of the squares of the first one hundred natural numbers
-- and the square of the sum.

module Problems.Problem6 (
    solve
  , solution
) where

-- | Compute the sum of the squares of the first n natural numbers.
-- >>> sumOfSquares 10
-- 385
sumOfSquares :: Integer -> Integer
sumOfSquares n = sum $ map (^2) [1..n]


-- | Compute the square of the sum of the first n natural numbers.
-- >>> squareOfSum 10
-- 3025
squareOfSum :: Integer -> Integer
squareOfSum n = (sum [1..n]) ^ 2

-- | Compute the difference between the sum of the squares of the first n natural numbers
-- and the square of the sum.
-- >>> difference 10
-- 2640
difference :: Integer -> Integer
difference n = squareOfSum n - sumOfSquares n

solve :: Integer -> Integer
solve = difference

solution :: Integer
solution = solve 100

-- >>> solution
-- 25164150
