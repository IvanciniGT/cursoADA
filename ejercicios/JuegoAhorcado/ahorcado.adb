with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Fixed;
use Ada.Strings.Fixed;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ada.Characters.Handling;
use Ada.Characters.Handling;


-- Al arrancar el juego, leer las palabras / frases de un fichero.
-- En el fichero habrá 10 palabras/frases
-- Las quiero cargar en un array
-- Vamos a elegir la palabra 7

procedure Ahorcado is
    
    package vector_palabras is new Ada.Containers.Vectors
        (
        Index_Type => Natural, -- Incluye el CERO      POSITIVE EMPIEZA EN EL 1
        Element_Type => String
        );
    use vector_palabras;

    
    ---------------------------------------------------------------------------
    --  Calcular un fichero de palabras
    ---------------------------------------------------------------------------
    function CARGAR_FICHERO_PALABRAS (NOMBRE_FICHERO: String) return String_Array is
        Lista_Palabras : Vector;
        mi_fichero: File_Type;
    begin
    
        Open (
                File => mi_fichero, -- Descriptor del fichero (PUNTERO AL CONTENIDO DEL FICHERO)
                Mode => In_File , --modo de apertura: Lectura, escritura, adición
                Name => NOMBRE_FICHERO-- nombre del fichero
                );
        
        while not End_Of_File(mi_fichero) loop
            Lista_Palabras.append(Get_Line(mi_fichero));
        end loop;
        
        Close(mi_fichero);
        return Lista_Palabras;
    end CARGAR_FICHERO_PALABRAS;    
    
    ---------------------------------------------------------------------------
    --  Calcular una palabra al azar
    ---------------------------------------------------------------------------
    function PEDIR_PALABRA_AL_AZAR (LISTA_PALABRAS : Vector) return String is
    begin
        --return To_String(LISTA_PALABRAS(7));
        return LISTA_PALABRAS(7);
    end PEDIR_PALABRA_AL_AZAR;
    
    ---------------------------------------------------------------------------
    --  Pedir letra al usuairo por pantalla
    ---------------------------------------------------------------------------
    function PEDIR_LETRA return String is
        LETRA: String:= " ";
    begin
        Put_Line("Qué letra crees que aparece? ");
        LETRA:=TO_UPPER(Get_Line);
        return LETRA;
    end PEDIR_LETRA;
    
    ---------------------------------------------------------------------------
    --  Calcular lo que ha pasado con la letra de esta ronda
    ---------------------------------------------------------------------------
    function RESULTADO_DE_LA_RONDA ( PALABRA_EN_MAYUSCULAS:String; 
                                     LETRA: String; 
                                     LETRAS_USADAS: in out Unbounded_String
                                     ) return Boolean is
        VALIDA: Boolean :=False;
    begin
        
        -- Si la letra ya ha sido usada
        if Index ( LETRAS_USADAS, LETRA) = 0 then
            LETRAS_USADAS := LETRAS_USADAS & LETRA;
            if Index ( PALABRA_EN_MAYUSCULAS, LETRA) /= 0 then
                VALIDA := True;
            end if;
        end if;

        return VALIDA;
        
    end RESULTADO_DE_LA_RONDA;
    
    ---------------------------------------------------------------------------
    --  Enmascarar la palabra y Determinar si ya he acertado la palabra
    ---------------------------------------------------------------------------
    function ENMASCARAR_PALABRA (PALABRA:String; 
                                 PALABRA_EN_MAYUSCULAS:String; 
                                 LETRAS_USADAS: Unbounded_String;
                                 CARACTERES_ESPECIALES:String; 
                                 PALABRA_DESCUBIERTA: out Boolean) return String is
        PALABRA_ENMASCARADA: String := PALABRA; 
    begin
        for INDICE_ACTUAL in 1 .. PALABRA'LENGTH loop
            if  Index( CARACTERES_ESPECIALES, ""&PALABRA_EN_MAYUSCULAS(INDICE_ACTUAL) ) = 0
                and then Index( LETRAS_USADAS, ""&PALABRA_EN_MAYUSCULAS(INDICE_ACTUAL) ) = 0 then
                PALABRA_ENMASCARADA(INDICE_ACTUAL) := '_';
            end if;
        end loop;
        PALABRA_DESCUBIERTA := (PALABRA_ENMASCARADA = PALABRA);
        return PALABRA_ENMASCARADA;
    end ENMASCARAR_PALABRA;
    
    ---------------------------------------------------------------------------
    --  Mostrar por pantalla el estado actual de la partida
    ---------------------------------------------------------------------------
    procedure PINTAR_ESTADO_PARTIDA ( RESULTADO: Boolean; 
                                      PALABRA: String; 
                                      PALABRA_ENMASCARADA: String; 
                                      LETRAS_USADAS: Unbounded_String; 
                                      NUMERO_FALLOS: Integer;
                                      NUMERO_FALLOS_PERMITIDOS: Integer;
                                      PALABRA_DESCUBIERTA: Boolean) is
    begin

        -- Poner la palabra enmascarada
        Put_Line("PALABRA A ADIVINAR: " & PALABRA_ENMASCARADA);
        Put_Line("Letras usadas: " & To_String(LETRAS_USADAS));
        -- Decir si en la última hemos acertado o no
        if LENGTH(LETRAS_USADAS) /=0 then 
            if PALABRA_DESCUBIERTA then 
                Put_Line("GANASTE !");
            elsif RESULTADO then 
                Put_Line("Letra adivinada !");
            else
                Put_Line("Letra no acertada! ");
                if NUMERO_FALLOS = NUMERO_FALLOS_PERMITIDOS then 
                    Put_Line("GAME OVER :(");
                end if;
            end if;
        end if;
        -- Pintar por pantalla el número de fallos
        Put_Line("Fallos: " & NUMERO_FALLOS'Image & "/" & NUMERO_FALLOS_PERMITIDOS'Image);

    end;
    
    ---------------------------------------------------------------------------
    --  Variables del Juego
    ---------------------------------------------------------------------------
    NUMERO_FALLOS: Integer := 0 ;
    NUMERO_FALLOS_PERMITIDOS: constant := 6 ;
    CARACTERES_ESPECIALES: constant String:= "., -()";
    
    --PALABRA_A_DESCUBRIR: String;
    --PALABRA_ENMASCARADA: String;
    PALABRA_DESCUBIERTA: Boolean;
    LETRA_ACTUAL: String:= " ";
    LETRAS_USADAS: Unbounded_String := To_Unbounded_String("");
    ACIERTO: Boolean:=False;
    
    LISTA_PALABRAS : Vector;

begin
    
    -- JUGAR A ADIVINAR LA PALABRA
    LISTA_PALABRAS:= CARGAR_FICHERO_PALABRAS("palabras.txt");
    declare
        PALABRA_A_DESCUBRIR: String := PEDIR_PALABRA_AL_AZAR(LISTA_PALABRAS);
        PALABRA_A_DESCUBRIR_MAYUSCULAS: String := TO_UPPER( PALABRA_A_DESCUBRIR );
        PALABRA_ENMASCARADA: String := ENMASCARAR_PALABRA(PALABRA_A_DESCUBRIR,PALABRA_A_DESCUBRIR_MAYUSCULAS,LETRAS_USADAS, CARACTERES_ESPECIALES, PALABRA_DESCUBIERTA);
    begin
        PINTAR_ESTADO_PARTIDA ( ACIERTO , PALABRA_A_DESCUBRIR, PALABRA_ENMASCARADA, LETRAS_USADAS, NUMERO_FALLOS, NUMERO_FALLOS_PERMITIDOS, PALABRA_DESCUBIERTA); 
    
        -- MIENTRAS ME QUEDEN PARTES DEL CUERPO Y ADEMAS QUE AUN FALTEN LETRAS POR DESCUBRIR
        while NUMERO_FALLOS < NUMERO_FALLOS_PERMITIDOS and then not PALABRA_DESCUBIERTA loop
            -- PEDIR LETRA AL USUARIO
            LETRA_ACTUAL :=PEDIR_LETRA;
            ACIERTO := RESULTADO_DE_LA_RONDA ( PALABRA_A_DESCUBRIR_MAYUSCULAS, LETRA_ACTUAL, LETRAS_USADAS);
            
            -- Actualizo el numero de fallos y determino si he ganado
            if ACIERTO then 
                PALABRA_ENMASCARADA:= ENMASCARAR_PALABRA(PALABRA_A_DESCUBRIR,PALABRA_A_DESCUBRIR_MAYUSCULAS,LETRAS_USADAS, CARACTERES_ESPECIALES, PALABRA_DESCUBIERTA);
            else
                NUMERO_FALLOS := NUMERO_FALLOS + 1;
            end if;
            
            PINTAR_ESTADO_PARTIDA ( ACIERTO , PALABRA_A_DESCUBRIR, PALABRA_ENMASCARADA, LETRAS_USADAS, NUMERO_FALLOS, NUMERO_FALLOS_PERMITIDOS, PALABRA_DESCUBIERTA); 
            
        end loop;
    end;
end AHORCADO;
