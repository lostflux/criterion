-- | The prime factors of $13195$ are $5$, $7$, $13$ and $29$.
--
-- What is the largest prime factor of the number $600851475143$?

module Problems.Problem3(
    solution
  , primes
  , primeFactors
) where
import Data.Traversable (forM)
import Data.List (nub)

-- | Stream a list of primes.
primes :: [Integer]
primes = 2 : sieve primes [3,5..]
  where
    sieve (p:ps) xs =
      let (h, t) = span (< p*p) xs
      in h ++ sieve ps [x | x <- t, x `mod` p /= 0]


-- >>> take 10 primes
-- [2,3,5,7,11,13,17,19,23,29]

-- | Prime factors of a number.
primeFactors :: Integer -> [Integer]
primeFactors n = nub $ factor n primes
  where
    factor :: Integer -> [Integer] -> [Integer]
    factor n (p:ps)
      | n == 1 || p > n  = []
      | p == n           = [p]
      | remainder == 0   = p : factor dividend (p:ps)
      | otherwise        = factor n ps
      where
        (dividend, remainder) = n `divMod` p


-- >>> primeFactors 44572934875
-- [2,3,5]

solve :: Integer -> Integer
solve = last . primeFactors

solution :: Integer
solution = solve 600851475143

-- >>> solution
-- 16716787
