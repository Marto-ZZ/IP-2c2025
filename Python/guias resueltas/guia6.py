import math 

#1.1
def imprimir_hola_mundo():
    print("¡Hola Mundo!")

#1.2
def imprimir_un_verso():
    print("Siempre tengo a mi lado a mi dios\n"
          "(así me das más…)\n"
          "Un susurro muy especial\n"
          "(así me das más…)\n"
          "“Motor psico”: el mercado de todo amor")
    
#1.3
def raizDe2() -> float:
    return round(math.sqrt(2) , 4)

#1.4
def factorial_de_dos():
    return math.factorial(2)

#1.5
def perimetro() -> float:
    return 2 * math.pi


#2.1
def imprimir_saludo(nombre:str):
    print(f"hola {nombre}")

#2.2
def raiz_cuadrada_de(numero:int) -> float:
    return math.sqrt(numero)

#2.3
def fahrenheit_a_celsius(temp_far:float) -> float:
    return ((temp_far - 32) * 5) / 9

#2.4
def imprimir_dos_veces(estribillo:str):
    print(estribillo * 2)
    
#2.5
def es_multiplo_de(num1:int , num2:int) -> bool:
    return num1 % num2 == 0

#2.6
def es_par(num:int) -> bool:
    return es_multiplo_de(num , 2)

#2.7
def cantidad_de_pizzas(comensales:int , min_cant_de_porciones:int) -> int:
    cant_porciones:int = comensales * min_cant_de_porciones
    return math.ceil(cant_porciones / 8)                                   #La funcion ceil redondea un numero para arriba y con eso me aseguro de devolver pizzas enteras


#3.1
def alguno_es_0(num1:float , num2:float) -> bool:
    return num1==0 or num2==0

#3.2
def ambos_son_0(num1:float , num2:float) -> bool:
    return num1==0 and num2==0

#3.3
def es_nombre_largo(nombre:str) -> bool:
    return 3 <= len(nombre) <= 8

#3.4
def es_bisiesto(anio:int) -> bool:
    return anio % 400 == 0 or anio % 4 == 0 and anio % 100 != 0


#4.1
def peso_pino(altura:int) -> int:
    peso = 0
    if altura <= 3 :
        peso += altura * 300
        return peso
    else:
        peso += 900 + (altura-3)*200
        return peso
    
#4.2
def es_peso_util(peso:int) -> bool:
    return 400 <= peso <= 1000

#4.4
def sirve_pino(altura:int) -> bool:
    return es_peso_util(peso_pino(altura))


#5.1
def devolver_el_doble_si_es_par(num:int) -> int:
    if num % 2 == 0:
        return 2*num
    else:
        return num
    
#5.2
def devolver_valor_si_es_par_sino_el_que_sigue1(num:int) -> int:
    if num % 2 == 0:
        return num
    if num % 2 != 0:
        return num + 1 

def devolver_valor_si_es_par_sino_el_que_sigue2(num:int) -> int:
    if num % 2 == 0:
        return num
    else:
        return num + 1 
    
#Funcionan ambas funciones
    
#5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(num:int) -> int:
    if num % 9 == 0:
        return 3*num
    elif num % 3 == 0:
        return 2*num
    else:
        return num
    
#5.4
def lindo_nombre(nombre:str) -> str:
    if len(nombre) >= 5:
        print("Tu nombre tiene muchas letras!")
    else:
        print("Tu nombre tiene menos de 5 caracteres")

#5.5
def elRango(numero:int) -> int:
    if numero < 5:
        print("Menor a 5")
    elif 10 <= numero <= 20:
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")

#5.6
def vacaciones_o_pala(sexo:str , edad:int) -> str:
    if edad < 18 or (sexo == "F" and edad >= 60) or (sexo == "M" and edad >= 65):
        print("Andá de vacaciones")
    else:
        print("Te toca trabajar")


#6.1
def primeros_10_numeros():
    x = 1
    while x != 11:
        print (x)
        x += 1

#6.2
def pares_entre_10_y_40():
    x = 1
    while x != 41:
        if x % 2 == 0:
            print (x)
            x += 1
        else:
            x += 1

#6.3
def eco_10_times():
    x = 10
    while x != 0:
        print ("eco")
        x -= 1

#6.4
def cuenta_regresiva(num:int):
    x = num
    while num != 0:
        print(num)
        num -= 1
    else:
        print("Despegue")

#6.5
def viaje_en_el_tiempo(partida:int , llegada:int):
    while llegada != partida:
        print("Viajó un año al pasado, estamos en el año:", partida-1)
        partida -= 1


#7.1
def primeros_10_numeros_2():
    for x in range (1,11):
        print(x)

#7.2
def pares_entre_10_y_40_2():
    for x in range (10,41,2):
        print(x)

#7.3
def eco_10_times_2():
    for x in range (1,11):
        print("eco")

#7.4
def cuenta_regresiva_2(num:int):
    for x in range (num,0,-1):
        print (x)
    print("Despegue")

#7.5
def viaje_en_el_tiempo_2(partida:int , llegada:int):
    for x in range (partida-1,llegada-1,-1):
        print("Viajó un año al pasado, estamos en el año:", x)