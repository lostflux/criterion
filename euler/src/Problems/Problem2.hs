-- | Each new term in the Fibonacci sequence is generated by adding the previous two terms.
-- By starting with $1$ and $2$, the first  terms will be:
--
-- [ 1,2,3,5,8,13,21,34,55,89,...]
--
-- By considering the terms in the Fibonacci sequence whose values do not exceed four million,
-- find the sum of the even-valued terms.

module Problems.Problem2 (
    solve
  , solution
  , fibs
) where

-- | Stream of Fibonacci numbers,
--  i.e. infinite list of Fibonacci numbers.
-- starting with 1, 2, ...
fibs :: [Integer]
fibs = 1 : 2 : zipWith (+) fibs (tail fibs)

phi1, phi2 :: Double
phi1 = (1 + sqrt 5) / 2
phi2 = (1 - sqrt 5) / 2


-- | Stream of Fibonacci numbers,
--  i.e. infinite list of Fibonacci numbers.
-- starting with 1, 2, ...
-- generated using golden ratio.
-- where $φ = \frac{1 + \sqrt{5}}{2}$
-- and $F_n = round(phi ^ (n-1))$
fibs2 :: [Integer]
fibs2 = drop 1 $ map (round . (\n -> (phi1 ^ n - phi2 ^ n) / sqrt 5)) [1..]

-- >>> take 10 fibs2
-- [1,2,3,5,8,13,21,34,55,89]

-- >>> take 10 fibs
-- [1,2,3,5,8,13,21,34,55,89]



-- >>> take 10 fibs
-- [1,2,3,5,8,13,21,34,55,89]

-- >>> take 10 fibs2
-- [1,2,3,5,8,13,21,34,55,89]

-- | Sum of even-valued terms in the Fibonacci sequence
-- whose values do not exceed given limit.
solve, solve2 :: Integer -> Integer
solve2 n = sum $ filter even $ takeWhile (< n) fibs2

solve n = iter 0 fibs2
  where
    iter acc fibs
      | head fibs >= n = acc
      | even (head fibs) = iter (acc + head fibs) (tail fibs)
      | otherwise = iter acc (tail fibs)


solution :: Integer
solution = solve 4000000

-- >>> solution
-- 4613732
