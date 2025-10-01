{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Use null" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldr" #-}

--Simulacro T2 (parcial 1c2025)
--1     
sumaDivisores :: Integer -> Integer -> Integer
sumaDivisores n k | n == k = 0
                  | mod n k == 0 = k + sumaDivisores n (k+1)
                  | otherwise = sumaDivisores n (k+1)


cantidadNumerosAbundantes :: Integer -> Integer -> Integer
cantidadNumerosAbundantes d h | d == h && sumaDivisores d 1 > d = 1
                              | sumaDivisores d 1 > d = 1 + cantidadNumerosAbundantes (d+1) h
                              | otherwise = cantidadNumerosAbundantes (d+1) h


--2
vencidas :: [(String, Integer, Integer)] -> [(String, Integer, Integer)]
vencidas ((materia,date,cuatri):xs) | xs == [] && date < 2021 = [(materia,date,cuatri)]
                                    | xs == [] && date == 2021 && cuatri < 2 = [(materia,date,cuatri)]
                                    | xs == [] = []
                                    | date < 2021 = (materia,date,cuatri) : vencidas xs
                                    | date == 2021 && cuatri < 2 = (materia,date,cuatri) : vencidas xs
                                    | otherwise = vencidas xs


quitarRepetidas :: [(String, Integer, Integer)] -> [(String, Integer, Integer)]
quitarRepetidas [] = []
quitarRepetidas (x:xs) | xs == [] = [x]
                       | x == head xs = quitarRepetidas xs
                       | otherwise = head xs : quitarRepetidas (x: tail xs)


soloNombres :: [(String, Integer, Integer)]  -> [String]
soloNombres [] = []
soloNombres ((materia,_,_):xs) = materia : soloNombres xs


cursadasVencidas :: [(String, Integer, Integer)] -> [String]
cursadasVencidas [] = []
cursadasVencidas x = soloNombres (quitarRepetidas (vencidas x))


--3
listaHastaNegativo :: [Integer] -> [Integer]
listaHastaNegativo [] = []
listaHastaNegativo (x:xs) | x >= 0 && head xs < 0 = [x]
                          | x < 0 = listaHastaNegativo xs
                          | x >= 0 = x : listaHastaNegativo xs


cambiarMenores :: [Integer] -> Integer -> [Integer]
cambiarMenores [] _ = []
cambiarMenores (x:xs) u | x > u = u : cambiarMenores xs u
                        | x <= u = x : cambiarMenores xs u

saturarEnUmbralHastaNegativo :: [Integer] -> Integer -> [Integer]
saturarEnUmbralHastaNegativo [] _ = []
saturarEnUmbralHastaNegativo (x:xs) u = cambiarMenores (listaHastaNegativo (x:xs)) u


--4
cantidadParesColumna :: [[Integer]] -> Integer -> Integer
cantidadParesColumna [] _ = 0
cantidadParesColumna (x:xs) n | mod (contarPosicion x n) 2 == 0 = 1 + cantidadParesColumna xs n
                              | otherwise = 0 + cantidadParesColumna xs n



contarPosicion :: [Integer] -> Integer -> Integer
contarPosicion (x:xs) n | n == 1 = x
                        | xs == [] && n >= 2 = 1
                        | otherwise = contarPosicion xs (n-1)


--Parcial 2c 2024 T2
--1
contarHasta :: [Integer] -> Integer -> [Integer]
contarHasta [] _ = []
contarHasta (x:xs) n | n == 1 = [x]
                     | otherwise = x : contarHasta xs (n-1)

sumaLista :: [Integer] -> Float
sumaLista (x:xs) | xs == [] = fromIntegral x
                 | otherwise = fromIntegral x + sumaLista xs


cantidadElementos :: [Integer] -> Float
cantidadElementos [] = 0
cantidadElementos (x:xs) = 1 + cantidadElementos xs

promedioLista :: [Integer] -> Float
promedioLista (x:xs) = sumaLista (x : xs) / cantidadElementos (x : xs)


mediaMovilN :: [Integer] -> Integer -> Float
mediaMovilN (x:xs) n = promedioLista (contarHasta (x:xs) n)


--2
esPrimo :: Integer -> Integer -> Bool
esPrimo 1 _ = False
esPrimo p q | p == q = True
            | mod p q == 0 = False
            | otherwise = esPrimo p (q+1)

factores :: Integer -> Integer -> Integer
factores 1 _ = 1
factores n d | n == d && esPrimo d 2 = 1
             | n == d = 0
             | mod n d == 0 && esPrimo d 2 = 1 + factores (div n d) d
             | otherwise = factores n (d+1)


esAtractivo :: Integer -> Bool
esAtractivo 1 = False
esAtractivo 2 = True
esAtractivo n | esPrimo (factores n 2) 2 = True
              | otherwise = False


--3
quitarBlancos :: [Char] -> [Char]
quitarBlancos [] = []
quitarBlancos (x:xs) | x == ' ' = quitarBlancos xs
                     | otherwise = x : quitarBlancos xs


palabraOrdenadaAux :: String -> Bool
palabraOrdenadaAux [] = True
palabraOrdenadaAux (x:xs) | xs == [] = True
                          | x < head xs = palabraOrdenadaAux xs
                          | otherwise = False


palabraOrdenada :: String -> Bool
palabraOrdenada [] = True
palabraOrdenada (x:xs) = palabraOrdenadaAux (quitarBlancos (x:xs))


--4
