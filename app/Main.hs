{-# LANGUAGE ImportQualifiedPost #-}

module Main where

import Text.Printf (printf, PrintfArg)
import Problems qualified as P
import System.Console.ANSI(
      setSGR
    , SGR(SetColor)
    , ColorIntensity(Vivid, Dull)
    , Color(Blue, White)
    , ConsoleLayer(Foreground, Background)
    , SGR(Reset)
  )
import Data.Traversable (forM)
import Control.Monad (forM_)

import Criterion (bench, whnf, nf, bgroup)
import Criterion.Main (defaultMain)

-- | given a number, split it into 50 digits per line.
prettyFormat :: Integer -> String
prettyFormat n = iter (show n) ""
  where
    iter :: String -> String -> String
    iter s acc
      | length s <= 50    = printf "%s\n%s" s acc
      | otherwise         = printf "%s\n%s" (take 50 s) (iter (drop 50 s) acc)


-- | Print provided number in Green.
colorize :: (PrintfArg a) => Int -> a -> IO ()
colorize id solution = do
  setSGR [SetColor Foreground Vivid Blue]
  printf "\n\n--------------------------------------------------\n"
  printf "Problem/#%d\n" id
  printf "--------------------------------------------------\n"
  printf "%s" solution
  printf "--------------------------------------------------\n"
  setSGR [Reset]



main :: IO ()
main = do

  forM_ (enumerate P.solutions) $ \(i, solution) -> do
    colorize i $ prettyFormat solution

    -- let benchmarks = 
      
    defaultMain [
        bgroup "Problem" [bench (printf "#%d" i)  (nf (\_ -> solution) 0)]
      ]

enumerate :: [a] -> [(Int, a)]
enumerate = zip [1..]
