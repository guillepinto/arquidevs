// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
 @i      //carga la direccion de memoria etiquetada como i en el registro A
  M=0    //Establece el valor en la direccion de memoria apuntada por A (es decir i) en 0
  @R2    //Carga la direccion de memoria R2 en el registro A, que se ultilizara para guardar el resultado
  M=0    //Inicializa una direccion de memoria para almacernar el resultado en 0.

(LOOP)   //Define una etiqueta llamada loop
  @i      
  D=M    //Almacena el valor en el registro D como el valor en i
  @R1    //Carga la direccion de memoria R1 en el registro A, que contiene el segundo numero que deseas multiplicar.
  D=D-M  //Se comparar la diferencia del valor del contador i con el valor en R1.
  @END   //Carga la direccion de memoria etiquetada como "END" en el registro A
  D;JGE  //Realiza un salto condicional a END si D es mayor o igual a cero

  @R0    //Carga la direccion de memoria R0 en el registro A, que contiene el primer numero a multiplicar
  D=M    //Almacena el valor en el registro D como el valor en la direccion de memoria R0.
  @R2    
  M=D+M  //Suma el valor en D al valor en la direccion de memoria R2 y almacena el resultado en R2

  @i
  M=M+1  //Incrementa el valor en la direccion de memoria i en 1

  @LOOP  //Carga la direccion de memoria etiquetada como LOOP en el registro A
  0;JMP  //Provoca un salto incondicional de regreso al bucle LOOP

(END)    //Define una etiqueta llamada loop
  @END   //Carga la direccion de memoria etiquetada como END en el registro A
  0;JMP  //Realiza un salto incondicional a la direcciOn de memoria END, finalizando el programa