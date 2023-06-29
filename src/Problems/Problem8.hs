module Problems.Problem8 (
    solve
  , findMaxWindow
) where

-- | Find the greatest product of five consecutive digits in the 1000-digit number.

import Data.Char (digitToInt, intToDigit)
import Data.List (tails)

-- | The 1000-digit number.
number :: String
number = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
-- number = "123456789"
-- >>> map digitToInt "12345"


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

-- >>> solve 4
-- 5832

-- >>> solve 13
-- 23514624000
