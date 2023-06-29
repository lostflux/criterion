-- | Largest palindrome product
--
--  A palindromic number reads the same both ways. The largest palindrome made
--  from the product of two 2-digit numbers is $9009 = 91 \times 99$.
--
--  Find the largest palindrome made from the product of two 3-digit numbers.

module Problems.Problem4 (
    solution
  , solve
  , reverseNumber
  , isPalindrome
  , palindromes
) where

import Data.List (sortOn, sort, nub)
import Data.Ord (Down(Down))


-- | Reverse the digits of a number.
reverseNumber :: Integer -> Integer
reverseNumber = read . reverse . show

-- >>> reverseNumber 12345
-- 54321

-- | Is the number a palindrome?
isPalindrome :: Integer -> Bool
isPalindrome n = n == reverseNumber n

-- >>> isPalindrome 9009
-- True

-- >>> isPalindrome 12321
-- False

palindromesFromRange :: [Integer] -> [Integer]
palindromesFromRange range = [x * y | x <- range, y <- range, x <= y, isPalindrome (x * y)]


-- | Infinite stream of (loosely ordered) palindromes.
palindromes :: [Integer]
palindromes = palindromesFromRange [1..]

-- >>> drop 990 $ take 1000 palindromes
-- [89298,89398,89498,89598,89698,89798,89898,89998,90009,90109]

solve :: [Integer] -> Integer
solve range = head . sortOn Down $ palindromesFromRange range


solution :: Integer
solution = solve [100..999]

-- >>> solution
-- 906609
