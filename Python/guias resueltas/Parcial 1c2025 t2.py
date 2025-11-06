from queue import Queue as Cola
#Ejercicio 1 [2 puntos]

#Implementar la función cantidad_parejas_que_suman:
#problema cantidad_parejas_que_suman (in s: seq⟨Z⟩, in n: Z) : Z {
#requiere: { - }
#asegura: { res es la cantidad de parejas s[i] y s[j] de números de s tales que s[i] + s[j] = n (con i < j) }
#}

def cantidad_de_parejas_que_suman(s:list[int], n:int) -> int:
    res: int = 0
    j = len(s)-1
    for i in range(len(s)):
        indice = j
        while i != indice:
            if s[i] + s[indice] == n:
                res += 1
            indice -= 1
    return res
print(cantidad_de_parejas_que_suman([1,3,2,5,4,8], 5)) #debe dar 2


#Ejercicio 2 [2,5 puntos]

#En un supermercado tenemos una fila de clientes esperando para ser atendidos por algún cajero. Cada cliente tiene un nombre, un método de pago y una cantidad de productos. La fila de clientes se representa como
#una Cola de String x String x Z, donde el primer elemento es el nombre del cliente, el segundo es el método de pago y el tercero es la cantidad de productos. Implementar la función pasar_por_autoservicio:
#Nota: los métodos de pago son strings conformados por letras minúsculas.
#problema pasar_por_autoservicio (inout clientes: Cola⟨ String x String x Z ⟩) : String {
#requiere:{ Las primeras componentes de clientes son strings no vacíos y todos distintos entre sí }
#requiere:{ Las terceras componentes de clientes son números positivos }
#requiere:{ Existe al menos un elemento c dentro de la cola clientes tal que c1
# ≠ "efectivo" y c2
# ≤ 15 }
#modifica: { clientes }
#asegura: { Sea c el primer elemento insertado en la cola clientes tal que c1
# ≠ "efectivo" y c2
# ≤ 15, entonces res = c0
# }
#asegura: { clientes contiene todos los elementos de clientes@pre excepto la tupla que contiene a res en su primera posición, en el mismo orden que en clientes@pre. }
#}

def pasar_por_autoservicio(clientes:Cola[tuple[str,str,int]]) -> str:
    lista = []
    cliente_prioridad = []
    res = ""

    while not clientes.empty():
        lista.append(clientes.get())

    for i in range(len(lista)):
        if lista[i][1] != "efectivo" and lista[i][2] <= 15:
            cliente_prioridad.append(lista[i][0])
    res = cliente_prioridad[0]

    for i in range(len(lista)):
        if lista[i][0] != cliente_prioridad[0]:
            clientes.put(lista[i])

    return res

clientes:Cola[tuple[str,str,int]] = Cola()
clientes.put(("Ana", "efectivo", 13))
clientes.put(("Juan", "qr", 22))
clientes.put(("Bruno", "tarjeta", 14))
print(pasar_por_autoservicio(clientes))


#3) Ejercicio 3 [2,5 puntos]

#Implementar la función intercambiar_e_invertir_columnas:
#problema intercambiar_e_invertir_columnas(inout A: seq⟨seq⟨Z⟩⟩, in col1: Z, in col2: Z) {
#requiere: { Todas las filas de A tienen la misma longitud (estrictamente positiva)}
#requiere: { |A| > 0}
#requiere: { 0 ≤ col1 < |A[0]| }
#requiere: { 0 ≤ col2 < |A[0]| }
#requiere: { col1 ≠ col2 }
#modifica: { A }
#asegura: { A tiene exactamente las mismas dimensiones que A@pre }
#asegura: { A[i][j] = A@pre[i][j] para todo i, j en rango tal que j ≠ col1 y j ≠ col2 }
#asegura: { A[i][col1] = A@pre[|A|-1-i][col2] para todo i tal que 0 ≤ i < |A| }
#asegura: { A[i][col2] = A@pre[|A|-1-i][col1] para todo i tal que 0 ≤ i < |A| }
#}

def intercambiar_e_invertir_columnas(mat:list[list[int]], col1:int, col2:int):
    rango = len(mat)
    mat_copia = []

    for fila in mat:
        fila_nueva = []
        for elemento in fila:
            fila_nueva.append(elemento)
        mat_copia.append(fila_nueva)

    i = 0
    while i < rango:
        mat[i][col1] = mat_copia[rango-1-i][col2]
        mat[i][col2] = mat_copia[rango-1-i][col1]
        i += 1  
    return mat
print(intercambiar_e_invertir_columnas([[1,2,3],[40,50,60],[-7,-8,-9]],1,2))
   

#Ejercicio 4 [2 puntos]

#Se realizaron dos censos en los cuales se le preguntó a cada persona en que localidad vive. Estos datos fueron almacenados en dos diccionarios cuyas claves son los nombres de las personas, y sus valores las
#localidades en las cuales viven. Implementar la función mantuvieron_residencia:
#problema mantuvieron_residencia (in censo1: Diccionario⟨String,String⟩, in censo2: Diccionario⟨String,String⟩): Diccionario⟨String,Z⟩ {
#requiere: { Las claves de censo1 son las mismas que las claves de censo2 }
#asegura: { k es clave de res si y sólo si existe alguna clave p en censo1 tal que al obtener su valor tanto en censo1 como en censo2, este es igual a k }
#asegura: { El valor de cada clave de res representa la cantidad de personas que en ambos censos vivía en esa localidad, es decir, que mantuvieron su residencia en la misma localidad entre ambos censos }
#}

def mantuvieron_residencia(censo1:dict[str,str], censo2:dict[str,str]) -> dict[str,int]:
    dict_resi : dict[str,int] = {}
    dict_final : dict[str,int] = {}
    for i in censo1.values():
        if i not in dict_resi.keys():
            dict_resi[i] = 0

    for i in censo1.keys():
        if censo1[i] == censo2[i]:
            dict_resi[censo1[i]] += 1
    for resi in dict_resi.keys():
        if dict_resi[resi] != 0:
            dict_final[resi] = dict_resi[resi]
    return dict_final
print(mantuvieron_residencia({'Juan': 'Merlo', 'Ana': 'Merlo'}, {'Juan': 'Castelar', 'Ana': 'Merlo'}))

#Ejercicio 5 [0,5 puntos]

#Dada la siguiente especificación y una posible implementación de la misma, conteste marcando la opción correcta.
#problema sumar_elementos (in s: seq⟨Z⟩): Z {
#requiere: { - }
#asegura: { res es la suma de los elementos de s }
#}

#def sumar_elementos(s: list[int]) -> int:
#res: int = 0
#for i in range(1, len(s)):
# res += s[i]
#return res

#[] El código es correcto, calcula lo pedido en la especificación para cualquier input
#[] El código tiene un bug, y si hacemos un test suite que cubra todas las líneas lo detectaremos
#[x]El código tiene un bug, pero es posible hacer un test suite que cubra todas las líneas y no detectar dicho bug


#Ejercicio 6 [0,5 puntos]

#Supongamos que un programa tiene un ciclo que itera sobre todos los elementos de una lista de tamaño n. Si el programa realiza una operación constante dentro de ese ciclo (por ejemplo, incrementa en 1 cada valor
#de la lista), ¿cómo afecta el tamaño de la lista al número de operaciones?

#[x]Si la lista tiene más elementos, el número de operaciones aumentará.
#[] El número de operaciones no cambia con el tamaño de la lista.
#[] El número de operaciones depende del contenido de la lista, no del tamaño.
