{-# LANGUAGE NoImplicitPrelude #-}

-- | Project Euler, Problem 5: Smallest multiple
--
-- 2520 is the smallest number that can be divided by each of the numbers from 1
-- to 10 without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the
-- numbers from 1 to 20?

module Problems.Problem5 (
    solve
  , solution
  , euclid
  , gcd
  , lcm
  , smallestMultiple
) where

import Prelude hiding ( lcm, gcd )
import Data.Foldable (foldl')
import Text.Printf (printf)

solve :: [Integer] -> Integer
solve = smallestMultiple

-- | Solution to Problem 5
--
-- >>> solution
-- 232792560
solution :: Integer
solution = solve [1..20]

-- | Euclidean ALgorithm
--
-- Efficiently fnd the GCD of two numbers.
--
-- >>> euclid 98 21
-- 7
--
-- >>> euclid 198 5382324
-- 18
euclid :: Integral a => a -> a -> a
euclid a b = iter (abs a) (abs b)
  where
    iter x y
      | y == 0    = x
      | otherwise = iter y (x `rem` y)


-- | Greatest common divisor
--
-- >>> gcd 2 3
-- 1
--
-- >>> gcd 21 98
-- 7
gcd :: Integral a => a -> a -> a
gcd = euclid

-- | Least common multiple
--
-- We use the fact that lcm(a, b) = a * b / gcd(a, b)
-- and the efficient computability of the gcd.
--
-- >>> lcm 2 3
-- 6
-- >>> lcm 21 98
-- 294
lcm :: Integral a => a -> a -> a
lcm a b = a * b `div` gcd a b

-- | Find smallest multiple of a collection of numbers.
--
-- >>> smallestMultiple [1..10]
-- 2520
--
-- >>> smallestMultiple [1..20]
-- 232792560
smallestMultiple :: (Foldable c, Integral a) =>  c a -> a
smallestMultiple = foldl' lcm 1

-- print 50 digits per line
-- >>>  smallestMultiple [1..1000]
-- 7128865274665093053166384155714272920668358861885893040452001991154324087581111499476444151913871586911717817019575256512980264067621009251465871004305131072686268143200196609974862745937188343705015434452523739745298963145674982128236956232823794011068809262317708861979540791247754558049326475737829923352751796735248042463638051137034331214781746850878453485678021888075373249921995672056932029099390891687487672697950931603520000

