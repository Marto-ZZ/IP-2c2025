from queue import LifoQueue as Pila

#Ejercicio 1 [2 puntos]

#Implementar la función prefijo_que_mas_suma:
#problema prefijo_que_mas_suma (in s: seq⟨Z⟩) : Z {
#requiere: { |s| > 0 }
#asegura: { res = ∑_{i=0}^k s[i] para algún k tal que 0 ≤ k < |s| }
#asegura: { res ≥ ∑_{i=0}^k s[i] para todos los k tales que 0 ≤ k < |s| }
#}

def prefijo_que_mas_suma(s: list[int]) -> int:
    max = s[0]
    suma = 0

    for num in s:
        suma += num
        if suma > max:
            max = suma
    return max

print(prefijo_que_mas_suma([-5, -2, -3]))

#Ejercicio 2 [2 puntos]

#Todavía existen materias en las cuales los exámenes se entregan en papel. A medida que los estudiantes van entregando, van apoyando (¡apilando!) sobre el escritorio del docente sus exámenes, y en la primera hoja indican su nombre y la cantidad de hojas entregadas (además del enunciado). 
#Esta información se almacena en una Pila de String × Z. Nos interesa conocer el nombre de la primera persona que entregó un examen en blanco (es decir, entregó 0 hojas además del enunciado).
#problema primera_entrega_en_blanco (in examenes: Pila⟨String × Z⟩) : String {
#requiere: { Las primeras componentes de examenes son strings no vacíos y todos distintos entre sí }
#requiere: { Existe al menos un elemento p dentro de la pila examenes tal que p₁ = 0 }
#asegura: { Sea p el primer elemento insertado en la pila examenes tal que p₁ = 0. Entonces, res = p₀ }
#}

def primera_entrega_en_blanco(examenes:Pila[tuple[str,int]]) -> str:
    lista_aux = []
    while not examenes.empty():
        lista_aux.append(examenes.get())

    for i in range(len(lista_aux)-1, -1, -1):
        examenes.put(lista_aux[i])

    i = len(lista_aux)-1
    while i >= 0:
        if lista_aux[i][1] == 0:
            return lista_aux[i][0]
        else:
            i -= 1

examenes = Pila()
examenes.put(["Ana", 0])
examenes.put(["Carlos", 0])
examenes.put(["Yo", 0])
print(examenes.queue)
print(primera_entrega_en_blanco(examenes))

#Ejercicio 3 [2 puntos]

#Implementar la función desplazar_columna_hacia_arriba:
#problema desplazar_columna_hacia_arriba(inout A: seq⟨seq⟨Z⟩⟩, in col: Z) {
#requiere: { Todas las filas de A tienen la misma longitud (estrictamente positiva) }
#requiere: { |A| > 0 }
#requiere: { 0 ≤ col < |A[0]| }
#modifica: { A }
#asegura: { A tiene exactamente las mismas dimensiones que A@pre }
#asegura: { A[i][j] = A@pre[i][j] para todo i, j en rango tal que col ≠ j }
#asegura: { A[i][col] = A@pre[i+1][col] para todo i tal que 0 ≤ i < |A|-1 }
#asegura: { A[|A|-1][col] = A@pre[0][col] }
#}



#Ejercicio 4 [2,5 puntos]

#A lo largo del año se realizaron diversas competencias de programación, las cuales van otorgando puntos y permiten generar un ranking entre los competidores, con el objetivo de entregar premios al final del año. 
#En cada una de las competencias se selecciona a los 3 participantes con mejor desempeño, y se define el podio para cada una. Luego, se asignan los puntajes de la siguiente manera:
#Quien sale en primer puesto recibe 3 puntos
#Quien sale en segundo puesto recibe 2 puntos
#Quien sale en tercer puesto recibe 1 punto
#Nuestro objetivo es, dada una lista de competencias y sus resultados, conocer el ranking actual.
#problema armar_ranking (in podios: seq⟨Diccionario⟨Z,String⟩⟩): Diccionario⟨String,Z⟩ {
#requiere: { Cada diccionario de podios tiene como claves los valores 1, 2 y 3 (o algún subconjunto de los mismos) }
#requiere: { Sea d un diccionario de la secuencia podios, entonces d no contiene valores repetidos }
#asegura: { nom es clave de res si y sólo si existe un diccionario en podios tal que nom es valor de dicho diccionario }
#asegura: { Cada clave c de res tiene como valor la sumatoria de los puntos obtenidos por c en cada una de las competencias de podios 
#(suma 3 puntos si salió primero, 2 puntos si salió segundo, 1 punto si salió tercero y 0 puntos si no estuvo en el podio de esa competencia) }
#}



#Ejercicio 5 [0,75 puntos]

#Dada la siguiente especificación y una posible implementación de la misma, conteste marcando la opción correcta.
#problema sumar_o_restar_uno (in n: Z): Z {
#  requiere: { True }
#  asegura: { Si n > 0, res = n + 1 }
#  asegura: { Si n = 0, res = n }
#  asegura: { Si n < 0, res = n - 1 }
#}

#def sumar_o_restar_uno(n: int) -> int:
#    res: int = n
#    if n > 0:
#        res += 1
#    else:
#        res -= 1
#    return res

#[ ] El código es correcto, calcula lo pedido en la especificación para cualquier input  
#[ ] El código tiene un bug, y si hacemos un test suite que cubra todas las líneas lo detectaremos  
#[x] El código tiene un bug, pero es posible hacer un test suite que cubra todas las líneas y no detectar dicho bug

#Ejercicio 6 [0,75 puntos]

#Seleccione la opción correcta.
#[ ] Si tengo 2 programas y los ejecuto con los mismos parámetros, el programa que tiene mayor cantidad de líneas de código ejecutará más operaciones que el que tiene menos líneas de código.  
#[ ] Dado un programa p que recibe una secuencia como parámetro, p([1]) ejecutará menos operaciones que p([0,1,2,3,4,5])  
#[x] No es posible afirmar ninguna de las opciones anteriores sin conocer el código de la/las función/funciones
