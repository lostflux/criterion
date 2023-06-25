{-# LANGUAGE ImportQualifiedPost #-}
module Tests.Test2 (
  defaultTests
) where

import Test.HUnit ( (~:), (~?=), runTestTT, Test(TestList), Counts )

import Problems.Problem2 qualified as P2

-- #2
defaultTests :: IO Counts
defaultTests = runTestTT $ TestList [
      "Problem 2" ~: P2.solution ~?= 4613732
    , "fibs" ~: take 10 P2.fibs ~?= [1,2,3,5,8,13,21,34,55,89]
    , "sum even fibs < 1000" ~: sum (takeWhile (< 1000) (filter even P2.fibs)) ~?= 798
  ]
