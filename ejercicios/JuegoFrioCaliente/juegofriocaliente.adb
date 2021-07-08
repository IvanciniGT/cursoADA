with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
with CALCULAR_NUMERO_ALEATORIO;
--use CALCULAR_NUMERO_ALEATORIO;

procedure JuegoFrioCaliente is
    
    SECRETO: Integer;
    NUMERO_USUARIO: Integer;
    DISTANCIA_AL_NUMERO: Integer;
    VIDAS: Integer := 3;
    ACERTADO: Boolean := False;
begin
    -- Mientras le queden vidas
    SECRETO:= CALCULAR_NUMERO_ALEATORIO(1,20);
    -- while | loop exit
    while VIDAS > 0 AND THEN NOT ACERTADO loop
        -- Pedir un numero al usuario
        put_line("Adivina el número:");
        get(NUMERO_USUARIO);
        -- Comprobar la distancia con el secreto
        DISTANCIA_AL_NUMERO := abs(SECRETO-NUMERO_USUARIO);
        
        -- En función de la distancia: 
        case DISTANCIA_AL_NUMERO is
            when 0 => 
                -- Imprimir un mensaje si acierta
                ACERTADO := True;
                --VIDAS := 0; -- lo veo confuso. Despista
            when 1 | 2 => 
                -- Imprimir un mensaje si ha fallado
                put_line("Casi!!! Muy caliente!");
            when 3 .. 4 => 
                put_line("Por poco!!! caliente!");
            when 5 ..6 => 
                put_line("Bueno... templado, templado !!");
            when others => 
                put_line("Bahhh !! Frio, frio :(");
        end case;
        -- Restar una vida
        VIDAS := VIDAS - 1;
    end loop;
    
    -- Imprimir el resultado del juego
    if ACERTADO then
        put_line("Lo has adivinado !!");
    else
        put_line("Has perdido !");
    end if;
    
end JuegoFrioCaliente ;
