{-# LANGUAGE ImportQualifiedPost #-}
module Tests.Test4 (
  defaultTests
) where

import Test.HUnit ( (~:), (~?=), runTestTT, Counts, Test(TestList) )
import Problems.Problem4 qualified as P4

-- | Test Suite  #4
defaultTests :: IO Counts
defaultTests = runTestTT $ TestList [
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
