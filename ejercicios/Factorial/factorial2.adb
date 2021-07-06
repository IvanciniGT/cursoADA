with Ada.Text_IO;
use Ada.Text_IO;

procedure Factorial2 is
    RESULTADO: Integer := 1;
    function Factorial (Numero: Integer) return Integer is
    begin
        if Numero = 0 then
            return 1;
        end if;
        return Numero*Factorial(Numero-1);
        
    end Factorial;
begin

    RESULTADO:= Factorial(6);
    Put_Line("RESULTADO: " & Integer'Image(RESULTADO)) ;
end Factorial2;