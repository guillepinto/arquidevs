## Proyecto 3: Lógica Secuencial
Este proyecto se centra en la construcción de una memoria RAM de n registros, cada uno de 16 bits de ancho. La memoria RAM es un componente esencial en la arquitectura de una computadora y se utiliza para almacenar datos de manera temporal. Durante este proyecto, hemos desarrollado gradualmente una serie de chips que forman la base de la memoria RAM, incluida la implementación de chips de registro, RAM8, RAM64 y más.

## Objetivo del proyecto

El objetivo principal de este proyecto es diseñar e implementar una memoria RAM funcional a partir de chips lógicos básicos. Cada chip construido se utiliza como componente para construir los siguientes, culminando en la creación de una memoria RAM de 16K palabras de 16 bits cada una. Se espera que todos los chips funcionen correctamente y que la memoria RAM pueda leer y escribir datos correctamente.

## Desarrollo del proyecto

### Construcción del chip Bit

Para comenzar, implementamos el chip `Bit`, que representa un registro de 1 bit. Este chip utiliza compuertas lógicas y un multiplexor para almacenar y recuperar un bit de datos. Si `load` es 1, el chip cargará el valor de entrada `in`; de lo contrario, mantendrá su valor actual.

### Implementación del chip Register

El chip `Register` se construyó utilizando 16 chips `Bit`. Cada `Bit` representa un bit de datos en el registro. Cuando se activa la señal `load`, el `Register` carga los datos de entrada en sus 16 bits. Este chip es fundamental para el funcionamiento de la memoria RAM.

### Creación del chip RAM8

La construcción del chip `RAM8` implicó el uso de un demultiplexor de 1 a 8 para seleccionar el registro de destino en función de la dirección proporcionada. Cada uno de los 8 registros se conecta a un chip `Register`, y solo se escribirán los datos en el registro seleccionado si la señal `load` es 1.

### Expansión a RAM64, RAM512 y RAM4K

Para crear chips de memoria más grandes, como `RAM64`, `RAM512` y `RAM4K`, utilizamos una jerarquía de chips `RAM8`. El chip `DMux8Way` se usó para seleccionar la subsección de memoria deseada, y luego se conectaron múltiples chips `RAM8` para manejar cada subsección.

### Implementación del chip PC

El chip `PC` es un contador de programa que utiliza un incrementador para aumentar su valor en 1 si la señal `inc` está activada. También permite cargar datos y restablecer su valor en función de las señales `load` y `reset`. Se construyó utilizando varios multiplexores y un chip `Register`.

## Herramientas y recursos

Para completar este proyecto, utilizamos las siguientes herramientas y recursos:

- Hardware Simulator proporcionado en el curso.
- Editor de texto estándar para crear y editar archivos HDL.
- Componentes lógicos básicos, incluidas compuertas lógicas y D flip-flops.
