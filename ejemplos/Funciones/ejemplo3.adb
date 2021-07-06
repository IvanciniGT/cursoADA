with Ada.Text_IO;
use Ada.Text_IO;

procedure Ejemplo3 is
    
    -- Declaraciones de variables, 
    Resultado: Integer;
    
    -- funciones y procedimientos internos a este
    function Doblar (Numero: Integer) return Integer is
    begin
        return numero * 2;
    end Doblar;
    
    function Maximo (Numero1: Integer; Numero2: Integer) 
        return Integer is
    begin
        return (if Numero1 > Numero2 then Numero1 else Numero2);  
        --    if Numero1 > Numero2 then
        --        return Numero1;
        --    else 
        --        return Numero2;
        --    end if;
    end Maximo;

    function Maximo (Numero1: Integer; 
                           Numero2: Integer; 
                           Numero3: Integer) 
        return Integer is
    begin
        return Maximo(Maximo(Numero1, Numero2), Numero3);
    end Maximo;



    function IdentificarMaximo (Numero1: in Integer; Numero2: in Integer; Cual: in out Integer) 
        return Integer is
    begin
        if Numero1 > Numero2 then
            Cual:= 1;
            return Numero1;
        elsif Numero1 < Numero2 then
            Cual:= 2;
            return Numero2;
        else 
            return Numero1;
        end if;
    end IdentificarMaximo;
    
    PRIORIDAD: Integer;
    
    function ElevarA (Numero: Integer:= 1; Exponente: Integer:= 2) return Integer is
    begin
        return Numero ** Exponente;
    end;
begin
    
    Resultado := Doblar(4);
    Put_line(Integer'Image(resultado));
    
    Resultado := Maximo(4,8);
    Put_line(Integer'Image(resultado));
    
    Resultado := Maximo(4,8,7);
    Put_line(Integer'Image(resultado));
    
    PRIORIDAD:=2;
    Resultado := IdentificarMaximo(8,1,PRIORIDAD); --- Devuelva el maximo, pero también qué parametro trae ese maximo (1,2)
    Put_line(Integer'Image(resultado));
    Put_line(Integer'Image(PRIORIDAD));

    Resultado := ElevarA(4,2);
    Put_line(Integer'Image(resultado));

    Resultado := ElevarA;
    Put_line(Integer'Image(resultado));

    Resultado := ElevarA(3);
    Put_line(Integer'Image(resultado));

    Resultado := ElevarA(Exponente => 3);
    Put_line(Integer'Image(resultado));



end Ejemplo3;