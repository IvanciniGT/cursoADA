-- Que es un record en ADA? struct en C
-- Tipo de dato que me permite almacenar dentro más datos de forma estructurada
with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

procedure Records is
    type JUGADOR is record
        Nombre: Unbounded_String;
        Partidas_Jugadas: Integer;
        Partidas_Ganadas: Integer;
    end record;
    
    JUGADOR1: Jugador;
    JUGADOR2: Jugador;
    JUGADOR3: Jugador;
begin
    JUGADOR1:= (To_Unbounded_String("van"), 4 , 4 );
    JUGADOR2:= (Nombre =>To_Unbounded_String("Daniel"), Partidas_Ganadas => 8 , Partidas_Jugadas=> 10 );
    JUGADOR3.Nombre:=To_Unbounded_String("Jaime");
    JUGADOR3.Partidas_Ganadas:=12;
    JUGADOR3.Partidas_Jugadas:=5;
    
    PUT_LINE(TO_STRING(JUGADOR2.Nombre) & " ha ganado " & JUGADOR2.Partidas_Ganadas'Image & " partidas");
    
end;