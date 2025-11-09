from queue import Queue as Cola
from queue import LifoQueue as Pila

#Ejercicio 1 [2,25 puntos]

# problema subsecuencia_mas_larga (in v: seq⟨Z⟩) : ZxZ {
# requiere: { La longitud de v es distinto de 0 }
# asegura: { Sea x la primera subsecuencia más larga en v tal que vale todos_consecutivos(x), la primera componente de res es igual a |x| y la segunda es igual al índice en v donde comenzaría x }
# }

# problema todos_consecutivos (in v: seq⟨Z⟩) : Bool {
# asegura: { res == True <==> cada par de elementos adyacentes en v son números consecutivos, es decir, que su diferencia es igual a 1 }
# }


def todos_consecutivos(v:list[int]) -> bool:
    for i in range(len(v)-1):
        if v[i] + 1 != v[i+1]:
            return False
    return True

def subsecuencia_mas_larga(v:list[int]) -> tuple[int,int]:
    max_longitud = 1
    max_inicio = 0
    longitud_actual = 1
    inicio_actual = 0
    for i in range(1, len(v)):
        if v[i] == v[i-1] + 1:
            longitud_actual += 1
        else:
            if longitud_actual > max_longitud:
                max_longitud = longitud_actual
                max_inicio = inicio_actual
            longitud_actual = 1
            inicio_actual = i
    if longitud_actual > max_longitud:
        max_longitud = longitud_actual
        max_inicio = inicio_actual
        
    return (max_longitud, max_inicio)

print(subsecuencia_mas_larga([1,2,3,5,6,7,8,9,10]))


# Ejercicio 2 [2,25 puntos]

# Ana tiene exámenes de respuesta Verdadero ó Falso. Ella sabe que en cada examen la cantidad 
# de respuestas correctas cuyo valor es Falso es igual a la cantidad de respuestas correctas 
# cuyo valor es Verdadero. Tenemos el historial de las respuestas de cada exámen dados por Ana 
# en una cola. En cada uno Ana respondió todas las preguntas.

# problema mejor_resultado_de_ana (in examenes: Cola⟨ seq⟨Bool⟩ ⟩) : seq⟨Z⟩ {
#   requiere:{ Cada elemento de examenes es no vacío y tiene longitud par }
#   asegura: { res tiene la misma cantidad de elementos que examenes }
#   asegura: { res[i] es igual a la máxima cantidad de respuestas correctas que Ana podría haber respondido en el i-ésimo exámen resuelto en examenes, para 0 <= i < cantidad de elementos de examenes }
# }

def mejor_resultado_de_ana(examenes:Cola[list[bool]]) -> list[int]:
    resultados = []
    while not examenes.empty():
        resultados.append(examenes.get())
    for i in resultados:
        examenes.put(i)
    
    res = []
    for examen in resultados:
        contador_true = 0
        contador_false = 0
        for ejercicio in examen:
            if ejercicio == True:
                contador_true += 1
            else:
                contador_false += 1
        if contador_true < contador_false:
            cantidad_correctas = (contador_true+contador_false) - ((contador_false)-((contador_false+contador_true)//2))
        else:
            cantidad_correctas = (contador_true+contador_false) - ((contador_true)-((contador_false+contador_true)//2))
        res.append(cantidad_correctas)
    return res

examenes = Cola()
examenes.put([True, False, True, False])
examenes.put([True, True, False, False, False, False])
print(mejor_resultado_de_ana(examenes))


# Ejercicio 3 [2,25 puntos]

# problema cambiar_matriz(inout A: seq⟨seq⟨Z⟩⟩) {
#   requiere: { Todas las filas de A tienen la misma longitud }
#   requiere: { El mínimo número que aparece en A es igual a 1 }
#   requiere: { El máximo número que aparece en A es igual a #filas de A por #columnas de A }
#   requiere: { No hay enteros repetidos en A }
#   requiere: { Existen al menos dos enteros distintos en A }
#   modifica: { A }
#   asegura: { A tiene exactamente las mismas dimensiones que A@pre }
#   asegura: { El conjunto de elementos que aparecen en A es igual al conjunto de elementos que aparecen en A@pre }
#   asegura: { A[i][j] != A@pre[i][j] para todo i, j en rango }
# }


def cambiar_matriz(A:list[list[int]]):
    lista_aux = []
    for i in range(len(A)):
        lista_aux.append(A[i])
    A.clear()
    j = len(lista_aux)-1
    while j >= 0:
        A.append(lista_aux[j])
        j -= 1
    
    lista_aux2 = []
    for j in range(len(A)):
        lista_aux2.append(A[j])
    
    ultimo_indice = len(A)-1
    indice_mitad = len(A)//2
    if len(A)%2 != 0:
        A.pop(indice_mitad)
        A.insert(indice_mitad, lista_aux2[ultimo_indice])
        A.pop(ultimo_indice)
        A.insert(ultimo_indice, lista_aux2[indice_mitad])
    return A

print(cambiar_matriz([[1,2,3],[4,5,6],[7,8,9]]))


# Ejercicio 4 [2,25 puntos]

# Tenemos un texto que contiene palabras. Por simplicidad, las palabras están separadas únicamente por uno o más espacios.
# problema palabras_por_vocales (in texto: string): Diccionario⟨Z,Z⟩ {
#   requiere: { Si existe una letra vocal en texto, esta no lleva tildes, diéresis, ni ningún otro símbolo }
#   asegura: { Si existe una palabra en texto con x vocales en total, x es clave de res }
#   asegura: { Las claves de res representan la cantidad total de vocales de una palabra, y cada valor corresponde a la cantidad de palabras en texto con ese número de vocales. }
#   asegura: { Los valores de res son positivos }
# }


def palabra_a_lista(texto:str) -> list[str]:
    lista = []
    palabra = ""
    for i in texto:
        if i != " ":
            palabra += i
        if i == " ":
            lista.append(palabra)
            palabra = ""
    if palabra != "":
        lista.append(palabra)
    while "" in lista:
        lista.remove("")
    return lista


def palabras_por_vocales(texto:str) -> dict[int,int]:
    res = {}

    for i in palabra_a_lista(texto):
        cantidad_vocales = 0
        
        for j in i:
            if j in "aeiouAEIOU":
                cantidad_vocales += 1

        if cantidad_vocales not in res:
            res[cantidad_vocales] = 1
        else:
            res[cantidad_vocales] += 1
    return res

print(palabras_por_vocales("hola    que    tal     estas"))