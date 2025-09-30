{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Use null" #-}
{-# HLINT ignore "Use map" #-}

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
