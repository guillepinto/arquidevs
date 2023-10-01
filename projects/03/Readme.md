## Proyecto 3: Lógica Secuencial
Este proyecto se centra en la construcción de una memoria RAM de n registros, cada uno de 16 bits de ancho. La memoria RAM es un componente esencial en la arquitectura de una computadora y se utiliza para almacenar datos de manera temporal. Durante este proyecto, hemos desarrollado gradualmente una serie de chips que forman la base de la memoria RAM, incluida la implementación de chips de registro, RAM8, RAM64 y más.

### Objetivo del proyecto

El objetivo principal de este proyecto es diseñar e implementar una memoria RAM funcional a partir de chips lógicos básicos. Cada chip construido se emplea como componente para construir los siguientes, culminando en la creación de una memoria RAM de 16K palabras de 16 bits cada una. Se espera que todos los chips funcionen correctamente y que la memoria RAM pueda leer y escribir datos correctamente.

### Desarrollo del proyecto

1. **Construcción del chip Bit**

    Para comenzar, implementamos el chip `Bit`, que representa un registro de 1 bit. Este chip consta de dos partes principales: un multiplexor (Mux) y un flip-flop (DFF). El Mux selecciona entre el valor de entrada `in` y el valor almacenado en el flip-flop, controlado por la señal `load`. Si `load` es 1, el Mux elige `in` como entrada y actualiza el flip-flop. Si `load` es 0, el Mux selecciona la salida del flip-flop, manteniendo el valor actual.

3. **Implementación del chip Register**

    El chip `Register` se construyó utilizando 16 chips `Bit`. Cada `Bit` representa un bit de datos en el registro. Cuando se activa la señal `load`, el `Register` carga los datos de entrada en sus 16 bits. Este chip es fundamental para el funcionamiento de la memoria RAM.

4. **Creación del chip RAM8**

    La construcción del chip `RAM8` implicó el uso de un demultiplexor de 1 a 8 para seleccionar el registro de destino en función de la dirección proporcionada. Cada uno de los 8 registros se conecta a un chip `Register`, y solo se escribirán los datos en el registro seleccionado si la señal `load` es 1. Para la salida, cada registro ingresa a cada una de las entradas del chip `Mux8Way16` que, dependiendo de address, devuelve el valor que esté en el registro escogido en la salida ‘out’. Esta estructura permite la escritura selectiva en un registro específico mientras se mantiene el contenido de los demás registros.

6. **Expansión a RAM64, RAM512 y RAM4K**

    El enfoque para construir memorias más grandes, como `RAM64`, `RAM512`, `RAM4K` y `RAM16K` es escalable. Explicaremos cómo se realizó la RAM64 como ejemplo:

    Primero hay que utilizar un demultiplexor de una entrada a 8 salidas, esto se hace con el fin de ‘escoger’ la subsección de memoria que se va a utilizar a partir del address.

    En este caso, RAM64 recibe una dirección de 6 bits, como evidentemente no vamos a hacer un DMux64Way para hacer la selección del registro, para ‘dividir’ el problema hacemos que la selección que hace el DMux8Way se haga con los últimos 3 bits de la dirección que entra a la RAM64, con esto, se escoge una de las 8 RAM8 que usamos y a su vez la RAM8 escogida va a seleccionar un registro (de los 8 que tiene) con los primeros 3 bits de la dirección que entra a la RAM64.

    Luego, las 8 subsecciones de memoria (`RAM8`) reciben, como entrada, los 16 bits que recibe la RAM64, pero se escribirán, solo si load es igual a 1, al registro que fue escogido con el address en el demultiplexor, en caso contrario (si load es igual a 0), todo se mantendrá igual. 

    Finalmente, para la salida se utilizó un Mux8Way16 para devolver el valor del registro seleccionado. Como en el chip `RAM8`.

   La construcción de los demás chips se apoyan en la misma lógica que, en síntesis, emplean un demultiplexor para seleccionar la subsección adecuada de memoria. Luego, varios chips `RAM8` se usan para manejar los registros dentro de esa subsección. Y al final, utilizan un Mux8Way16 para entregar la salida. Esto permite crear memorias de mayor capacidad manteniendo una estructura organizada.


8. **Implementación del chip PC**

    El chip `PC` es un contador de programa que utiliza un incrementador para aumentar su valor en 1 si la señal `inc` está activada. También permite cargar datos y restablecer su valor en función de las señales `load` y `reset`. Se construyó usando varios multiplexores, un incrementador y un chip `Register`.

### Herramientas y recursos

Para completar este proyecto, utilizamos las siguientes herramientas y recursos:

- Hardware Simulator proporcionado en el curso.
- Editor de texto estándar para producir y editar archivos HDL.
- Componentes lógicos básicos, incluidas compuertas lógicas y D flip-flop.
