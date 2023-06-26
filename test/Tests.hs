{-# LANGUAGE ImportQualifiedPost #-}
module Main where

import Tests.Test1 qualified as T1
import Tests.Test2 qualified as T2
import Tests.Test3 qualified as T3
import Tests.Test4 qualified as T4
import Tests.Test5 qualified as T5

main :: IO ()
main = do
  T1.defaultTests
  T2.defaultTests
  T3.defaultTests
  T4.defaultTests
  T5.defaultTests
  return ()
