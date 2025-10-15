#1.1
def pertenece(s:list , e:int) -> bool:
    if e in s:
        return True
    else:
        return False
    
#1.2
def divide_a_todos(s:list , e:int) -> bool:
    for i in s:
        if i % e != 0:
            return False
        return True 
    
#1.3
def suma_total(s:list) -> int:
    suma = 0
    for i in s:
        suma += i
    print(suma)

#1.4
def maximo(s:list) -> int:
    numero_anterior = s[0]
    for i in s:
        if i > numero_anterior:
            numero_anterior = i
    return numero_anterior

#1.5
def minimo(s:list) -> int:
    numero_anterior = s[0]
    for i in s:
        if i < numero_anterior:
            numero_anterior = i
    return numero_anterior

#1.6
def ordenados(s:list) -> bool:
    primer_numero = s[0]
    s = s[1::]
    for i in s:
        if primer_numero > i:
            return False
        else:
            primer_numero=i
    return True

#1.7
def pos_maximo(s:list) -> int:
    if len(s) == 0:
        return -1
    numero_anterior = s[0]
    posicion = 0
    for i in s:
        if i > numero_anterior:
            numero_anterior = i
            posicion += 1
    return posicion

#1.8
def pos_minimo(s:list) -> int:
    if len(s) == 0:
        return -1
    numero_anterior = s[0]
    posicion = 0
    for i in s:
        if i < numero_anterior:
            numero_anterior = i
            posicion += 1
    return posicion

#1.9
def long_mayorASiete(s:list[str]) -> bool:
    for i in s:
        if len(i) > 7:
            return True
    return False

#1.10
def es_palindroma(s: str) -> bool:
    ultima_posicion = len(s) - 1
    for i in range(len(s) // 2):
        if s[i] != s[ultima_posicion - i]:
            return False
    return True

#1.11
def iguales_consecutivos(s:list[int]) -> bool:
    for i in range(len(s) - 2):
        if s[i] == s[i + 1] == s[i + 2]:
            return True
    return False