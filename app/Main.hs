{-# LANGUAGE ImportQualifiedPost #-}
module Main where

import Text.Printf (printf, PrintfArg)
import Problems qualified as P
import System.Console.ANSI (
    setSGR
  , SGR(SetColor)
  , ColorIntensity(Vivid, Dull)
  , Color(Magenta)
  , ConsoleLayer(Foreground)
  , SGR(Reset))

-- | Print provided number in Green.
colorize :: Show a => a -> IO ()
colorize x = do
  setSGR [SetColor Foreground Vivid Magenta]
  printf "\n\n#1: %s\n\n" $ show x
  setSGR [Reset]

main :: IO ()
main = do
  colorize P.problem1
