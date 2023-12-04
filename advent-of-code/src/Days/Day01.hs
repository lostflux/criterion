module Days.Day01 (runDay) where

{- ORMOLU_DISABLE -}
import Data.List
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Maybe
import Data.Set (Set)
import qualified Data.Set as Set
import Data.Vector (Vector)
import qualified Data.Vector as Vec
import qualified Util.Util as U

import qualified Program.RunDay as R (runDay, Day)
import Data.Attoparsec.Text
import Data.Void
{- ORMOLU_ENABLE -}

runDay :: R.Day
runDay = R.runDay inputParser partA partB

------------ PARSER ------------
inputParser :: Parser Input
inputParser = Right

------------ TYPES ------------
type Input = String

type OutputA = Int

type OutputB = Int

------------ PART A ------------
partA :: Input -> OutputA
partA = sum . map read . getRelevantDigits

------------ PART B ------------
partB :: Input -> OutputB
partB = const





-- |
-- 
-- The newly-improved calibration document consists of lines of text;
-- each line originally contained a specific calibration value that
-- the Elves now need to recover.
-- On each line, the calibration value can be found by combining the first digit
-- and the last digit (in that order) to form a single two-digit number.
-- HOWEVER, the lines contain other non-digit characters!
-- the first digit is not necessarily the first character in the line.
-- likewise, the last digit is not necessarily the last character in the line.
--
-- What is the sum of all calibration values?

-- module Advent.Day1 where

sampleInput :: String
sampleInput = "1abc2\n" ++
              "pqr3stu8vwx\n" ++
              "a1b2c3d4e5f\n" ++
              "treb7uchet"

sampleInput2 :: String
sampleInput2 =  "two1nine\n" ++
                "eightwothree\n" ++
                "abcone2threexyz\n" ++
                "xtwone3four\n" ++
                "4nineeightseven2\n" ++
                "zoneight234\n" ++
                "7pqrstsixteen\n"

-- | Given a string with some numeric characters expressed as words,
--  convert them to digits.
--
-- for example:
-- restoreNumeric "one2three3" == "1233"
-- restoreNumeric :: String -> String



getDigits :: String -> [String]
getDigits = map (filter (`elem` ['0'..'9'])) . lines

-- >>> getDigits sampleInput
-- ["12","38","12345","7"]

getRelevantDigits :: String -> [String]
getRelevantDigits = map (\s -> [head s, last s]) . getDigits

-- >>> getRelevantDigits sampleInput
-- ["12","38","15","77"]

-- | Find all calibration values in a string
-- and return their sum.
solve :: String -> Int
solve = sum . map read . getRelevantDigits

-- >>> solve sampleInput
-- 142
