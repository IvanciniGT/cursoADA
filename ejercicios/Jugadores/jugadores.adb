-- Que es un record en ADA? struct en C
-- Tipo de dato que me permite almacenar dentro más datos de forma estructurada
with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

procedure Jugadores is
    
    type JUGADOR is record
        Nombre: Unbounded_String;
        Partidas_Jugadas: Integer;
        Partidas_Ganadas: Integer;
    end record;

    JUGADORES: Vector;
    
begin

end;