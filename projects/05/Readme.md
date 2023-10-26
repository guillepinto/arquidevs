Proyecto 5: Arquitectura de la computadora

## Descripción del proyecto

Este proyecto tiene como objetivo construir una plataforma de computadora capaz de ejecutar programas escritos en el lenguaje de máquina Hack, como se especifica en el capítulo 4. Esta plataforma integra dispositivos de ALU y RAM, construidos en los proyectos 2 y 3, respectivamente, para formar un sistema capaz de ejecutar programas escritos en el lenguaje de máquina Hack. La culminación de este proyecto se encuentra en la creación del chip de la computadora (Computer).

### Objetivo del proyecto

El objetivo principal de este proyecto es construir una plataforma de computadora que pueda ejecutar programas escritos en el lenguaje de máquina Hack. Esto involucra la integración de la Unidad Aritmético-Lógica (ALU) y las memorias RAM construidas en proyectos anteriores en una plataforma funcional. La plataforma debe ser capaz de cargar, ejecutar y controlar programas Hack de acuerdo con las especificaciones del lenguaje de máquina.

### Desarrollo del proyecto

1.**Implementación del chip Memory**

Implementamos un chip Memory para gestionar el acceso a las memorias RAM. Este chip se encarga de enrutar las operaciones de lectura y escritura a la memoria adecuada según la dirección proporcionada. Además, se utilizan componentes como `DMux`, `RAM16K`, `Screen`, y `Keyboard` para lograr la funcionalidad necesaria. 

### Herramientas y recursos

Para completar este proyecto, se utilizaron las siguientes herramientas y recursos:

1. **Simulador de hardware**: Utilizamos el simulador de hardware proporcionado en el curso (HardwareSimulator) para probar y depurar los componentes de la plataforma y asegurarnos de que funcionen según lo previsto.

2.**Compuertas construidas**: Utilizamos chips construidos durante