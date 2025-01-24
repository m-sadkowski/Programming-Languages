import System.IO
import Data.Char (intToDigit)


hexToDecimal :: String -> Int
hexToDecimal hex = read ("0x" ++ hex) :: Int


dwumian :: Integer -> Integer -> Integer
dwumian n k
  | k > n     = 0
  | k == 0 || k == n = 1
  | k > n - k = dwumian n (n - k)
  | otherwise = round (exp (sum [log (fromIntegral i) | i <- [(n-k+1)..n]] - sum [log (fromIntegral i) | i <- [1..k]]))


rozkladNaCzynniki :: Integer -> [Integer]
rozkladNaCzynniki 1 = []
rozkladNaCzynniki n = factor : rozkladNaCzynniki (n `div` factor)
  where
    factor = head [x | x <- [2..n], n `mod` x == 0]


sumaDzielnikow :: Int -> Int
sumaDzielnikow x = sum [d | d <- [1..(x `div` 2)], x `mod` d == 0]

czyObfita :: Int -> Bool
czyObfita x = sumaDzielnikow x > x

liczbyObfite :: Int -> [Int]
liczbyObfite n = [x | x <- [1..n-1], czyObfita x]

czySumaObfitych :: Int -> [Int] -> Bool
czySumaObfitych x obfite = any (\a -> let b = x - a in b >= a && b `elem` obfite) obfite


zad4 :: String -> String
zad4 n = reverse $ concatMap (\x -> replicate 2 (intToDigit x)) [0..(hexToDecimal n)]

zad14 :: Int -> Int
zad14 n = head [x | x <- [n, n-1..1], not (czySumaObfitych x obfite)]
  where
    obfite = liczbyObfite n

zad50 :: Integer -> Integer -> Integer
zad50 n k = sum(rozkladNaCzynniki(dwumian n k))







