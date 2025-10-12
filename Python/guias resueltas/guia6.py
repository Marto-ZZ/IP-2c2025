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
    return round(math.sqrt(2), 4)

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
def raiz_cuadrada_de(numero: int) -> float:
    return math.sqrt(numero)

#2.3
def fahrenheit_a_celsius(temp_far:float) -> float:
    return ((temp_far - 32) * 5) / 9

#2.4
def imprimir_dos_veces(estribillo:str):
    print(estribillo * 2)
    
#2.5
def es_multiplo_de(num1:int, num2:int) -> bool:
    return num1 % num2 == 0

#2.6
def es_par(num:int) -> bool:
    return es_multiplo_de(num, 2)

#2.7
def cantidad_de_pizzas(comensales:int , min_cant_de_porciones:int) -> int:
    cant_porciones:int = comensales * min_cant_de_porciones
    return math.ceil(cant_porciones / 8)