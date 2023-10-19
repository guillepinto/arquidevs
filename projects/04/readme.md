## Proyecto 4: Lenguaje de maquina
Este proyecto se baso escritura y ejecución de programas de lenguaje de máquina de bajo nivel. Específicamente, se crearon programas en el lenguaje ensamblador Hack, convirtiendolo en codigo binario con un ensamblador y probando el codgio resultante. Esto ultimo se realizo en un Emulador de CPU diseñado para ejecutar código binario escrito en el conjunto de instrucciones Hack.

### Objetivo del proyecto
Obtener una introducción práctica a la programación de bajo nivel en lenguaje de máquina, familiarizarse con el conjunto de instrucciones Hack y comprender el proceso de ensamblaje, como preparación para proyectos futuros en la construcción de la computadora Hack y el desarrollo de un ensamblador.

### Desarrollo del proyecto
1. **Multiplicacion**
Este programa toma como entrada los valores almacenados en RAM[0] y RAM[1]. Calcula el producto de R0 * R1 y almacena el resultado en RAM[2]. Suponemos que R0 ≥ 0, R1 ≥ 0 y R0 * R1 < 32768. Despues de escribir el programa en lenguaje Hack se paso a binario para a continuación probarlo.
2. **Fill: tarea de entrada/salida**
Este programa ejecuta un bucle infinito que escucha el teclado. Cuando se presiona una tecla cualquira, el programa oscurece toda la pantalla escribiendo "negro" en cada píxel. Cuando no se presiona ninguna tecla, el programa borra la pantalla escribiendo "blanco" en cada píxel.

Despues de escribir el programa en lenguaje Hack se paso a binario para a continuación probarlo.
### Herramientas y recursos
- Editor de texto estándar para producir y editar archivos
- Un ensamblador proporcionado en el curso
- Un simulador de CPU proporcionado por el curso
