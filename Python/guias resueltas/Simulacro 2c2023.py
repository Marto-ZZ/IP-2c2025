#simulacro 2c2023

# Ejercicio 1

#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7


def ultima_aparicion(s:list[int], e:int) -> int:
	lista = []
	for i in range(len(s)):
		if s[i] == e:
			lista.append(i)
	return lista[len(lista)-1]

print(ultima_aparicion([-1,4,0,4,100,0,100,0,-1,-1],0))


# Ejercicio 2

#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]


def elementos_exclusivos(s:list[int], t:list[int]) -> list[int]:
	lista_final = []
	for i in s:
		if i not in t and i not in lista_final:
			lista_final.append(i)
	for i in t:
		if i not in s and i not in lista_final:
			lista_final.append(i)
	return lista_final

print(elementos_exclusivos([-1,4,0,4,3,0,100,0,-1,-1],[0,100,5,0,100,-1,5]))


# Ejercicio 3

# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2


def contar_traducciones_iguales(ing:dict[str,str], ale:dict[str,str]) -> int:
	contador = 0
	for palabra in ale.keys():
		if palabra in ing.keys():
			if ing[palabra] == ale[palabra]:
				contador += 1
	return contador

print(contar_traducciones_iguales({"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"},{"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}))
	

# Ejercicio 4

# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }
#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}


def apariciones(n:int,lista:list[int]) -> int:
	contador = 0
	for i in lista:
		if i == n:
			contador += 1
	return contador

def convertir_a_diccionario(lista:list[int]) -> dict[int,int]:
	diccionario = {}
	for i in lista:
		diccionario[i] = apariciones(i,lista)
	return diccionario

print(convertir_a_diccionario([-1,0,4,100,100,-1,-1]))