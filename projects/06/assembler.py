import re

comandos = []
codigo_asm = []

destinos = {'': '000', 'M=': '001', 'D=': '010', 'MD=': '011',
            'A=': '100', 'AM=': '101', 'AD=': '110', 'AMD=': '111'}
saltos = {'': '000', ';JGT': '001', ';JEQ': '010', ';JGE': '011',
          ';JLT': '100', ';JNE': '101', ';JLE': '110', ';JMP': '111'}
computaciones = {'0': '0101010', '1': '0111111', '-1': '0111010', 'D': '0001100',
                 'A': '0110000', 'M': '1110000', '!D': '0001101', '!A': '0110001',
                 '!M': '1110001', '-D': '0001111', '-A': '0110011', '-M': '1110011',
                 'D+1': '0011111', 'A+1': '0110111', 'M+1': '1110111', 'D-1': '0001110',
                 'A-1': '0110010', 'M-1': '1110010', 'D+A': '0000010', 'D+M': '1000010',
                 'D-A': '0010011', 'D-M': '1010011', 'A-D': '0000111', 'M-D': '1000111',
                 'D&A': '00000000', 'D&M': '1000000', 'D|A': '0010101', 'D|M': '1010101'}
tabla_simbolos = {'SP': 0, 'LCL': 1, 'ARG': 2, 'THIS': 3, 'THAT': 4, 'SCREEN': 16384, 'KBD': 24576,
                  'R0': 0, 'R1': 1, 'R2': 2, 'R3': 3, 'R4': 4, 'R5': 5, 'R6': 6, 'R7': 7,
                  'R8': 8, 'R9': 9, 'R10': 10, 'R11': 11, 'R12': 12, 'R13': 13, 'R14': 14, 'R15': 15}

nombre_archivo = input('Archivo:')
archivo_asm = open(nombre_archivo + '.asm', 'r')

for linea in archivo_asm:
    linea_limpia = re.sub(r'\/+.*\n|\n| *', '', linea)
    if linea_limpia != '':
        comandos.append(linea_limpia)

archivo_asm.close()

numero_linea = 0
for comando in comandos:
    simbolo = re.findall(r'\(.+\)', comando)
    if simbolo != []:
        if simbolo[0][1:-1] not in tabla_simbolos:
            tabla_simbolos[simbolo[0][1:-1]] = numero_linea
            numero_linea -= 1
    numero_linea += 1

for linea in comandos:
    linea_limpia = re.sub(r'\(.+\)', '', linea)
    if linea_limpia != '':
        codigo_asm.append(linea_limpia)

numero_variable = 16
for comando in codigo_asm:
    simbolo = re.findall(r'@[a-zA-Z]+.*', comando)
    if simbolo != []:
        if simbolo[0][1:] not in tabla_simbolos:
            tabla_simbolos[simbolo[0][1:]] = numero_variable
            numero_variable += 1

archivo_hack = open(nombre_archivo + '.hack', 'w')
for comando in codigo_asm:
    if comando[0] == '@':
        direccion = 0
        if comando[1:] in tabla_simbolos:
            direccion = tabla_simbolos[comando[1:]] + 32768
        else:
            direccion = int(comando[1:]) + 32768
        archivo_hack.write('0' + bin(direccion)[3:] + '\n')
    else:
        destino = re.findall(r'.+=', comando)
        d = destinos[str(destino[0])] if destino != [] else destinos['']
        
        condicion_salto = re.findall(r';.+', comando)
        j = saltos[str(condicion_salto[0])] if condicion_salto != [] else saltos['']
        
        comp = computaciones[re.sub(r'.+=|;.+', '', comando)]
        archivo_hack.write('111' + comp + d + j + '\n')

archivo_hack.close()