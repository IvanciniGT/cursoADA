with jugadores;
use jugadores;

with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

procedure Prueba is
begin
    CARGAR_JUGADORES;
    
    MOSTRAR_ESTADISTICAS_JUGADOR( TO_Unbounded_String("Ivan"));
    
    ALTA_JUGADOR (     TO_Unbounded_String("Lucas") );
    MOSTRAR_ESTADISTICAS_JUGADOR(TO_Unbounded_String( "Lucas"));
    
    ANOTAR_RESULTADO_PARTIDA(     TO_Unbounded_String("Lucas"), TRUE);
    MOSTRAR_ESTADISTICAS_JUGADOR( TO_Unbounded_String("Lucas"));
    
    ANOTAR_RESULTADO_PARTIDA(     TO_Unbounded_String("Lucas"), FALSE);
    MOSTRAR_ESTADISTICAS_JUGADOR( TO_Unbounded_String("Lucas"));
    
    GUARDAR_JUGADORES;
end Prueba;