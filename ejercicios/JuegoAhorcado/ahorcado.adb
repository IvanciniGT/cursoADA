with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Fixed;
use Ada.Strings.Fixed;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ada.Strings.Maps.Constants;
use Ada.Strings.Maps.Constants;

with Ada.Characters.Handling;
use Ada.Characters.Handling;

with Ada.Containers;
with Ada.Containers.Vectors;

with CALCULAR_NUMERO_ALEATORIO;

-- Al arrancar, pedirnos un nombre de usuario
-- Cuando acabe una partida, 
    -- Que me muestra mis estadisticas
    -- que me pida si quiero jugar otra


package body Ahorcado is
    
    package vector_palabras is new Ada.Containers.Vectors
        (
        Index_Type => Natural, -- Incluye el CERO      POSITIVE EMPIEZA EN EL 1
        Element_Type => Unbounded_String
        );
    use vector_palabras;


    ---------------------------------------------------------------------------
    --  Variables del Juego
    ---------------------------------------------------------------------------
    NUMERO_FALLOS_PERMITIDOS: constant := 6 ;
    CARACTERES_ESPECIALES: constant String:= "., -()";
    LISTA_PALABRAS : Vector;
    NOMBRE_FICHERO: String := "palabras.txt";
    ---
    LETRAS_USADAS: Unbounded_String := To_Unbounded_String("");
    LETRA_ACTUAL: String:= " ";
    ACIERTO: Boolean:=False;
    NUMERO_FALLOS: Integer := 0 ;
    PALABRA_A_DESCUBRIR: Unbounded_String; 
    PALABRA_ENMASCARADA: Unbounded_String; 
    PALABRA_EN_MAYUSCULAS: Unbounded_String; 
    PALABRA_DESCUBIERTA: Boolean;

    ---------------------------------------------------------------------------
    --  Calcular un fichero de palabras
    ---------------------------------------------------------------------------
    procedure CARGAR_FICHERO_PALABRAS is
        mi_fichero: File_Type;
    begin
    
        Open (
                File => mi_fichero, -- Descriptor del fichero (PUNTERO AL CONTENIDO DEL FICHERO)
                Mode => In_File , --modo de apertura: Lectura, escritura, adición
                Name => NOMBRE_FICHERO-- nombre del fichero
                );
        
        while not End_Of_File(mi_fichero) loop
            LISTA_PALABRAS.append(To_Unbounded_String(Get_Line(mi_fichero)));
        end loop;
        
        Close(mi_fichero);

    end CARGAR_FICHERO_PALABRAS;    


    ---------------------------------------------------------------------------
    --  Calcular una palabra al azar
    ---------------------------------------------------------------------------
    procedure PEDIR_PALABRA_AL_AZAR  is
        NUMERO_ALEATORIO: Integer;
    begin
        NUMERO_ALEATORIO:= CALCULAR_NUMERO_ALEATORIO(LISTA_PALABRAS.FIRST_INDEX,LISTA_PALABRAS.LAST_INDEX);
        PALABRA_A_DESCUBRIR := LISTA_PALABRAS(NUMERO_ALEATORIO);
    end PEDIR_PALABRA_AL_AZAR;
    
    ---------------------------------------------------------------------------
    --  Pedir letra al usuairo por pantalla
    ---------------------------------------------------------------------------
    procedure PEDIR_LETRA is
    begin
        Put_Line("Qué letra crees que aparece? ");
        LETRA_ACTUAL:=TO_UPPER(Get_Line);
    end PEDIR_LETRA;
    
    ---------------------------------------------------------------------------
    --  Calcular lo que ha pasado con la letra de esta ronda
    ---------------------------------------------------------------------------
    procedure RESULTADO_DE_LA_RONDA is
    begin
        ACIERTO := False;
        -- Si la letra ya ha sido usada
        if Index ( LETRAS_USADAS, LETRA_ACTUAL) = 0 then
            LETRAS_USADAS := LETRAS_USADAS & LETRA_ACTUAL;
            if Index ( PALABRA_EN_MAYUSCULAS, LETRA_ACTUAL) /= 0 then
                ACIERTO := True;
            end if;
        end if;

    end RESULTADO_DE_LA_RONDA;
    
    ---------------------------------------------------------------------------
    --  Enmascarar la palabra y Determinar si ya he acertado la palabra
    ---------------------------------------------------------------------------
    procedure ENMASCARAR_PALABRA is
    begin
        PALABRA_ENMASCARADA:=  PALABRA_A_DESCUBRIR; 
        for INDICE_ACTUAL in 1 .. LENGTH(PALABRA_A_DESCUBRIR) loop
            if  Index( CARACTERES_ESPECIALES, "" & ELEMENT(PALABRA_EN_MAYUSCULAS,INDICE_ACTUAL) ) = 0
                and then Index( LETRAS_USADAS, "" & ELEMENT(PALABRA_EN_MAYUSCULAS,INDICE_ACTUAL) ) = 0 then
                REPLACE_ELEMENT(PALABRA_ENMASCARADA,INDICE_ACTUAL,'_');
            end if;
        end loop;
        PALABRA_DESCUBIERTA := (PALABRA_ENMASCARADA = PALABRA_A_DESCUBRIR);
    end ENMASCARAR_PALABRA;
    
    ---------------------------------------------------------------------------
    --  Mostrar por pantalla el estado actual de la partida
    ---------------------------------------------------------------------------
    procedure PINTAR_ESTADO_PARTIDA is
    begin

        -- Poner la palabra enmascarada
        Put_Line("PALABRA A ADIVINAR: " & To_String(PALABRA_ENMASCARADA));
        Put_Line("Letras usadas: " & To_String(LETRAS_USADAS));
        -- Decir si en la última hemos acertado o no
        if LENGTH(LETRAS_USADAS) /=0 then 
            if PALABRA_DESCUBIERTA then 
                Put_Line("GANASTE !");
            elsif ACIERTO then 
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
    
    
    function JUGAR_PARTIDA return Boolean is
    begin
        
        -- JUGAR A ADIVINAR LA PALABRA
        CARGAR_FICHERO_PALABRAS;

        PEDIR_PALABRA_AL_AZAR;
        PALABRA_EN_MAYUSCULAS:= Translate(PALABRA_A_DESCUBRIR, Upper_Case_Map);
        ENMASCARAR_PALABRA;

        PINTAR_ESTADO_PARTIDA; 
    
        -- MIENTRAS ME QUEDEN PARTES DEL CUERPO Y ADEMAS QUE AUN FALTEN LETRAS POR DESCUBRIR
        while NUMERO_FALLOS < NUMERO_FALLOS_PERMITIDOS and then not PALABRA_DESCUBIERTA loop
            -- PEDIR LETRA AL USUARIO
            PEDIR_LETRA;
            RESULTADO_DE_LA_RONDA ;
            
            -- Actualizo el numero de fallos y determino si he ganado
            if ACIERTO then 
                ENMASCARAR_PALABRA;
            else
                NUMERO_FALLOS := NUMERO_FALLOS + 1;
            end if;
            
            PINTAR_ESTADO_PARTIDA; 
            
        end loop;
        
        return PALABRA_DESCUBIERTA;
    end JUGAR_PARTIDA;
    
end AHORCADO;
