import random
from queue import LifoQueue as pila
from queue import Queue as cola

#1 Pilas
#1.1
def generar_nros_al_azar(cantidad:int , desde:int, hasta:int):
    p = pila()
    i = 0
    while i < cantidad:
        num = random.randint(desde, hasta)
        p.put(num)
        i += 1
    print (p.queue)
    return p

#1.2
def cantidad_elementos(p:pila) -> int:
    elementos = pila()
    i = 0
    while not (p.empty()):
        i += 1
        elementos = p.get()
    return i

#1.3
def buscar_el_maximo(p:pila) -> int:
    elementos = []
    while not(p.empty()):
        elementos.append(p.get())
    maximo = elementos[0]
    for i in elementos:
        if i > maximo:
            maximo = i
    cantidad = len(elementos)
    pos = cantidad - 1
    while pos >= 0:
        p.put(elementos[pos])
        pos -= 1
    return maximo

#1.4
def buscar_nota_maxima(p:pila) -> tuple[str , int]:
    elementos = []
    while not(p.empty()):
        elementos.append(p.get())
    maximo = elementos[0]
    for i in elementos:
        if elementos[1][1] > maximo[1]:
            maximo = elementos[1]
        cantidad = len(elementos)
        pos = cantidad - 1
        while pos >= 0:
            p.put(elementos[pos])
            pos -= 1
        return maximo

#1.5
def esta_bien_balanceada(s:str) -> bool:
    cantidad_parentesis = pila()
    for i in s:
        if i == "(":
            cantidad_parentesis.put(i)      ##añade la cantidad de parentesis abiertos a una pila
        elif i == ")":
            if cantidad_parentesis.empty(): ##nos asegura que el parentesis cerrado no es el primer parentesis que aparece en el string, para que siempre esten ordenados de forma "( )"
                return False
            cantidad_parentesis.get()       ##por cada parentesis cerrado quita de la pila un parentesis abierto
    return cantidad_parentesis.empty()      ##el resultado es falso si la lista no esta vacia, osea que hubo mas parentesis abiertos que cerrados, y verdadero si hubo la misma cantidad
            
#1.6



p = pila()
p.put(("Ana", 7))
p.put(("Luis", 9))
p.put(("Marta", 8))
print((buscar_nota_maxima(p)))


#2.8
def generar_nros_al_azar_colas(cantidad:int , desde:int , hasta:int) -> cola[int]:
    c = cola()
    i = 0
    while i < cantidad:
        num = random.randint(desde,hasta)
        c.put(num)
        i +=1
    print(c.queue)
    return c

#2.9
def cantidad_elementos_cola(c:cola) -> int:
    cantidad = 0
    while not c.empty():
        c.get()
        cantidad += 1
    return cantidad

c = cola()
c.put(1)
c.put(2)
c.put(44)
print(cantidad_elementos_cola(c))

#2.10
def buscar_el_maximo_cola(c:cola[int]) -> int:
    lista = []
    while not c.empty():
        lista.append(c.get())
    i = 0
    while i < len(lista)-1:
        if lista[i] > lista[i+1]:
            lista.remove(lista[i+1])
            i += 1
        else:
            lista.remove(lista[i])
            i += 1
    return lista[0]

c.put(7)
c.put(56)
c.put(44)    
c.put(55)
print(buscar_el_maximo_cola(c))

#2.11
def buscar_nota_minima(c:cola[tuple[str , int]]) -> tuple[str , int]:
    lista = []
    while not c.empty():
        lista.append(c.get())
    cantidad = len(lista)
    minimo = lista[0][1]
    i = 1
    while cantidad > 1:
        if lista[i][1] < minimo:
            minimo = lista[i][1]
            i += 1
            cantidad -= 1
        elif lista[i][1] > minimo:
            i += 1
            cantidad -= 1
    return minimo

c.put(["maxi",6])
c.put(["roxi",5])
c.put(["mateo",2])    
c.put(["teo",4])
c.put(["teo",1])
c.put(["teo",9])
print(buscar_nota_minima(c))

#2.12
def intercalar(c1:cola , c2:cola) -> cola:
    c3=cola()
    while not c1.empty() and not c2.empty():
        c3.put(c1.get())
        c3.put(c2.get())
    return c3

c1 = cola()
c2 = cola()
c1.put(1)
c1.put(3)
c1.put(5)
c2.put(2)
c2.put(4)
c2.put(6)
print (intercalar(c1,c2).queue)

#2.13.1
def armar_secuencia_bingo() -> cola[int]:
    res = cola()
    numeros = []
    while len(numeros) < 100:
        n = random.randint(0,99)
        if n not in numeros:
            numeros.append(n)
            res.put(n)
    return res
print(armar_secuencia_bingo().queue)

#2.13.2
def jugar_carton_de_bingo(l:list[int] , c:cola[int]) -> int:
    lista_bolillero = []
    while not c.empty():
        lista_bolillero.append(c.get())
    cantidad_jugadas = 0
    cantidad_numeros = len(l)
    for i in range (99):
            if cantidad_numeros == 0:
                return cantidad_jugadas
            if lista_bolillero[i] in l:
                cantidad_jugadas += 1
                cantidad_numeros -= 1
            if lista_bolillero[i] not in l:
                cantidad_jugadas += 1
    return cantidad_jugadas

print(jugar_carton_de_bingo([1,2,3,4,5,6,7,8,9,10,11,12],armar_secuencia_bingo()))

#2.14
def pacientes_urgentes(c:cola[tuple[int,str,str]]) -> int:
    lista_pacientes = []
    while not c.empty():
        lista_pacientes.append(c.get())
    cantidad_pacientes_urgenetes = 0
    for i in range (len(lista_pacientes)):
        if lista_pacientes[i][0] < 4:
            cantidad_pacientes_urgenetes += 1
    return cantidad_pacientes_urgenetes

c=cola()
c.put((1, "Juan Perez", "Cardiología"))
c.put((3, "María López", "Traumatología"))
c.put((5, "Carlos Gómez", "Dermatología"))
c.put((2, "Ana Torres", "Neurología"))
c.put((7, "Luis Martínez", "Pediatría"))
c.put((4, "Sofía Ramírez", "Ginecología"))
c.put((10, "Jorge Fernández", "Oncología"))
c.put((1, "Lucía Sánchez", "Urgencias"))
print(pacientes_urgentes(c))

#2.15
def atencion_a_clientes(c:cola[tuple[str,int,bool,bool]]) -> cola[tuple[str,int,bool,bool]]:
    lista_clientes = []
    nueva_lista = []
    while not c.empty():
        lista_clientes.append(c.get())

    lista_sin_prioridad = []
    lista_prioridad = []
    for i in range(len(lista_clientes)):
        if lista_clientes[i][3] == True:
            lista_prioridad.append(lista_clientes[i])
        else:
            lista_sin_prioridad.append(lista_clientes[i])
    
    lista_sin_preferencial = []
    lista_preferencial = []
    for i in range(len(lista_sin_prioridad)):
        if lista_sin_prioridad[i][2] == True:
            lista_preferencial.append(lista_sin_prioridad[i])
        else:
            lista_sin_preferencial.append(lista_sin_prioridad[i])
    lista_final = lista_prioridad + lista_preferencial + lista_sin_preferencial
    
    cola_final = cola()
    for i in range(len(lista_final)):
        cola_final.put(lista_final[i])
    return cola_final

c = cola()
c.put(("Juan Perez", 12345678, False, False))
c.put(("Maria Lopez", 23456789, True, False))
c.put(("Carlos Gomez", 34567890, False, True))
c.put(("Ana Torres", 45678901, False, False))
c.put(("Luis Martinez", 56789012, True, False))
c.put(("Sofia Ramirez", 67890123, False, True))
c.put(("Jorge Fernandez", 78901234, False, False))
c.put(("Lucia Sanchez", 89012345, True, True))
c.put(("Mateo Ruiz", 90123456, False, False))
c.put(("Valentina Diaz", 12349876, False, False))

print(atencion_a_clientes(c).queue)


#3.16
def calcular_promedio_por_estudiante(notas:list[tuple[str,float]]) -> dict[str,float]:
    suma_notas : dict[str,float] = {}
    cantidad_notas : dict[str,int] = {}

    for (estudiante, nota) in notas:
        if estudiante not in suma_notas:
            suma_notas[estudiante] = nota
            cantidad_notas[estudiante] = 1
        else:
            suma_notas[estudiante] += nota
            cantidad_notas[estudiante] += 1

    promedios: dict[str,float] = {}

    for estudiante in suma_notas.keys():
        suma_total = suma_notas[estudiante]
        cantidad_final = cantidad_notas[estudiante]
        promedios[estudiante] = suma_total / cantidad_final
    return promedios 

print(calcular_promedio_por_estudiante([("Sole", 9.5), ("Maxi", 8.0), ("Sole", 9.0)]))

#3.17
historiales : dict[str, pila] = {}
def visitar_sitio(historiales:dict[tuple[str,pila[str]]], usuario:str, sitio:str):
    if usuario in historiales.keys():
        historiales[usuario].put(sitio)
    else:
        nueva_pila = pila()
        nueva_pila.put(sitio)
        historiales[usuario] = nueva_pila
    return historiales

def navegar_atras(historiales:dict[tuple[str,pila[str]]], usuario:str) -> str:
    ultimo_sitio = historiales[usuario].get()
    return ultimo_sitio

#3.18
Inv = dict[str,dict[str, int | float]]
def agregar_producto(inventario:Inv, nombre:str, precio:float, cantidad:int):
    nuevo_item = {"precio":precio , "cantidad":cantidad}
    inventario[nombre] = nuevo_item

print(agregar_producto({"pantalon": {"precio": 12800.00, "cantidad": 15}, "campera": {"precio": 42000.00, "cantidad": 7}}, "remera", 55.99, 3))

def actualizar_stock(inventario:Inv, nombre:str, cantidad:int):
    inventario[nombre]["cantidad"] = cantidad

print(actualizar_stock({"remera": {"precio": 55.99, "cantidad": 3}}, "remera", 5))

def actualizar_precio(inventario:Inv, nombre:str, precio:float):
    inventario[nombre]["precio"] = precio

def calcular_valor_inventario(inventario:Inv) -> float:
    valor_inventario = 0
    for prod in inventario:
        valor_inventario += inventario[prod]["precio"] * inventario[prod]["cantidad"]
    return valor_inventario

print(calcular_valor_inventario({"remera": {"precio": 25000.99, "cantidad": 3}, "pantalon": {"precio": 35000.00, "cantidad": 15}}))

inventario = {}
agregar_producto(inventario, "Camisa", 20.0, 50)
agregar_producto(inventario, "Pantal´on", 30.0, 30)
actualizar_stock(inventario, "Camisa", 10)
valor_total = calcular_valor_inventario(inventario)
print("Valor total del inventario:", valor_total)  #debe imprimir 1100.0