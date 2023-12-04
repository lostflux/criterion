{-# LANGUAGE ImportQualifiedPost #-}
module Tests.Test3 (
  defaultTests
) where

import Test.HUnit ( (~:), (~?=), runTestTT, Counts, Test(TestList) )
import Problems.Problem3 qualified as P3

-- | Test Suite  #3
defaultTests :: IO Counts
defaultTests = runTestTT $ TestList [
      "Problem 3" ~: P3.solution ~?= 6857
    , "primes" ~: take 10 P3.primes ~?= [2,3,5,7,11,13,17,19,23,29]
    , "primeFactors" ~: P3.primeFactors 13195 ~?= [5,7,13,29]
    , "primeFactors" ~: P3.primeFactors 600851475143 ~?= [71,839,1471,6857]
  ]
