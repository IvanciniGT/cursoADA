with Ada.Text_IO;
use Ada.Text_IO;

procedure Factorial is
    NUMERO: Integer := 8;
    FACTORIAL: Integer := 1;
    NUMERO_AUXILIAR : Integer;
begin

    NUMERO_AUXILIAR := NUMERO;
    
    loop 
        FACTORIAL := FACTORIAL * NUMERO_AUXILIAR;
        NUMERO_AUXILIAR := NUMERO_AUXILIAR -1;
        exit when NUMERO_AUXILIAR = 0;
    end loop;

    Put_Line("RESULTADO: " & Integer'Image(FACTORIAL)) ;
end Factorial;