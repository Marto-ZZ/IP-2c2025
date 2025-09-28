--Parcial 2025 1er cuatri Tema 2 
--1 
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
import System.Win32 (xBUTTON1)
{-# HLINT ignore "Use null" #-}
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