{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Project Euler, Problem 5: Smallest multiple
--
-- 2520 is the smallest number that can be divided by each of the numbers from 1
-- to 10 without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the
-- numbers from 1 to 20?

module Problems.Problem5(
  solution,
  euclid,
  gcd,
  lcm,
  smallestMultiple
) where

import Prelude hiding ( lcm, gcd )
import Data.Foldable (foldl')
import Text.Printf (printf)

-- | Solution to Problem 5
--
-- >>> solution
-- 232792560
solution :: Integer
solution = smallestMultiple [1..20]

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

-- | given a number, split it into 50 digits per line.
prettyPrint :: Integer -> String
prettyPrint n = iter (show n) ""
  where
    iter :: String -> String -> String
    iter s acc
      | length s <= 50    = printf "%s\n%s" s acc
      | otherwise         = printf "%s\n%s" (take 50 s) (iter (drop 50 s) acc)

  

-- print 50 digits per line
-- >>>  prettyPrint $ smallestMultiple [1..1000]
-- "71288652746650930531663841557142729206683588618858\n93040452001991154324087581111499476444151913871586\n91171781701957525651298026406762100925146587100430\n51310726862681432001966099748627459371883437050154\n34452523739745298963145674982128236956232823794011\n06880926231770886197954079124775455804932647573782\n99233527517967352480424636380511370343312147817468\n50878453485678021888075373249921995672056932029099\n390891687487672697950931603520000\n"

