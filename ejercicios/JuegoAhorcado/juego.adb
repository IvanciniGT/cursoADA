with jugadores;
use jugadores;

with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ahorcado;
use Ahorcado;

package body Juego is

    function PEDIR_NOMBRE_JUGADOR return Unbounded_String is
    begin
        Put_Line("Cómo te llamas? ");
        return To_Unbounded_String(Get_Line); 
    end PEDIR_NOMBRE_JUGADOR;

    function PREGUNTAR_SI_JUGAR_DE_NUEVO return Boolean is
    begin
        Put_Line("Quieres jugar de nuevo? s/n ");
        return Get_Line = "s"; 
    end PREGUNTAR_SI_JUGAR_DE_NUEVO;

    procedure JUGAR is
        NOMBRE_JUGADOR: Unbounded_String;
        SEGUIR_JUGANDO: Boolean;
        PARTIDA_GANADA: Boolean;
    begin
        CARGAR_JUGADORES;
        
        NOMBRE_JUGADOR:= PEDIR_NOMBRE_JUGADOR;
        ALTA_JUGADOR(NOMBRE_JUGADOR);
        
        loop
            PARTIDA_GANADA := JUGAR_PARTIDA;
            ANOTAR_RESULTADO_PARTIDA( NOMBRE_JUGADOR, PARTIDA_GANADA );
            MOSTRAR_ESTADISTICAS_JUGADOR (NOMBRE_JUGADOR );
            SEGUIR_JUGANDO := PREGUNTAR_SI_JUGAR_DE_NUEVO;
            exit when not SEGUIR_JUGANDO;
        end loop;
    end JUGAR;
    
end Juego;

-- En general TODO LO VOY A INTENTAR HACER SIEMPRE EN UN PAQUETE
-- Y TENER UN METODO MAIN MUY SENCILLO