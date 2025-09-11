--1
f 1 = 8
f 4 = 131
f 16 = 16

g x | x == 8 = 16
    | x == 16 = 4
    | x == 131 = 1
    | otherwise = -1

--2a
absoluto :: Int -> Int
absoluto n | n < 0 = -n
           | otherwise = n

--2b
maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y = max (absoluto x) (absoluto y)

--2c
maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c | a>b && a>c = a
              | b>a && b>c = b
              | c>a && c>b = c

--2d
algunoEsCero :: Float -> Float -> Bool
algunoEsCero x y | x == 0 = True
                 | y == 0 = True
                 |otherwise = False

algunoEsCero2 0 y = True
algunoEsCero2 x 0 = True
algunoEsCero2 x y = False

--2e
ambosSonCero :: Float -> Float -> Bool
ambosSonCero x y = x == 0 && y == 0

ambosSonCero2 0 0 = True
ambosSonCero2 x 0 = False
ambosSonCero2 0 y = False

--2f
enMismoIntervalo :: Float -> Float -> Bool
enMismoIntervalo x y | x <= 3 && y <= 3 = True
                     | x > 3 && x <= 7 && y > 3 && y <= 7 = True
                     | x > 7 && y > 7 = True
                     | otherwise = False

--2g
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c | a /= b && a /= c && b /= c = a + b + c
                    | a == b && a /= c = a + c
                    | a == c && a /= b = a + b
                    | b == c && b /= a = b + a
                    | otherwise = a

--2h
esMultiplo :: Int -> Int -> Bool
esMultiplo a b = mod a b == 0

--2i
digitoUnidades :: Int -> Int
digitoUnidades n = mod n 10

--2j
digitoDecenas :: Int -> Int
digitoDecenas n | n>9 = mod n 100