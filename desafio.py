"""
Precisamos imprimir um número para cada andar de um hotel de 20 andares. Porém, o dono do hotel é supersticioso e optou por não ter um 13ro andar.

Escreva um código que imprima todos os números exceto o número 13.
Escreva mais dois códigos que resolvam o mesmo problema, mas dessa vez usando os outros dois tipos de laços de repetição aprendidos.

Como desafio, imprima eles em ordem decrescente (20, 19, 18...)
"""

#Usando o for

for numero in range(20, 0, -1):
    if numero != 13:
        print(numero)

#usando o while
numero = 20
while numero >= 1:
    if numero != 13:
        print(numero)
    numero -= 1

#usando a compreensão de lista com if de uma linha 

numeros = [numero for numero in range(20, 0, -1) if numero != 13]
for numero in numeros:
    print(numero)
