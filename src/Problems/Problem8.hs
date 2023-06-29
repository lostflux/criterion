module Problems.Problem8 (
    solve
  , findMaxWindow
) where

-- | Find the greatest product of five consecutive digits in the 1000-digit number.

import Data.Char (digitToInt, intToDigit)
import Data.List (tails)

-- | The 1000-digit number.
number :: String
number =  "73167176531330624919225119674426574742355349194934" ++
          "96983520312774506326239578318016984801869478851843" ++
          "85861560789112949495459501737958331952853208805511" ++
          "12540698747158523863050715693290963295227443043557" ++
          "66896648950445244523161731856403098711121722383113" ++
          "62229893423380308135336276614282806444486645238749" ++
          "30358907296290491560440772390713810515859307960866" ++
          "70172427121883998797908792274921901699720888093776" ++
          "65727333001053367881220235421809751254540594752243" ++
          "52584907711670556013604839586446706324415722155397" ++
          "53697817977846174064955149290862569321978468622482" ++
          "83972241375657056057490261407972968652414535100474" ++
          "82166370484403199890008895243450658541227588666881" ++
          "16427171479924442928230863465674813919123162824586" ++
          "17866458359124566529476545682848912883142607690042" ++
          "24219022671055626321111109370544217506941658960408" ++
          "07198403850962455444362981230987879927244284909188" ++
          "84580156166097919133875499200524063689912560717606" ++
          "05886116467109405077541002256983155200055935729725" ++
          "71636269561882670428252483600823257530420752963450"


findMaxWindow :: Int -> String -> [Int]
findMaxWindow n chars
  | n > length number = []
  | otherwise         = iter 0 startingMaxList startingMaxList startingRemainingList
  
  where
    (startingMaxList, startingRemainingList)  = splitAt n $ map digitToInt chars
    startingMaxVal                            = product startingMaxList

    iter :: Int -> [Int] -> [Int] -> [Int] -> [Int]
    iter maxVal maxList currList remainingList
      | length remainingList == 0   = 
        if currVal > maxVal then currList else maxList
      | currVal > maxVal            = iter currVal currList nextCurrList nextRemainingList
      | otherwise                   = iter maxVal maxList nextCurrList nextRemainingList

      where
        nextCurrList      = tail currList ++ [head remainingList]
        nextRemainingList = tail remainingList
        currVal           = product currList

--- >>> findMaxWindow 13 $ map intToDigit $ [1..9] ++ [9,8..1] ++ [1..9]
-- [3,4,5,6,7,8,9,9,8,7,6,5,4]

solve :: Int -> Int
solve n = product $ findMaxWindow n number

-- >>> solve 13
-- 23514624000

-- >>> solve 13
-- 23514624000
