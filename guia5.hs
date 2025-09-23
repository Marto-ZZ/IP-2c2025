--1.1
longitud :: [t] -> Int                --Tomamos una lista de cualquier tipo "t" (polimorfismo) y devolvemos un Int
longitud [] = 0                       --Caso base: tenemos una lista vacia, su longitud es 0 porque no tiene elementos
longitud (_:xs) = 1 + longitud xs     --Recursion: si da una lista no vacia (x:xs) donde x es el head (primero elemento) y xs la tail (lista sin el primer elemento)
                                      --Entonces la longitud es 1 (por el head) mas la longitud de la tail (xs) hasta llegar al caso base

--1.2
ultimo :: [t] -> t              
ultimo (x:xs) | longitud (x:xs) == 1 = x  --Si la longitud de la lista es 1, devolvemos el unico elemento
              | otherwise = ultimo xs     --Si tiene mas de un elemento hacemos recursion con la tail de xs, hasta llegar al ultimo elemento de la lista

--1.3
principio :: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 1 = []     --Si la longitud de la lista es 1, devuelve una lista vacia ya que excluye al ultimo y unico elemento
                 | otherwise = x : principio xs  --Si no es vacia, devuelve el head (x) y hacemos recursion con lo demas elementos (xs) hasta llegar al caso base donde excluimos al ultimo elemento

--1.4
reverso :: [t] -> [t]
