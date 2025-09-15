--Ejemplo recursion
factorial :: Int -> Int
factorial n | n == 0 = 1
            | otherwise = n*factorial(n-1)

--1 
fibonacci :: Int -> Int
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci(n-1) + fibonacci(n-2)

--2
parteEntera :: Float -> Int
parteEntera x | x < 1 = 0
              | otherwise = 1 + parteEntera(x-1)

--7
cantDigitos :: Int -> Int
cantDigitos n | n < 10 = 1
              | otherwise = cantDigitos (div n 10)+ 1

iesimoDigito :: Int -> Int -> Int
iesimoDigito  