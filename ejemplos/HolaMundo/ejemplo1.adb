-- Importar los paquetes y librerias que vamos a utilizar
with Ada.Text_IO;
-- Poder utilizar todas las funciones que haya definidas ahi dentro sin 
-- necesidad de referencia continuamente el paquete
use Ada.Text_IO;

-- Comentarios
procedure Ejemplo1 is
begin
    Put_Line("Primer ejemplo") ;
end Ejemplo1; -- No es obligatorio... pero de muy buen gusto
              -- De hecho el no ponerlo esta considerado de muy muy mal gusto.
              
            -- ; fin de statement