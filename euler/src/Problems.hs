{-# LANGUAGE ImportQualifiedPost #-}

module Problems(
  benchmarks
) where

import Criterion (bench, whnf, nf, bgroup)
import Criterion.Main (defaultMain)


import Text.Printf (printf, PrintfArg)
import System.Console.ANSI(
      setSGR
    , SGR(SetColor)
    , ColorIntensity(Vivid, Dull)
    , Color(Blue, White)
    , ConsoleLayer(Foreground, Background)
    , SGR(Reset)
  )


import Problems.Problem1 qualified as P1
import Problems.Problem2 qualified as P2
import Problems.Problem3 qualified as P3
import Problems.Problem4 qualified as P4
import Problems.Problem5 qualified as P5
import Problems.Problem6 qualified as P6
import Problems.Problem7 qualified as P7
import Problems.Problem8 qualified as P8
import Problems.Problem9 qualified as P9
import Problems.Problem10 qualified as P10


-------------------------------------------------
--  HELPERS
-------------------------------------------------


-- | given a number, split it into 50 digits per line.
prettyFormat :: Show a => a -> String
prettyFormat n = iter (show n) ""
  where
    iter :: String -> String -> String
    iter s acc
      | length s <= len   = printf "%s\n%s" s acc
      | otherwise         = printf "%s\n%s" firstLen $ iter restLen acc
      where 
        len = 80
        (firstLen, restLen) = splitAt len s


-- | Print provided number in Green.
colorize :: (PrintfArg a, Show a) => Int -> a -> IO ()
colorize id solution = do
  setSGR [SetColor Foreground Vivid Blue]
  printf "\n--------------------------------------------------------------------------------\n"
  printf "Problem/#%d (haskell)\n" id
  printf "--------------------------------------------------------------------------------\n"
  printf "%s" $ prettyFormat solution
  printf "--------------------------------------------------------------------------------\n\n"
  setSGR [Reset]

-----------------------------------------------------

-- | Run all benchmarks.
benchmarks :: IO ()
benchmarks = do

  -- Problem 1
  colorize 1 $ P1.solve 1000
  defaultMain [ bgroup "Problem" [bench "1"  $ nf P1.solve 1000] ]

  -- Problem 2
  colorize 2 $ P2.solve 4000000
  defaultMain [ bgroup "Problem" [bench "2"  $ nf P2.solve 4000000] ]

  -- Problem 3
  colorize 3 $ P3.solve 600851475143
  defaultMain [ bgroup "Problem" [bench "3"  $ nf P3.solve 600851475143] ]

  -- Problem 4
  colorize 4 $ P4.solve [100..999]
  defaultMain [ bgroup "Problem" [bench "4"  $ nf P4.solve [100..999]] ]

  -- Problem 5
  colorize 5 $ P5.solve [1..20]
  defaultMain [ bgroup "Problem" [bench "5"  $ nf P5.solve [1..20]] ]

  -- Problem 6
  colorize 6 $ P6.solve 100
  defaultMain [ bgroup "Problem" [bench "6"  $ nf P6.solve 100]]

  -- Problem 7
  colorize 7 $ P7.solve 10001
  defaultMain [ bgroup "Problem" [bench "7"  $ nf P7.solve 10001]]

  -- Problem 8
  colorize 8 $ P8.solve 13
  defaultMain [ bgroup "Problem" [bench "8"  $ nf P8.solve 13]]

  -- Problem 9
  colorize 9 $ show (P9.solve 1000)
  defaultMain [ bgroup "Problem" [bench "9"  $ nf P9.solve 1000]]

  -- Problem 10
  colorize 10 $ P10.solve 2000000
  defaultMain [ bgroup "Problem" [bench "10"  $ nf P10.solve 2000000]]
