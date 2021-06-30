with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure Ejemplo2 is
    MI_VAR_NUMERO: Integer := 18;
    MI_VAR_TEXTO: String := "Hola";
begin
    Put_Line( MI_VAR_TEXTO ) ;
    Put(MI_VAR_NUMERO);
    if MI_VAR_NUMERO = 17 then      -- Operador comparacion
        Put_Line( "El número es el 17" ) ;
    elsif MI_VAR_NUMERO /= 18 then  -- Operador distinto
        Put_Line( "El número no es el 18" ) ;
    else
        Put_Line( "El número no es el 17 y cuando sea el 18" ) ;
    end if;
    
    if MI_VAR_NUMERO in 10 .. 20 then  -- En el rango
        Put_Line( "El número está entre el 10 y el 20" ) ;
    end if;
    if MI_VAR_NUMERO > 20 then  
        Put_Line( "El número es mayor que 20" ) ;
    end if;
    if MI_VAR_NUMERO < 20 then 
        Put_Line( "El número es menor que 20" ) ;
    end if;
    if MI_VAR_NUMERO <= 20 then  
        Put_Line( "El número menor o igual que 20" ) ;
    end if;

    if MI_VAR_NUMERO > 10 and MI_VAR_NUMERO < 20 then               -- Y Logico
        Put_Line( "El número mayor que 10 y menor que 20 " ) ;
    end if;
    
    if MI_VAR_NUMERO > 10 and then MI_VAR_NUMERO < 20 then          -- Y Logico en cortocircuito
        Put_Line( "El número mayor que 10 y menor que 20 " ) ;
    end if;
    
    -- condicion? valor si true : valor si false
    MI_VAR_NUMERO := -5;
    Put_Line( if MI_VAR_NUMERO >= 0 then "Es positivo" else "negativo"  ) ;
    Put_Line( case MI_VAR_NUMERO is 
                when 0 => "Es cero", 
                when others => "No es cero"  ) ;

    -- O Logico: or
    -- O Logico en cortocircuito : or then
    
    -- O Exclusivo : xor    SOLO SE DEBE CUMPLIR UNA DE LAS DOS PERO NO LAS DOS
    -- xor then ??  NO TIENE SENTIDO CONCEPTUAL. SIEMPRE SE DEBEN VERIFICAR LAS DOS
    -- not
    
    -- operadores aritméticos:
    -- SUMA: 3 + 5
    -- resta -
    -- multiplicacion: *
    -- division: /
    -- potencia: **
    -- resto de la dision entera: mod 
    -- abs
    
    -- & Concatenar textos
    MI_VAR_NUMERO := 20;
    case MI_VAR_NUMERO is
        when 10 =>
            Put_Line( "El número es 10" ) ;
        when 20 | 30 =>
            Put_Line( "El número es el 20 o 30" ) ;
        when 21 .. 29 =>
            Put_Line( "El número está entre el 20 y el  30" ) ;
        when others =>
            Put_Line( "El número es otra cosa" ) ;
        
    end case;
    
    --- BUCLE
    loop
        Put_Line( "En el bucle" ) ;
        exit when MI_VAR_NUMERO = 0; -- < Condicion de salida
        MI_VAR_NUMERO := MI_VAR_NUMERO -1 ;
    end loop;
    
    MI_VAR_NUMERO := 10;
    
    while MI_VAR_NUMERO > 0 loop
        Put_Line( "En el bucle, pero en otro" ) ;
        MI_VAR_NUMERO := MI_VAR_NUMERO -1 ;
    end loop;
    
    for MI_VAR_ITERACION in reverse 1 .. 5 loop
        Put_Line( "En el bucle, pero en otro mas" & Integer'Image(MI_VAR_ITERACION) ) ;
    end loop;
    
    -- Seccion declarativa
    declare
        MI_VAR_TEXTO2: String := "      ";
        -- Procedimientos --Funciones
    begin
        MI_VAR_TEXTO2 := "CHAO !";
        Put_Line(MI_VAR_TEXTO2);
    end;
    
end Ejemplo2;

