with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Fixed;
use Ada.Strings.Fixed;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

-- PEDIR UNA PALABRA



procedure Ahorcado is
    ---------------------------------------------------------------------------
    --  Calcular una palabra al azar
    ---------------------------------------------------------------------------
    function PEDIR_PALABRA_AL_AZAR return String is
    begin
        return "Murcielago";
    end PEDIR_PALABRA_AL_AZAR;
    
    ---------------------------------------------------------------------------
    --  Pedir letra al usuairo por pantalla
    ---------------------------------------------------------------------------
    function PEDIR_LETRA return String is
        LETRA: String:= " ";
    begin
        Put_Line("Qué letra crees que aparece? ");
        LETRA:=Get_Line;
        return LETRA;
    end PEDIR_LETRA;
    
    ---------------------------------------------------------------------------
    --  Calcular lo que ha pasado con la letra de esta ronda
    ---------------------------------------------------------------------------
    function RESULTADO_DE_LA_RONDA ( PALABRA: String; 
                                     LETRA: String; 
                                     LETRAS_USADAS: in out Unbounded_String) return Boolean is
        VALIDA: Boolean :=False;
    begin
        
        -- Si la letra ya ha sido usada
        if Index ( LETRAS_USADAS, LETRA) = 0 then
            LETRAS_USADAS := LETRAS_USADAS & LETRA;
            if Index ( PALABRA, LETRA) /= 0 then
                VALIDA := True;
            end if;
        end if;
        
        return VALIDA;
        
    end RESULTADO_DE_LA_RONDA;
    
    ---------------------------------------------------------------------------
    --  Enmascarar la palabra y Determinar si ya he acertado la palabra
    ---------------------------------------------------------------------------
    function ENMASCARAR_PALABRA (PALABRA:String; LETRAS_USADAS: Unbounded_String; PALABRA_DESCUBIERTA: out Boolean) return String is
        PALABRA_ENMASCARADA: String := PALABRA; 
    begin
        for INDICE_ACTUAL in 1 .. PALABRA'LENGTH loop
            if Index( LETRAS_USADAS, ""&PALABRA(INDICE_ACTUAL) ) = 0 then
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
        -- Pintar por pantalla el número de fallos
        Put_Line("Fallos: " & NUMERO_FALLOS'Image & "/" & NUMERO_FALLOS_PERMITIDOS'Image);

    end;
    
    ---------------------------------------------------------------------------
    --  Variables del Juego
    ---------------------------------------------------------------------------
    NUMERO_FALLOS: Integer := 0 ;
    NUMERO_FALLOS_PERMITIDOS: constant := 6 ;
    
    --PALABRA_A_DESCUBRIR: String;
    --PALABRA_ENMASCARADA: String;
    PALABRA_A_DESCUBRIR: String := PEDIR_PALABRA_AL_AZAR;
    PALABRA_DESCUBIERTA: Boolean;
    LETRA_ACTUAL: String:= " ";
    LETRAS_USADAS: Unbounded_String := To_Unbounded_String("");
    ACIERTO: Boolean:=False;
begin
    
    -- JUGAR A ADIVINAR LA PALABRA
    declare
        PALABRA_A_DESCUBRIR: String := PEDIR_PALABRA_AL_AZAR;
        PALABRA_ENMASCARADA: String := ENMASCARAR_PALABRA(PALABRA_A_DESCUBRIR,LETRAS_USADAS, PALABRA_DESCUBIERTA);
    begin
        PINTAR_ESTADO_PARTIDA ( ACIERTO , PALABRA_A_DESCUBRIR, PALABRA_ENMASCARADA, LETRAS_USADAS, NUMERO_FALLOS, NUMERO_FALLOS_PERMITIDOS, PALABRA_DESCUBIERTA); 
    
        -- MIENTRAS ME QUEDEN PARTES DEL CUERPO Y ADEMAS QUE AUN FALTEN LETRAS POR DESCUBRIR
        while NUMERO_FALLOS < NUMERO_FALLOS_PERMITIDOS and then not PALABRA_DESCUBIERTA loop
            -- PEDIR LETRA AL USUARIO
            LETRA_ACTUAL :=PEDIR_LETRA;
            ACIERTO := RESULTADO_DE_LA_RONDA ( PALABRA_A_DESCUBRIR, LETRA_ACTUAL, LETRAS_USADAS);
            
            -- Actualizo el numero de fallos y determino si he ganado
            if ACIERTO then 
                PALABRA_ENMASCARADA:= ENMASCARAR_PALABRA(PALABRA_A_DESCUBRIR,LETRAS_USADAS, PALABRA_DESCUBIERTA);
            else
                NUMERO_FALLOS := NUMERO_FALLOS + 1;
            end if;
            
            PINTAR_ESTADO_PARTIDA ( ACIERTO , PALABRA_A_DESCUBRIR, PALABRA_ENMASCARADA, LETRAS_USADAS, NUMERO_FALLOS, NUMERO_FALLOS_PERMITIDOS, PALABRA_DESCUBIERTA); 
            
        end loop;
    end;
end AHORCADO;
