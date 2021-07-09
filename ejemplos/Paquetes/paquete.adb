with Ada.Text_IO;
use Ada.Text_IO;

package body Paquete is
    
    ULTIMO_NUMERO: Integer:=0;
    
    function doblar (NUMERO: Integer) return Integer is
    begin
        return NUMERO * 2;
    end doblar;
    
    procedure imprimir_numero (NUMERO: Integer) is
    begin
        PUT_LINE( NUMERO'IMAGE );
        ULTIMO_NUMERO := NUMERO;
    end imprimir_numero;

    procedure reimprimir_ultimo_numero  is
    begin
        imprimir_numero(ULTIMO_NUMERO);
    end reimprimir_ultimo_numero;

end Paquete;