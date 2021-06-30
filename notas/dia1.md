Lenguaje Robusto: 
    Comportamiento predecible
    Tipado estático. Definición explicita de los tipos de datos de las variables.

Compilado vs interpretados:
VVV                VVV
C, C+               python
ADA                 Javascript
                    bash

Ventajas lenguajes interpretados: Distribuyo el software <<<< Python Codigo fuente quien lo ejecuta ?INTERPRETE EN TIEMPO REAL > SO
Desventaja lenguaje compilado: Distribuir el software. Necesito precompilarlo para cada SO/HW donde se vaya a ejecutar

Ventaja lenguaje compilado: Velocidad en la ejecución

Qué es una variable?
Referencia a una ubicación en memoria RAM

INTEGER texto        =         "HOLA"
texto        =         "ADIO"
RAM
----------------------------------HOLA------

Crea una variable: llamada texto

Referenciar desde la variable el objeto que hemos ubicado en la RAM (a travñés de la dirección de memoria)


BIGDATA ML DL python: >>> tensorflow spark pandas numpy escrito en C

python es un lenguaje LENTO A RABIAR
cython   --- Solo puede hacer uso de 1 vcpu de mi sistema
jython
pypy

-- Para que sirve Comentario?
Darle legibilidad al código. NOP!
Explicar CUANDO SEA NECESARIO lo que hace un código

Comentar diferente de documentar

Comentar:   Como hace el codigo lo que hace /* Comentar */ //
Documentar:  Que hace un codigo    /** Documentar */


PROCEDIMIENTO: No devuelve ningun valor. Una función cuyo return es de tipo void
FUNCION:       Si devuelve un valor


Paradigmas de programación 
    Imperativo          ** ADA              Escribiendo instrucciones que se ejecutan de forma secuencial IF FOR WHILE LOOP
    Procedural          ** ADA              Capacidad de definir funciones e invocarlas
    Funcional           ** NOP !!!          Referenciar desde una variable una función. 
                                                Puedo crear funciones que admitan como argumentos otras funciones.
                                                Puedo tener funciones que devuelvan otras funciones
    Orientado a Objetos ** ADA
    
    
    gnu c compiler
    
                     70%   30%
    ubuntu < debian < gnu/linux
    
    google/linux < SO Mas utilizando del mundo
        Android
        
-- NUMERO = 8

---
Juego FRIO/CALIENTE

Partimos de un numero SECRETO:17 --- Lo calcularemos aleatoriamente
 1..20
 
 Preguntando al usuario por un numero
 
 Get(VARIABLE_INTEGER) <<  Ada.Integer_Text_IO
 
 Si acierto gano
 Si no... tengo 3 vidas.. pierdo una
 Le voy a dar pistas al usuario.
 Si estoy a menos de 2 unidades... MUY CALIENTE
     3-4  CALIENTE
     5-6  TEMPLADO
     > 6  FRIO
 Si me quedo sin vidas GAMEOVER
 