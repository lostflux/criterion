{-# LANGUAGE ImportQualifiedPost #-}
module Main where

import Test.HUnit

import Problems.Problem1 qualified as P1
import Problems.Problem2 qualified as P2
import Problems.Problem3 qualified as P3
import Problems.Problem4 qualified as P4


main :: IO ()
main = do
  runTestTT $ TestList [
      -- #1
        "Problem 1" ~: P1.solution ~?= 233168
      , "anyDivisor" ~: P1.anyDivisor 100 [3,7] ~?= False
      , "anyDivisor" ~: P1.anyDivisor 100 [3,7,10] ~?= True
      , "P1.solve1" ~: P1.solve1 1000000 [3,5] ~?= 233333166668
      , "P1.solve2" ~: P1.solve2 1000000 [3,5] ~?= 233333166668
      , "P1.solve3" ~: P1.solve3 1000000 [3,5] ~?= 233333166668
    ]

  -- #2
  runTestTT $ TestList [
        "Problem 2" ~: P2.solution ~?= 4613732
      , "fibs" ~: take 10 P2.fibs ~?= [1,2,3,5,8,13,21,34,55,89]
      , "sum even fibs < 1000" ~: sum (takeWhile (< 1000) (filter even P2.fibs)) ~?= 798
    ]

    -- #3
  runTestTT $ TestList [
        "Problem 3" ~: P3.solution ~?= 6857
      , "primes" ~: take 10 P3.primes ~?= [2,3,5,7,11,13,17,19,23,29]
      , "primeFactors" ~: P3.primeFactors 13195 ~?= [5,7,13,29]
      , "primeFactors" ~: P3.primeFactors 600851475143 ~?= [71,839,1471,6857]
    ]


    -- #4
  runTestTT $ TestList [
        "Problem 4" ~: P4.solution ~?= 906609
      , "isPalindrome" ~: P4.isPalindrome 123 ~?= False
      , "isPalindrome" ~: P4.isPalindrome 12321 ~?= True
      , "isPalindrome" ~: P4.isPalindrome 123321 ~?= True
      , "isPalindrome" ~: P4.isPalindrome 1134321 ~?= False
      , "palindromes" ~: (drop 10 . take 20) P4.palindromes ~?= [22,33,44,55,66,77,88,99,101, 111]
      , "palindromes" ~: (drop 990 . take 1000) P4.palindromes  ~?= [89298,89398,89498,89598,89698,89798,89898,89998,90009,90109]
      , "reverseNumber" ~: P4.reverseNumber 12345 ~?= 54321
      , "reverseNumber" ~: P4.reverseNumber 1234567890 ~?= 987654321
      , "reverseNumber" ~: P4.reverseNumber 23432 ~?= 23432
    ]

  return ()
