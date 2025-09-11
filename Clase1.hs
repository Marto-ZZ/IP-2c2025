--1
ff 1 = 8
ff 4 = 131
ff 16 = 16

gg x | x == 8 = 16
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

--3
estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b | a == 0 || b == 0 || div (-a) b ==0 = False
                      | a*a + a*b*div (-a) b == 0 = True
                      | otherwise = False

--4 a
productoInterno :: (Int, Int) -> (Int, Int) -> Int
productoInterno (a,b) (c,d) = a*c + b*d

--4b
esParMenor :: (Int, Int) -> (Int, Int) -> Bool
esParMenor (a,b)(c,d) | a < c && b < d = True
                      | otherwise = False

--4c
distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (a,b) (c,d) = sqrt((c-a)**2 + (d-b)**2)

--4d
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a,b,c) = a + b + c

--4e
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) d | mod a d == 0 && mod b d == 0 && mod c d == 0 = a + b + c
                             | mod a d == 0 && mod b d == 0 && mod c d /= 0 = a + b
                             | mod a d == 0 && mod b d /= 0 && mod c d == 0 = a + c
                             | mod a d /= 0 && mod b d == 0 && mod c d == 0 = b + c
                             | mod a d == 0 && mod b d /= 0 && mod c d /= 0 = a
                             | mod b d == 0 && mod a d /= 0 && mod c d /= 0 = b
                             | mod c d == 0 && mod a d /= 0 && mod b d /= 0 = c
                             | otherwise = 0

--4f
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a,b,c) | mod a 2 == 0 = a
                     | mod b 2 == 0 = b
                     | mod c 2 == 0 = c
                     | otherwise = 4

--4g
crearPar :: a -> b -> (a,b)
crearPar x y = (x,y)

--4h
invertir :: (a,b) -> (b,a)
invertir (x,y) = (y,x)

--5
f :: Int-> Int
f n | n <= 7 = n^2
    | n > 7 = 2*n - 1

g:: Int -> Int
g n | mod n 2 == 0 = div n 2
    | otherwise = 3*n + 1

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (a,b,c) | f a > g a && f b > g b && f c > g c = True
                     | otherwise = False

--6
type Año = Int
type EsBisiesto = Bool
bisiesto :: Año -> EsBisiesto
bisiesto a | mod a 4 /= 0 = False 
           | mod a 100 == 0 && mod a 400 /= 0 = False
           | otherwise = True

--7a