## Proyecto 5: Arquitectura de la computadora

Este proyecto tiene se centra en la construcción de una plataforma de computadora capaz de ejecutar programas escritos en el lenguaje de máquina Hack, como se especifica en el capítulo 4. Esta plataforma integra dispositivos de ALU y RAM, construidos en los proyectos 2 y 3, respectivamente, para formar un sistema capaz de ejecutar programas escritos en el lenguaje de máquina Hack. La culminación de este proyecto se encuentra en la creación del chip de la computadora (Computer).

### Objetivo del proyecto

El objetivo principal de este proyecto es construir una plataforma de computadora que pueda ejecutar programas escritos en el lenguaje de máquina Hack. Esto involucra la integración de la Unidad Aritmético-Lógica (ALU) y las memorias RAM construidas en proyectos anteriores en una plataforma funcional. La plataforma debe ser capaz de cargar, ejecutar y controlar programas Hack de acuerdo con las especificaciones del lenguaje de máquina.

### Desarrollo del proyecto

1. **Implementación del chip Memory**

Implementamos un chip Memory para gestionar el acceso a las memorias RAM. Este chip se encarga de enrutar las operaciones de lectura y escritura a la memoria adecuada según la dirección proporcionada. Además, se utilizan componentes como `DMux`, `RAM16K`, `Screen`, y `Keyboard` para lograr la funcionalidad necesaria. 

Para las operaciones tanto de lectura (load = 0) como de escritura (load = 1), el chip Memory revisa la dirección proporcionada. Si la dirección de memoria está en el rango de 0 a 16383, la operación se enruta a la RAM16K. Si la dirección está en el rango de 16384 a 24575, la operación se enruta a la Screen. Si la dirección es 24576, la operación se enruta al Keyboard.

2. **Implementación del chip CPU**

La Unidad Central de Procesamiento (CPU). Consiste en una ALU y un conjunto de registros diseñados para obtener y ejecutar instrucciones escritas en el lenguaje de máquina Hack. En particular, la ALU ejecuta la instrucción ingresada de acuerdo con las especificaciones del lenguaje de máquina Hack. La Unidad Central de Procesamiento se puede construir a partir de la ALU construida en el proyecto 2, los chips de Registro y PC construidos en el proyecto 3, y las puertas lógicas construidas en el proyecto 1.

3. **Implementación del COMPUTER**

El archivo Computer.hdl representa la computadora HACK completa, incluyendo su CPU, ROM y RAM. Es el componente básico de la arquitectura de la computadora HACK y permite la ejecución de programas en código de máquina. Cuando la entrada reset se establece en 0, el programa almacenado en la ROM de la computadora comienza su ejecución y cuando la entrada reset se establece en 1, la ejecución del programa se reinicia.

### Herramientas y recursos

Para completar este proyecto, se utilizaron las siguientes herramientas y recursos:

- **Simulador de hardware**: Utilizamos el simulador de hardware proporcionado en el curso (HardwareSimulator) para probar y depurar los componentes de la plataforma y asegurarnos de que funcionen según lo previsto.

- **Compuertas construidas**: Utilizamos las compuertas y chips construidos durante el primer proyecto del curso. Además de los dispositivos de ALU y RAM, construidos en los proyectos 2 y 3, respectivamente.
