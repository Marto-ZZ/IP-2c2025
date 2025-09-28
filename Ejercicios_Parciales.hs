{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use null" #-}

--Parcial 2025 1er cuatri Tema 2 
--1 
sumadivisores :: Int -> Int -> Int
sumadivisores h d | d == 1 = 1
                  | mod h d == 0 = d + sumadivisores h (d-1)
                  | otherwise = sumadivisores h (d-1)

cantidadNumerosAbundantes :: Int -> Int -> Int
cantidadNumerosAbundantes d h | d <= h && sumadivisores h (h-1) > h = 1 + cantidadNumerosAbundantes d (h-1)
                              | d > h = 0
                              | otherwise = 0 + cantidadNumerosAbundantes d (h-1)


--Ejercicios de parcial para practicar
--Sistema de Stock
--1
sacarMercaderia :: [String] -> String -> [String]
sacarMercaderia [] _ = []
sacarMercaderia (x:xs) merch | x == merch = sacarMercaderia xs merch
                             | otherwise = x : sacarMercaderia xs merch


contarMercaderia :: [String] -> String -> Int
contarMercaderia [] _ = 0
contarMercaderia (x:xs) merch | merch == x = 1 + contarMercaderia xs merch
                              | otherwise = contarMercaderia xs merch

                            
generarStock :: [String] -> [(String, Int)]
generarStock [] = []
generarStock (x:xs) = (x, contarMercaderia (x:xs) x) : generarStock (sacarMercaderia (x:xs) x)


--2
stockDeProducto :: [(String, Int)] -> String -> Int
stockDeProducto [] prod = 0
stockDeProducto ((p,s):xs) prod | prod == p = s
                                | otherwise = stockDeProducto xs prod

--3
dineroEnStock :: [(String , Int)] -> [(String , Float)] -> Float
dineroEnStock ((p1,s):xs) ((p2,d):ys) | xs == [] = d*fromIntegral s
                                      | otherwise = d*fromIntegral s + dineroEnStock xs ys

--4
aplicarOferta :: [(String , Int)] -> [(String , Float)] -> [(String , Float)]
aplicarOferta _ [] = []
aplicarOferta stock ((prod,precio):ys) | stockDeProducto stock prod > 10 = (prod, precio * 0.8) : aplicarOferta stock ys
                                       | otherwise = (prod, precio) : aplicarOferta stock ys


--Sopa de numeros
--5
type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int)
type Camino = [Posicion]

maximo :: Tablero -> Int
maximo (x:xs) | xs == [] = maximoLista x
              | maximoLista x > maximoLista (head xs) = maximo (x:tail xs)
              | maximoLista (head xs) > maximoLista x = maximo xs

maximoLista :: [Int] -> Int
maximoLista [] = 0
maximoLista (x:xs) | xs == [] = x
                   | x > head xs = maximoLista (x:tail xs)
                   | otherwise = maximoLista xs


--6
apariciones :: Int -> Fila -> Int
apariciones _ [] = 0
apariciones x (y:ys) | x == y = 1 + apariciones x ys
                     | otherwise = apariciones x ys

masApariciones :: Fila -> Fila -> Int
masApariciones (x:xs) (y:ys) | xs == [] = x
                             | apariciones x (y:ys) > apariciones (head xs) (y:ys) = masApariciones (x:tail xs) (y:ys)
                             | otherwise = masApariciones (head xs : tail xs) (y:ys)

aplanarLista :: Tablero -> [Int]
aplanarLista [] = []
aplanarLista (fila:filas) = fila ++ aplanarLista filas

masRepetido :: Tablero -> Int
masRepetido tablero = masApariciones (aplanarLista tablero) (aplanarLista tablero)


--7
ubicarEnFila :: Fila -> Int -> Int
ubicarEnFila (x:xs) 1 = x
ubicarEnFila (x:xs) n = ubicarEnFila xs (n-1)

ubicarEnLista :: Tablero -> Int -> Fila
ubicarEnLista (x:xs) 1 = x
ubicarEnLista (x:xs) m = ubicarEnLista xs (m-1)

valoresDeCamino :: Tablero -> Camino -> [Int]
valoresDeCamino _ [] = []
valoresDeCamino t ((pos1,pos2):ys) = ubicarEnFila (ubicarEnLista t pos1) pos2 : valoresDeCamino t ys  


--8
fibo ::  Int -> Int
fibo n | n == 0 = 0
       | n == 1 = 1
       | otherwise = fibo (n-1) + fibo (n-2) 


esCaminoFibo :: [Int] -> Int -> Bool
esCaminoFibo (x:xs) n | xs == [] && x == fibo n = True
                      | x == fibo n = esCaminoFibo xs (n+1)
                      | otherwise = False



--Perfectos Amigos
--9
divisoresPropios :: Int -> [Int]
divisoresPropios n = divisores n 1

divisores :: Int -> Int -> [Int]
divisores n m | n == m = []
              | mod n m == 0 = m : divisores n (m+1)
              | otherwise = divisores n (m+1)


--10
sumaDivisores :: [Int] -> Int
sumaDivisores (x:xs) | xs == [] = x
                     | otherwise = x + sumaDivisores xs

sonAmigos :: Int -> Int -> Bool
sonAmigos n m | sumaDivisores (divisores n 1) == m && sumaDivisores (divisores m 1) == n = True
              | otherwise = False


--11
perfectos :: Int -> Int -> [Int]
perfectos numero cantidad | cantidad == 0 = []
                          | sumaDivisores (divisores numero 1) == numero = numero : perfectos (numero + 1) (cantidad - 1)
                          | otherwise = perfectos (numero + 1) cantidad


losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos n = perfectos 2 n


--12
listaDeAmigos :: [Int] -> [(Int, Int)]
listaDeAmigos [x] = []
listaDeAmigos (x:xs) | sonAmigos x (head xs) = (x,head xs) : listaDeAmigos (x:tail xs)
                     | otherwise = listaDeAmigos xs