--Ejemplo recursion 
factorial :: Int -> Int
factorial n | n == 0 = 1
            | otherwise = n*factorial (n-1)

--1 
fibonacci :: Int -> Int
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci (n-1) + fibonacci (n-2)

--2
parteEntera :: Float -> Int
parteEntera x | x < 1 = 0
              | otherwise = 1 + parteEntera (x-1)

--3
esDivisible :: Int -> Int -> Bool
esDivisible x y | x == 0 = True
                | x < y = False
                | otherwise = esDivisible (x - y) y -- si x es divisible por y se le va restando ese y hasta llegar a 0, tira True, pero si se le resta y llegaa a ser menor a y pero no 0 no es divisible y tira False

--4
sumaImpares :: Int -> Int
sumaImpares x | x == 0 = 0
              | otherwise = (2*x - 1) + sumaImpares (x - 1) -- siempre dara un numero impar 2x -1, y se repite en bucle restandole 1 a x hasta que de 0

--5
medioFact :: Int -> Int
medioFact x | x == 0 = 1
            | x == 1 = 1
            | otherwise = x * medioFact (x-2) -- es el medio factorial de un numero, multiplica a ese numero y a los que le siguen hasta llegar a 1 saltando de 2 en 2

--6
todosDigitosIguales :: Int -> Bool
todosDigitosIguales x | x < 10 = True
                      | mod x 10 == mod (div x 10) 10 = todosDigitosIguales (div x 10)
                      | otherwise = False -- compara el ultimo digito con el penultimo, si son iguales sigue comparando, si no son iguales devuelve False

--7
cantDigitos :: Int -> Int
cantDigitos x | x == 0 = 0
              | otherwise = 1 + cantDigitos (div x 10)

iesimoDigito :: Int -> Int -> Int
iesimoDigito x i = mod (div x (10^(cantDigitos x - i))) 10

--8
sumaDigitos :: Int -> Int
sumaDigitos x | x < 10 = x
              | otherwise = mod x 10 + sumaDigitos (div x 10) -- suma el ultimo digito usando el mod y luego lo divide por 10 para que quede como ultimo digito el penultimo y asi sucesivamente hasta que queda un solo digito

--9

--10a
sumatoria1 :: Int -> Int
sumatoria1 n | n == 0 = 0
             | otherwise = 2^n + sumatoria1 (n-1)

fff :: Int -> Int
fff 0 = 0
fff n = 2^n + fff (n-1)

--10b
sumatoria2 :: Int -> Int -> Int
sumatoria2 q n | n == 1 = q
               | otherwise = q^n + sumatoria2 q (n-1)

--10c
sumatoria3 :: Int -> Int -> Int
sumatoria3 q n | n == 1 = q^2 + q
               | otherwise = q^(2*n) + q^(2*n-1) + sumatoria3 q (n-1)

--10d

--11a
eAprox :: Integer -> Float
eAprox x | x == 0 = 0
         | otherwise = eAprox (x - 1) + (1 / factorial2 x)

factorial2 :: Integer -> Float
factorial2 0 = 1.0
factorial2 n = fromIntegral n * factorial2 (n - 1)

--11b
e :: Float
e = eAprox 10

--12
sucesion :: Int -> Float
sucesion n | n == 1 = 2
           | otherwise = 2 + (1 / sucesion (n-1))

raizDe2Aprox :: Int -> Float
raizDe2Aprox n = sucesion n - 1


--13
sumatoriaInterna :: Int -> Int -> Int
sumatoriaInterna n 1 = n
sumatoriaInterna n m = m^m + sumatoriaInterna n (m-1)

sumatoriaDoble :: Int -> Int -> Int
sumatoriaDoble 1 m = sumatoriaInterna 1 m
sumatoriaDoble n m = m^m + sumatoriaInterna n (m-1)

--14
sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q n m | n == 0 = 0
                    | otherwise = sumatoriaM q n m + sumatoriaM q (n-1) m

sumatoriaM :: Int -> Int -> Int -> Int
sumatoriaM q n m | m == 0 = 0
                 | otherwise = q^(n+m) + sumatoriaM q n (m-1)


--15
sumaRacionales :: Int -> Int -> Float
sumaRacionales n m | n == 0 = 0
                   | otherwise = (fromIntegral n / fromIntegral m) + sumaRacionales (n-1) m + sumaM n (m-1)

sumaM :: Int -> Int -> Float
sumaM n m | m == 1 = fromIntegral n
          | otherwise = fromIntegral n / fromIntegral m + sumaM n (m-1)

--16 a
menorDivisor :: Int -> Int
menorDivisor n = menorDivisorDesde n 2

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k + 1)

--16 b
esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n =  menorDivisor n == n

--16 c
maxComunDivisor :: Int -> Int -> Int
maxComunDivisor x y | y == 0 = abs x
                    | otherwise = maxComunDivisor y (mod x y)

sonCoprimos :: Int -> Int -> Bool
sonCoprimos n m | n == 0 && m == 0 = False
                | otherwise = maxComunDivisor (abs n) (abs m) == 1

--17
esFibonacci :: Int -> Bool
esFibonacci n = fibonacci2variables n 0

fibonacci2variables :: Int -> Int -> Bool
fibonacci2variables n k | fibonacci k == n = True
                        | fibonacci k > n = False
                        | otherwise = fibonacci2variables n (k+1)

--18
mayorDigitoPar :: Int -> Int
mayorDigitoPar n | n < 10 && par n = n
                 | n < 10 = -1
                 | par ultimoDigito = max ultimoDigito recursion
                 | otherwise = recursion
                 where 
                    ultimoDigito = mod n 10
                    par x = mod x 2 == 0
                    recursion = mayorDigitoPar (div n 10)

--19
esSumaDePrimos :: Int -> Bool
esSumaDePrimos n | n == 2 = True
                 | n == sumaP 2 n = True
                 | otherwise = False

sumaP :: Int -> Int -> Int
sumaP p n | n <= 0 = 0
          | esPrimo p = p + sumaP (p+1) (n-p)
          | otherwise = 0 + sumaP (p+1) n

--21
pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m n r | n == 0 = sumaTernas m 0 r                           --Si n es 0 devuelve la suma de ternas con m y r
                | otherwise = sumaTernas m n r + pitagoras m (n-1) r  --Si n no es 0 suma la cantidad de ternas con m,n y r y sigue buscando con n-1

sumaTernas :: Integer -> Integer -> Integer -> Integer
sumaTernas m n r | m == 0 && esTernaPitagorica m n r = 1              --Si m es es 0 y es terna pitagorica devuelve 1
                 | m == 0 = 0                                         --Si m es 0 y no es terna pitagorica devuelve 0
                 | esTernaPitagorica m n r = 1 + sumaTernas (m-1) n r --Si hay terna pitagorica suma 1 y sigue buscando con m-1
                 | otherwise = 0 + sumaTernas (m-1) n r               --Si no hay terna pitagorica suma 0 y sigue buscando con m-1
            where
                  esTernaPitagorica a b c = a^2 + b^2 <= c^2          --Devuelve True si es terna pitagorica, False si no lo es
