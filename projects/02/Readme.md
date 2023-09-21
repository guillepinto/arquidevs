## Proyecto 2: Logica Aritmética    
Este proyecto se centra en la construcción de una serie de chips que desempeñan un papel fundamental en la arquitectura de la computadora Hack. El componente central de la Unidad Central de Procesamiento (CPU) de esta computadora es la Unidad Aritmético-Lógica (ALU, por sus siglas en inglés). Durante este proyecto, desarrollamos gradualmente una serie de chips que llevan a cabo operaciones aritméticas y lógicas, culminando con la construcción de la ALU.

### Objetivo del proyecto
El objetivo principal de este proyecto es implementar todos los chips presentados en este capítulo. Estos chips son esenciales para el funcionamiento de la computadora y forman la base de las operaciones aritméticas y lógicas que la CPU puede llevar a cabo. La única limitación es que solo podemos utilizar los chips que hemos construido gradualmente en proyectos anteriores y los chips estándar proporcionados en el entorno del curso.

###Desarrollo del proyecto
1. Comenzamos revisando la teoría y luego procedimos a codificar los archivos .hdl de cada chip en un editor de texto. 

2. **Construcción del HalfAdder**: El primer chip que construimos fue el HalfAdder. Nos basamos en su tabla de verdad para implementarlo. Este chip fue relativamente sencillo de construir ya que la tabla de verdad para el bit de acarreo es idéntica a la compuerta lógica AND y la tabla de verdad para la suma es idéntica a la compuerta lógica XOR.

3. **Construcción del FullAdder**: Luego, implementamos el FullAdder, que recibe tres entradas de 1 bit y produce dos salidas de 1 bit. Utilizamos dos HalfAdder en su construcción. El primer HalfAdder suma las entradas a y b y calcula el acarreo de la suma. El segundo HalfAdder suma la salida del primer HalfAdder y la entrada c, y calcula el acarreo final. Luego, utilizamos una compuerta OR para calcular el bit de acarreo final de las dos operaciones.

4. **Construcción del Adder de 16 bits**: El Adder de 16 bits se construye utilizando 16 FullAdder en serie. Cada FullAdder suma los bits correspondientes de dos vectores de 16 bits a y b. Los acarreos se propagan de un FullAdder al siguiente, y el último acarreo se desprecia ya que estamos operando con números de 16 bits con signo y el bit 15 se utiliza para representar el signo. Cualquier acarreo en el bit 15 no es relevante para el resultado final y, por lo tanto, se descarta.

5. **Construcción del Incrementador de 16 bits**: Para el Incrementador de 16 bits, se aprovechó la estructura del Adder de 16 bits ya construido, donde cada FullAdder suma los bits correspondientes de dos vectores de 16 bits, y se propaga un acarreo de un FullAdder al siguiente. Para lograr la función de incremento, se configuró la entrada b[0] del Adder en true (equivalente a 1), lo que significa que solo se suma 1 al primer valor de in[15]. Los demás bits de la entrada b se establecieron en 0, de esta manera, el Incrementador agrega 1 al número de 16 bits en in, produciendo el resultado deseado en out.

6. **Construcción de la ALU**: La construcción de la ALU fue más compleja: 

-Primero, se utilizó un multiplexor para elegir entre x y un valor constante de cero en función de la señal zx. Luego, se negó la salida de este multiplexor para obtener x o !x según la señal nx. El mismo proceso se repitió para la entrada y, utilizando zy y ny. 
-Luego, utilizamos un Adder de 16 bits para realizar la suma de x y y, y un AND de 16 bits para calcular la operación lógica AND entre x y y. Dependiendo de la señal f, seleccionamos entre la suma y la operación AND. 
-Posteriormente, negamos el resultado, utilizando otro multiplexor, según la señal no. Para calcular la salida zr tuvimos que constriuir un chip Or16Way a partir de dos Or8Way y un OR, el propósito de Or16Way es recorrer cada uno de los bits en esta salida y verificar si alguno de ellos es igual a 1. Si al menos un bit es 1, significa que la salida no es igual a cero, y zr se establece en 0. 
-Casi para terminar, determinamos el bit ng (negativo) tomando el bit más significativo de la salida, esto se logró con una And16 de cuya salida solo nos interesa el bit en la posición 15.
-Finalmente, para conectar la salida, utilizamos una compuerta OR de 16 bits que simplemente recibe el vector que devuelve el multiplexor de ‘no’ y como segundo parametro ingresamos un vector de ceros, se hace la operación lógica, que da como resultado la misma función que entró, y se iguala a la salida ‘out’.

### Herramientas y recursos
Para completar este proyecto, requerimos de las siguientes herramientas y recursos:

1. **Compuertas construidas en el primer proyecto:** Utilizamos las compuertas y chips construidos durante el primer proyecto del curso, que forman la base de las operaciones lógicas y aritméticas fundamentales en nuestra implementación. Estos componentes incluyeron compuertas lógicas básicas como AND, OR, NOT, así como chips más complejos como los multiplexores (y sus versiones de 16 bits).

2. **Software:** Utilizamos el simulador de hardware proporcionado en el curso (HardwareSimulator) para probar los chips implementados en Hardware Description Language (HDL). Los archivos .hdl de cada chip se crearon y editaron utilizando un editor de texto estándar.
