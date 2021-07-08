with Ada.Text_IO;
use Ada.Text_IO;
procedure Arrays is
                           -- Indices aceptados (tamaño)
    type MiTipoDeArray is array (1..10) of Integer;
    type MiTipoDeArray2D is array (1..10,1..10) of Integer;
                                       -- Tipo de dato de cada item
                                       
                                       
                                       
    type MiTipoDeArrayVariable is array (Integer range <>) of Integer;
                                       
    miarray: MiTipoDeArray;
    miarray2D: MiTipoDeArray2D;
begin
    miarray := (1,2,3,4,5,6,7,8,9,10) ;
    Put_Line("Tengo mi array") ;
    
    for Idx in miarray'range loop
        miarray(Idx) := miarray(Idx) *2;
        Put_Line("Elemento5: " & Integer'Image( miarray(Idx) )) ;
    end loop;
    
    miarray2D(1,3):=7;
    
    declare
        nuevoArray: constant MiTipoDeArrayVariable := (1,2,3);
    begin
            PUT_LINE ("AQUI VAMOS !!!!");
            PUT_LINE (nuevoArray'Length'Image);
            PUT_LINE (nuevoArray(2)'Image);
    end;

end Arrays;