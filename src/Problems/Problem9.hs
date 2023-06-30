-- | A Pythagorean triplet is a set of three natural numbers, $a < b < c$, for which,
-- $a^2 + b^2 = c^2$.
-- For example, $3^2 + 4^2 = 9 + 16 = 25 = 5^2$.
--
-- There exists exactly one Pythagorean triplet for which $a + b + c = 1000$.
-- Find the product $abc$.

module Problems.Problem9 (
    solve
  , solution
) where

import Data.List (find)
import Data.Maybe (fromMaybe)

-- | Is the given triplet a Pythagorean triplet?
isPythagoreanTriplet :: (Integer, Integer, Integer) -> Bool
isPythagoreanTriplet (a, b, c) = (a^2  :: Integer) + (b^2 :: Integer) == c^2

-- >>> isPythagoreanTriplet (3, 4, 5)

-- | Generate all Pythagorean triplets.
pythagoreanTriplets :: [(Integer, Integer, Integer)]
pythagoreanTriplets =
  [
    (a, b, c) |
    c <- [1..],
    b <- [1..c],
    a <- [1..b],
    isPythagoreanTriplet (a, b, c)
  ]

-- >>> take 10 pythagoreanTriplets
-- [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20),(15,20,25),(7,24,25),(10,24,26),(20,21,29)]

-- | Find the Pythagorean triplet for which $a + b + c = 1000$.
naiveSolve :: (Integer, Integer, Integer)
naiveSolve = fromMaybe (0, 0, 0) $ find (\(a, b, c) -> a + b + c == 1000) pythagoreanTriplets

-- >>> solve
-- (200,375,425)

(<?) :: Ord a => a -> (a,a) -> Bool
(<?) x (min, max) = x >= min && x <= max

-- | More efficient approach;
-- Focus on triplets that sum to 1000.
-- | Generate all Pythagorean triplets that sum to 1000.
pythagoreanTripletsN :: Integer -> [(Integer, Integer, Integer)]
pythagoreanTripletsN n =
  [
    (a, b, c) |
    c <- [1..n],
    b <- [c,c-1..1],
    let a = n - (c + b),
    a <? (1,b),
    isPythagoreanTriplet (a, b, c)
  ]

-- >>> head $ pythagoreanTripletsN 12
-- (3,4,5)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

solve :: Integer -> (Integer, Integer, Integer)
solve n = fromMaybe (0, 0, 0) $ safeHead $ pythagoreanTripletsN n

-- >>> solve 1000
-- (200,375,425)

solution :: (Integer, Integer, Integer)
solution = solve 1000


