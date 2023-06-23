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



-- | Print provided number in Green.
colorize :: Show a => Int -> a -> IO ()
colorize id solution = do
  setSGR [SetColor Foreground Vivid Blue]
  printf "\n\n\t  #%d: %s\t\n" id $ show solution
  setSGR [Reset]



main :: IO ()
main = do
  forM_ (zip [1..] P.solutions) $ \(i, solution) -> do
    colorize i solution
