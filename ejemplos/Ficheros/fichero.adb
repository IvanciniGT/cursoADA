with Ada.Text_IO;
use Ada.Text_IO;

procedure Fichero is
    mi_fichero: File_Type;
    numero_linea: Integer:=1;
begin
    Open (
            File => mi_fichero, -- Descriptor del fichero (PUNTERO AL CONTENIDO DEL FICHERO)
            Mode => In_File , --modo de apertura: Lectura, escritura, adición
            Name => "fichero.adb"-- nombre del fichero
            );
    
    while not End_Of_File(mi_fichero) loop
        Put_Line("Linea " & numero_linea'Image & ": " & Get_Line(mi_fichero));
        numero_linea:= numero_linea+1;
    end loop;
    
    Close(mi_fichero);
    
end Fichero;