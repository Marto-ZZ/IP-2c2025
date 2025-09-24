--1
--1.1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use :" #-}
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
reverso (x:xs) | longitud (x:xs) == 0 = []                                 --Caso base: si la lista es vacia, su reverso es una lista vacia
               | longitud (x:xs) == 1 = [x]                                --Si la longitud es 1, devolvemos el unico elemento de la lista
               | otherwise = [ultimo (x:xs)] ++ reverso (principio (x:xs)) --Tomamos el ultimo elemento de la lista dentro de una lista y le concatenamos (++) el reverso
                                                                           --de la lista sin el ultimo elemento de la lista original y hacemos recursion hasta el caso base

--2
--2.1
pertenece :: (Eq t) => t -> [t] -> Bool           --Definimos las variables de "e" como un elemento que queremos que este en la lista "l"
pertenece e l | longitud l == 0 = False           --Si la longitud de la lista es 0 eso quiere decir que no tiene elementos, asi que e no pertenece
              | head l == e = True                --Si el primer elemento de la lista (head) es "e", entonces devuelve True
              | otherwise = pertenece e (tail l)  --Para los demas casos, hace recursion con el elemento "e" y la lista pero sin su primer elemento, esto frenara cuando se 
                                                  -- encuentre al "e" o cuando la lista se quede sin elementos

--2.2
todosIguales :: (Eq t) => [t] -> Bool                                   --Definimos la signatura donde tenemos una lista de elementos suceptibles a "==" o "/=" y devuelve un Booleano
todosIguales (x:xs) | longitud (x:xs) == 0 = False                      --Sabemos que si la lista no tiene elementos entonces no es cierto que todos sus elementos son iguales, caso base 1
                    | longitud (x:xs) == 1 = True                       --Hacemos sobreespecificacion de que si la lista solo tiene 1 elemento entonces es correcto que sus elementos son iguales
                    | head (x:xs) == head (tail (x:xs)) = todosIguales xs --Si el primer elemento es igual al segundo elemento entonces hacemos recursion pero con la lista arrancando desde 
                    | otherwise = False                                 --El segundo elemento, si nada de lo anterior se cumple significa que hay dos o mas elementos distintos, devuelve False

--2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:xs) | longitud (x:xs) == 0 = False                        --Muy parecido al anterior, solo que vamos a pedir que para las listas con 2 elementos minimo, el primer y ultimo
                      | longitud (x:xs) == 1 = False                        --Elemento sean distintos.
                      | longitud (x:xs) == 2 && [x] /= xs = True            --Cuando solo queden 2 elementos chequeamos que sean distintos
                      | head (x:xs) /= head (tail (x:xs)) = todosDistintos xs --Hacemos recursion si los primeros dos son distintos achicando la lista quitando el primer elemento 
                      | otherwise = False                                   --Hasta quitarle n elementos a la lista tal que queden los suficientes para probar los casos bases.

--2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos (x:xs) | todosDistintos (x:xs) = False   --Nos ayudamos de la funcion del ejercicio anterior, si todos NO son distintos quiere decir que un elemento se repite
                    | otherwise = True
            
--2.5.
    
