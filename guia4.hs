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

--3
esDivisible :: Int -> Int -> Bool
esDivisible x y | x == 0 = True
                | x < y = False
                | otherwise = esDivisible (x - y) y -- si x es divisible por y se le va restando ese y hasta llegar a 0, tira True, pero si se le resta y llegaa a ser menor a y pero no 0 no es divisible y tira False

--4
sumaImpares :: Int -> Int
sumaImpares x | x == 0 = 0
              | otherwise = (2*x - 1) + sumaImpares(x - 1) -- siempre dara un numero impar 2x -1, y se repite en bucle restandole 1 a x hasta que de 0

--5
medioFact :: Int -> Int
medioFact x | x == 0 = 1
            | x == 1 = 1
            | otherwise = x * medioFact(x-2) -- es el medio factorial de un numero, multiplica a ese numero y a los que le siguen hasta llegar a 1 saltando de 2 en 2

--6
todosDigitosIguales :: Int -> Bool
todosDigitosIguales x | x < 10 = True
                      | mod x 10 == mod (div x 10) 10 = todosDigitosIguales (div x 10)
                      | otherwise = False -- compara el ultimo digito con el penultimo, si son iguales sigue comparando, si no son iguales devuelve False

--7
--cantDigitos :: Int -> Int
--cantDigitos n | n < 10 = 1
--              | otherwise = cantDigitos (div n 10)+ 1

--iesimoDigito :: Int -> Int -> Int
--iesimoDigito  

--8
sumaDigitos :: Int -> Int
sumaDigitos x | x < 10 = x
              | otherwise = mod x 10 + sumaDigitos (div x 10) -- suma el ultimo digito usando el mod y luego lo divide por 10 para que quede como ultimo digito el penultimo y asi sucesivamente hasta que queda un solo digito

--9