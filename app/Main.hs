{-# LANGUAGE ImportQualifiedPost #-}
module Main where

import Text.Printf (printf, PrintfArg)
import Problems qualified as P

import System.Console.ANSI (
    setSGR
  , SGR(SetColor)
  , ColorIntensity(Vivid)
  , Color(Green)
  , ConsoleLayer(Foreground)
  , SGR(Reset))

-- | Print provided number in Green.
green :: Show a => a -> IO ()
green x = do
  setSGR [SetColor Foreground Vivid Green]
  printf "\n\n#1: %s\n\n" $ show x
  setSGR [Reset]

main :: IO ()
main = do
  green P.problem1
