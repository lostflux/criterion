{-# LANGUAGE ImportQualifiedPost #-}
module Tests.Test1(
  defaultTests
) where

import Test.HUnit ( (~:), (~?=), runTestTT, Counts, Test(TestList) )

import Problems.Problem1 qualified as P1
import Problems.Problem2 qualified as P2
import Problems.Problem3 qualified as P3
import Problems.Problem4 qualified as P4



-- #1
defaultTests :: IO Counts
defaultTests = runTestTT $ TestList [
      "Problem 1" ~: P1.solution ~?= 233168
    , "anyDivisor" ~: P1.anyDivisor 100 [3,7] ~?= False
    , "anyDivisor" ~: P1.anyDivisor 100 [3,7,10] ~?= True
    , "P1.solve1" ~: P1.solve1 1000000 [3,5] ~?= 233333166668
    , "P1.solve2" ~: P1.solve2 1000000 [3,5] ~?= 233333166668
    , "P1.solve3" ~: P1.solve3 1000000 [3,5] ~?= 233333166668
  ]
