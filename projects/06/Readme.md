## Proyecto 6: Ensamblador

Este proyecto se enfoca en la traducción de programas escritos en lenguaje ensamblador Hack a código binario comprensible por la plataforma de hardware Hack. El objetivo es desarrollar un ensamblador que implemente las especificaciones de traducción descritas en la sección 6.2 del documento The Elements of Computing Systems - Assembler.

Los programas de bajo nivel escritos en lenguaje simbólico de máquina se denominan programas de ensamblador. Los ensambladores son programas que traducen código escrito en lenguaje ensamblador a código de máquina binario. En este proyecto, implementamos un ensamblador para el lenguaje ensamblador Hack, capaz de generar código binario comprensible por la plataforma de hardware Hack.

### Objetivo del proyecto

El objetivo principal es cargar un archivo Prog.asm que contenga un programa válido en lenguaje ensamblador Hack, traducirlo al código binario Hack correcto y almacenarlo en un archivo Prog.hack. La salida generada por el ensamblador debe ser idéntica a la producida por el ensamblador suministrado con el libro.

### Desarrollo del proyecto

Nuestra implementación del ensamblador se realizó en Python. A continuación se detalla el proceso paso a paso:

1. **Lectura del archivo .asm**: Abrimos y leemos el archivo .asm que contiene el código escrito en lenguaje ensamblador Hack. Durante esta fase, eliminamos los comentarios y los espacios en blanco innecesarios para obtener los comandos ejecutables del programa.

2. **Generación de la tabla de símbolos**: Identificamos y asignamos direcciones de memoria a etiquetas y variables presentes en el código ensamblador. Esto permite referenciar estas ubicaciones en el código y traducirlas adecuadamente.

3. **Preparación del código para traducción**: Eliminamos las etiquetas del código, ya que no tienen una representación directa en código de máquina. Esto involucra detectar y eliminar las instrucciones asociadas a estas etiquetas para preparar el código para la traducción.

4. **Asignación de direcciones a variables**: Asignamos direcciones de memoria a las variables no etiquetadas. Comenzamos desde la dirección 16, ya que las primeras 16 direcciones están reservadas para registros predefinidos y hardware específico del Hack.

5. **Traducción de código a binario**: Para cada instrucción del código ensamblador Hack, la traducimos a su equivalente en código binario. Esto implica mapear cada tipo de instrucción (A-instrucciones, C-instrucciones) según las especificaciones de la arquitectura del Hack.

6. **Generación del archivo .hack**: Escribimos las instrucciones traducidas en un archivo .hack, que contendrá el código binario correspondiente al código ensamblador original.


### Herramientas y recursos

Para completar este proyecto, se utilizaron las siguientes herramientas y recursos:

- **Python**: Lenguaje de programación para implementar el ensamblador.

- **Expresiones regulares**: Utilizadas para limpiar y procesar el código.

- **CPUEmulator**: Herramienta empleada para probar y ejecutar el código binario generado por el ensamblador.
