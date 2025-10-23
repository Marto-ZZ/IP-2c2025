from queue import LifoQueue as pila
from queue import Queue as cola

#1
def nivel_de_ocupacion(camas_por_piso:list[list[bool]]) -> list[int]:
    cama_si = 0
    total_camas_piso = []
    for i in camas_por_piso:
        for j in i:
            if j == True:
                cama_si += 1
        total_camas_piso.append(cama_si / len(camas_por_piso))
        cama_si = 0
    return total_camas_piso

#2
def cambiar_matriz(s:list[list[int]]):
    p = pila()
    lista_aux = []
    for i in s:
        lista_aux.append(i)
    for i in s:
        for j in i:
            p.put(j)
    s = []
    for i in lista_aux:
        l = []
        for j in i:
            l.append(p.get())
        s.append(l)
    return s
print(cambiar_matriz([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))

#3


#4
def convertir_cola_a_lista(c:cola[tuple[str,str]]) -> list[tuple[str,str]]:
    lista_cola = []
    while not c.empty():
        lista_cola.append(c.get())
    return lista_cola

def reordenar_cola_priorizando_vips(c:cola[tuple[str,str]]) -> cola[str]:
    lista_vip = []
    lista_no_vip = []
    for i in convertir_cola_a_lista(c):
        if i[1] == "vip":
            lista_vip.append(i[0])
        else:
            lista_no_vip.append(i[0])
    lista_reordenada = lista_vip + lista_no_vip
    print(lista_reordenada)
    nueva_cola = cola()
    for i in lista_reordenada:
        nueva_cola.put(i)
    return nueva_cola

c: cola[tuple[str, str]] = cola()
c.put(("Ana", "comun"))
c.put(("Juli", "vip"))
c.put(("Fede", "vip"))