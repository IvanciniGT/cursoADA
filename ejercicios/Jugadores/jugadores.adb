-- Que es un record en ADA? struct en C
-- Tipo de dato que me permite almacenar dentro más datos de forma estructurada
with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ada.Containers.Vectors;

package body Jugadores is
    
    type JUGADOR is record
        Nombre: Unbounded_String;
        Partidas_Jugadas: Integer;
        Partidas_Ganadas: Integer;
    end record;

    package vector_jugadores is new Ada.Containers.Vectors
        (
        Index_Type => Natural, -- Incluye el CERO      POSITIVE EMPIEZA EN EL 1
        Element_Type => JUGADOR
        );
    use vector_jugadores;
    
    JUGADORES: Vector;
    NOMBRE_FICHERO: constant String := "jugadores.txt";

    ---------------------------------------------------------------------------
    --  MOSTRAR ESTADISTICAS DE UN JUGADOR
    ---------------------------------------------------------------------------
    PROCEDURE MOSTRAR_ESTADISTICAS_JUGADOR(    NOMBRE: Unbounded_String  ) is
    begin
        for UN_JUGADOR of JUGADORES loop
            if UN_JUGADOR.Nombre = NOMBRE then
                Put_Line("Jugador: " & TO_STRING(UN_JUGADOR.Nombre));
                --Put_Line(TO_STRING(UN_JUGADOR.Nombre)(1..4));
                Put_Line(" Partidas jugadas: " & UN_JUGADOR.Partidas_Jugadas'Image);
                Put_Line(" Partidas ganadas: " & UN_JUGADOR.Partidas_Ganadas'Image);
            end if;
        end loop;
    end MOSTRAR_ESTADISTICAS_JUGADOR;

    ---------------------------------------------------------------------------
    --  ALTA DE UN NUEVO JUGADOR
    ---------------------------------------------------------------------------
    procedure ALTA_JUGADOR (    NOMBRE: Unbounded_String;
                                PARTIDAS_JUGADAS: Integer:= 0;
                                PARTIDAS_GANADAS: Integer:= 0) is
        UN_JUGADOR: JUGADOR;                                
    begin
        UN_JUGADOR.Nombre := NOMBRE;
        UN_JUGADOR.Partidas_Jugadas := PARTIDAS_JUGADAS ;
        UN_JUGADOR.Partidas_Ganadas := PARTIDAS_GANADAS ;
        JUGADORES.append(UN_JUGADOR);
    end ALTA_JUGADOR;
    ---------------------------------------------------------------------------
    --  ANOTAR RESULTADO PARA JUGADOR
    ---------------------------------------------------------------------------
    PROCEDURE ANOTAR_RESULTADO_PARTIDA(    NOMBRE: Unbounded_String;
                                           RESULTADO: Boolean) is
    begin
        for UN_JUGADOR of JUGADORES loop
            if UN_JUGADOR.Nombre = NOMBRE then
                UN_JUGADOR.Partidas_Jugadas := UN_JUGADOR.Partidas_Jugadas + 1 ;
                if RESULTADO then 
                    UN_JUGADOR.Partidas_Ganadas := UN_JUGADOR.Partidas_Ganadas  + 1 ;
                end if;
            end if;
        end loop;
    end ANOTAR_RESULTADO_PARTIDA;
    ---------------------------------------------------------------------------
    --  Calcular un fichero de palabras
    ---------------------------------------------------------------------------
    procedure CARGAR_JUGADORES is
        mi_fichero: File_Type;
        NOMBRE: Unbounded_String;
        JUGADAS: Integer;
    begin
    
        Open (
                File => mi_fichero, -- Descriptor del fichero (PUNTERO AL CONTENIDO DEL FICHERO)
                Mode => In_File , --modo de apertura: Lectura, escritura, adición
                Name => NOMBRE_FICHERO-- nombre del fichero
                );
        
        while not End_Of_File(mi_fichero) loop
            NOMBRE:= To_Unbounded_String(Get_Line(mi_fichero));
            if LENGTH(NOMBRE) /=0 then
                JUGADAS:= Integer'Value(Get_Line(mi_fichero));
                ALTA_JUGADOR(
                         NOMBRE, 
                         JUGADAS, 
                         Integer'Value(Get_Line(mi_fichero)));
            end if;
        end loop;
        
        Close(mi_fichero);
    end CARGAR_JUGADORES;   
    ---------------------------------------------------------------------------
    --  GUARDAR EL VECTOR DE JUGADORES EN EL FICHERO ** DESPUES 
    ---------------------------------------------------------------------------
    procedure GUARDAR_JUGADORES is
        mi_fichero: File_Type;
        --PRIMERA_LINEA: Boolean:= True;
    begin
    
        CREATE (
                File => mi_fichero, -- Descriptor del fichero (PUNTERO AL CONTENIDO DEL FICHERO)
                Mode => Out_File , --modo de apertura: Lectura, escritura, adición
                Name => NOMBRE_FICHERO-- nombre del fichero
                );
        
        --for INDICE of JUGADORES.FIRST_INDEX..JUGADORES.LAST_INDEX loop
        --    JUGADORES(INDICE)
        for UN_JUGADOR of JUGADORES loop
            --IF not PRIMERA_LINEA THEN
            --    Put_Line(mi_fichero,"");
            --END IF;
            Put_Line( mi_fichero, TO_STRING(UN_JUGADOR.Nombre));
            --PRIMERA_LINEA:= False;
            Put_Line( mi_fichero, UN_JUGADOR.Partidas_Jugadas'Image);
            Put_Line( mi_fichero, UN_JUGADOR.Partidas_Ganadas'Image);
        end loop;
        
        Close(mi_fichero);

    end GUARDAR_JUGADORES;       
    
    
--begin
--    JUGADORES:= CARGAR_JUGADORES("jugadores_nuevo.txt");
    -- Listado de Jugadores por consola
--    for UN_JUGADOR of JUGADORES loop
--        Put_Line(TO_STRING(UN_JUGADOR.Nombre));
        --Put_Line(TO_STRING(UN_JUGADOR.Nombre)(1..4));
--        Put_Line(UN_JUGADOR.Partidas_Jugadas'Image);
--        Put_Line(UN_JUGADOR.Partidas_Ganadas'Image);
--    end loop;

--    MOSTRAR_ESTADISTICAS_JUGADOR(JUGADORES, TO_Unbounded_String("Ivan"));
--    ALTA_JUGADOR (    JUGADORES, TO_Unbounded_String("Lucas") );
--    MOSTRAR_ESTADISTICAS_JUGADOR(JUGADORES,TO_Unbounded_String( "Lucas"));
--    ANOTAR_RESULTADO_PARTIDA(    JUGADORES, TO_Unbounded_String("Lucas"), TRUE);
--    MOSTRAR_ESTADISTICAS_JUGADOR(JUGADORES, TO_Unbounded_String("Lucas"));
--    ANOTAR_RESULTADO_PARTIDA(    JUGADORES, TO_Unbounded_String("Lucas"), FALSE);
--    MOSTRAR_ESTADISTICAS_JUGADOR(JUGADORES, TO_Unbounded_String("Lucas"));
--    GUARDAR_JUGADORES("jugadores_nuevo2.txt",JUGADORES);
end;
