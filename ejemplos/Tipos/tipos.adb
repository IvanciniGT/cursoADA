with Ada.Text_IO;
use Ada.Text_IO;

procedure Tipos is
    -- Integer
    -- Float
    -- Boolean
    -- String
    
    -- Para que sirve esto:
    --    Chequeos fuertes a la hora de compilar (Fuera de rango)
    --    Hacer más eficiente el uso de la RAM
    --    Independizarme del hardware/OS
    --    Asegurarme cuando hago operaciones que los argumentos/operandos son de los tipos adecuados
    
    type Edad is new Integer range 0 .. 120;
    type EdadDecimal is new Float range 0.0 .. 120.0;
    
    function ConvertirAEdad (meses: Integer) return Edad is
    begin
        return Edad(meses/12);
    end ConvertirAEdad;

    MisMeses: Integer :=42*12;
    MiEdad: Edad :=42;
    
    -- Enumeración
    type MES is (ENERO, FEBRERO, MARZO, ABRIL, MAYO, JUNIO, JULIO, AGOSTO, SEPTIEMBRE, OCTUBRE, NOVIEMBRE, DICIEMBRE);
    
    subtype MES_VERANO is MES range JULIO .. SEPTIEMBRE;
    MES_NACIMIENTO: MES := Agosto;
    MES_DE_MIS_VACACIONES: MES_VERANO := Agosto;
    
begin
    Put_Line("Mis años: " & Integer'Image(Integer(ConvertirAEdad(MisMeses)-MiEdad))) ;
    Put_Line("Mis años: " & Edad'Image(ConvertirAEdad(MisMeses)-MiEdad)) ;
        --Put_Line("Mis edad: " & Integer'Image(MiEdad)) ;
    if MES_NACIMIENTO = MES_DE_MIS_VACACIONES then
        Put_Line("Vas a estar de vacaciones en tu cumple !!!!!");
    end if;

end Tipos;
