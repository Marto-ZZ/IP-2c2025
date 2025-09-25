--1
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

--2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar q [] = []                                        --Nuestro caso base es que si la long de la lista es 1 devolvemos dependiendo si ese elemento es igual al nuemero q que ingresa el usuario
quitar q (x:xs) | longitud (x:xs) == 1 && x == q = []   --Si q no es x entonces devuelve la lista con x, en cambio si q es x entonces devuelve la lista
                | longitud (x:xs) == 1 = [x]
                | q == x = xs                           --Si q es x pero la longitud no es 1 deuvelve el resto de la lista
                | otherwise = x : quitar q xs           --Hacemos recursion si x no vale q, devolvemos una lista con x y le concatenamos la iteracion de quitar pero con q y la tail de (x:xs)

--2.6.
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos q (x:xs) | longitud (x:xs) == 1 && q == x = []  --Muy similar al anterior, solo que no frenamos cuando q == x = xs
                     | longitud (x:xs) == 1 = [x]
                     | q == x = quitarTodos q xs
                     | q /= x = x : quitarTodos q (xs)
                     | otherwise = (x:xs)

--2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs) | longitud xs == 0 = [x]
                         | pertenece x xs = eliminarRepetidos xs
                         | otherwise = x : eliminarRepetidos xs



--3
--3.3
maximo :: [Int] -> Int
maximo (x:xs) | longitud (x:xs) == 1 = x                    --Si la long es 1 entonces solo hay un elemento que es el maximo al mismo tiempo (caso base)
              | x > head (xs) = maximo (x : (tail xs))       --Si el primer elemento es mas grande que el segundo, entonces iteramos con para probar la funcion con el primer elemento y la cola de lo que sigue
              | otherwise = maximo (head (xs) : (tail xs))   --Si el primero es mas chico que el segundo, entonces iteramos con el segundo elemento y los numeros que le siguen en la lista



--3.9
ordenar :: [Int] -> [Int]
ordenar [x] = [x]                                             --Caso base, nuestra lista tiene un solo elemento, osea que ya esta ordenada
ordenar xs = ordenar (quitar (maximo (xs)) xs) ++ [maximo xs]  --Hacemos recursion sobre una lista xs donde iteramos despues de sacarle a esa lista su maximo y concatenarselo al final



--6
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos nom [] = False                                 --Si la lista de contactos (tuplas con nombre y telefono) es vacia, entonces siempre sera falso que algo este dentro de eso
enLosContactos nom (x:xs)| nom == fst (x) = True               --Si el nombre "nom" esta en el primer elemento de la lista que tiene las tupla contacto, entonces dara true
                       | xs == [] = False                     --Si despues de la primera tupla no hay mas tuplas restantes entonces sera falso
                       | otherwise = enLosContactos nom (xs)  --Si ninguna se cumple, entonces iteramos con la fucion usando el nombre y la lista Contacto pero sin la priemra tupla



--8
--8.0 (ejemplo parecido a 8.1)
multiplicarFilas :: [[Int]] -> [Int]                                   --Hacemos una funcion que hace una lista nueva donde su primer elemento es el resultado de una funcion auxiliar y le concatena la iteracion
multiplicarFilas [] = []                                               --Hasta llegar al caso base donde la lista es vacia y no le agrega nada
multiplicarFilas (x:xs) = (multiplicarUnaFila x) : multiplicarFilas xs


multiplicarUnaFila :: [Int] -> Int
multiplicarUnaFila [] = 1
multiplicarUnaFila (x:xs) = x * multiplicarUnaFila xs                  --Va multiplicando todos los elementos de la lista hasta que esta es vacia, donde multiplica por 1 y se corta la funcion


--8.2
