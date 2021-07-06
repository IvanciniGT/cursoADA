with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

procedure JuegoFrioCaliente is
    SECRETO: Integer := 17;
    NUMERO_USUARIO: Integer;
    DISTANCIA_AL_NUMERO: Integer;
    VIDAS: Integer := 3;
begin
    -- Mientras le queden vidas
    -- while | loop exit
    while VIDAS > 0 loop
        -- Pedir un numero al usuario
        put_line("Adivina el número:");
        get(NUMERO_USUARIO);
        -- Comprobar la distancia con el secreto
        DISTANCIA_AL_NUMERO := abs(SECRETO-NUMERO_USUARIO);
        -- En función de la distancia: 
        case DISTANCIA_AL_NUMERO is
            when 0 => 
                -- Imprimir un mensaje si acierta
                put_line("Lo has adivinado !!");
                VIDAS := 0; -- lo veo confuso. Despista
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
    if VIDAS = 0 then
        put_line("Has perdido !");
    end if;
end JuegoFrioCaliente ;