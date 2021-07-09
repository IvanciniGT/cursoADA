with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ada.Containers.Vectors;

package Jugadores is
    
    procedure MOSTRAR_ESTADISTICAS_JUGADOR(  NOMBRE: Unbounded_String  ) ;

    procedure ALTA_JUGADOR (    NOMBRE: Unbounded_String;
                                PARTIDAS_JUGADAS: Integer:= 0;
                                PARTIDAS_GANADAS: Integer:= 0) ;

    procedure ANOTAR_RESULTADO_PARTIDA(    NOMBRE: Unbounded_String;
                                           RESULTADO: Boolean) ;

    procedure CARGAR_JUGADORES ;   
    
    --procedure GUARDAR_JUGADORES ;       
end;
