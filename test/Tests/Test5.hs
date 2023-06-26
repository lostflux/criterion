{-# LANGUAGE ImportQualifiedPost #-}
module Tests.Test5 (
  defaultTests
) where

import Test.HUnit ( (~:), (~?=), runTestTT, Counts, Test(TestList) )
import Problems.Problem5 qualified as P5

-- | Test Suite  #4
defaultTests :: IO Counts
defaultTests = runTestTT $ TestList [
      "Problem5" ~: P5.solution ~?= 232792560
    , "euclid" ~: P5.euclid 98 21 ~?= 7
    , "euclid" ~: P5.euclid 198 5382324 ~?= 18
    , "gcd" ~: P5.gcd 2 3 ~?= 1
    , "gcd" ~: P5.gcd 21 98 ~?= 7
    , "lcm" ~: P5.lcm 2 3 ~?= 6
    , "lcm" ~: P5.lcm 21 98 ~?= 294
    , "smallestMultiple" ~: P5.smallestMultiple [1..10] ~?= 2520
    , "smallestMultiple" ~: P5.smallestMultiple [1..20] ~?= 232792560
    , "smallestMultiple" ~: P5.smallestMultiple [1..100] ~?= 69720375229712477164533808935312303556800
  ]
