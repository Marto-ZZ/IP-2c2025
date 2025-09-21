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