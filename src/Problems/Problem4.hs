-- | Largest palindrome product
--
--  A palindromic number reads the same both ways. The largest palindrome made
--  from the product of two 2-digit numbers is $9009 = 91 \times 99$.
--
--  Find the largest palindrome made from the product of two 3-digit numbers.

module Problems.Problem4 (
  solution
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

-- >>> isPalindrome 12345
-- False

palindromesFromRange :: [Integer] -> [Integer]
palindromesFromRange range = [x * y | x <- range, y <- range, x <= y, isPalindrome (x * y)]


-- | Infinite stream of (loosely ordered) palindromes.
palindromes :: [Integer]
palindromes = palindromesFromRange [1..]

-- >>> take 10 palindromes
-- [1,2,3,4,5,6,7,8,9,11]

solution :: Integer
solution = head . sortOn Down $ palindromesFromRange [100..999]

-- >>> solution
-- 906609
