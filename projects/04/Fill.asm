// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(inicio)
@color  //para almacenar si es negro o blanco
M=0

//alacenamos la posicion en la que estamos iterando de screen
@SCREEN
D=A
@posicion
M=D

//esta al tanto de presionar una tecla
(presionar)
@KBD
D=M
@negro
D; JGT //si hay algo en el KBD alacena el color negro

@blanco
D; JEQ//si no hay nada es decir cero, almacena blanco

@presionar
0; JMP//en caso de saltarse los anteriores regresa

(negro)
@color
M=-1 //ya que -1 es que todos sean unos por complemente -1=11111111
@mostrar
0; JMP//salta a mostrars en la pantalla

(blanco)
@color
M=0
@mostrar
0; JMP//salta a mostrar en la pantalla

(mostrar)
//colocamos en D el color
@color
D = M

//tomamos la posicion almacenada y le colocamos el color
@posicion
A=M
M=D

//aumentamos la posicion en uno
@posicion
M=M+1

//verifiacmos que la siguiente posicion no llegue 
//a keyboard para finalizar
@KBD
D=A
@posicion
D=D-M

//si la posicion de KBD menis la almacenada sigue iterando
@mostrar
D; JGT

//si se sale del ciclo vuelve al inicio
@inicio
0; JMP
