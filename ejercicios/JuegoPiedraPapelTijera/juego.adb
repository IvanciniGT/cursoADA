with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
procedure Juego is

    ------------------------------------------------------------------
    -- Tipos a usar en el programa
    ------------------------------------------------------------------
    type Eleccion is (PIEDRA, PAPEL, TIJERA );
    type Resultado is (USUARIO, ORDENADOR, EMPATE);
    type Reglas is array (Eleccion, Eleccion) of Resultado; -- Tipo de datos donde poder poner reglas de juego
    
    ------------------------------------------------------------------
    -- Fucion inicializadora de reglas
    ------------------------------------------------------------------
    function InicializarReglas return Reglas is
        -- Defino una variable donde poner las reglas del juego
        REGLAS_DEL_JUEGO: Reglas;
    begin
        -- Inicializa las reglas del juego
        REGLAS_DEL_JUEGO (PIEDRA,PIEDRA) := EMPATE;
        REGLAS_DEL_JUEGO (PIEDRA,PAPEL)  := ORDENADOR;
        REGLAS_DEL_JUEGO (PIEDRA,TIJERA) := USUARIO;
        
        REGLAS_DEL_JUEGO (PAPEL,PIEDRA)  := USUARIO;
        REGLAS_DEL_JUEGO (PAPEL,PAPEL)   := EMPATE;
        REGLAS_DEL_JUEGO (PAPEL,TIJERA)  := ORDENADOR;
        
        REGLAS_DEL_JUEGO (TIJERA,PIEDRA) := ORDENADOR;
        REGLAS_DEL_JUEGO (TIJERA,PAPEL)  := USUARIO;
        REGLAS_DEL_JUEGO (TIJERA,TIJERA) := EMPATE;
        -- devuelvo las reglas del juego
        return REGLAS_DEL_JUEGO;

    end InicializarReglas;
    
    ------------------------------------------------------------------
    -- Función para pedir la mano del usuario
    ------------------------------------------------------------------
    function OBTENER_MANO_JUGADOR return ELECCION is
        MANO_JUGADOR_NUMERO: Integer;
    begin
        Put_Line("Elije 0=Piedra, 1=papel o 2=tijera: ");
        Get(MANO_JUGADOR_NUMERO);
        return (case MANO_JUGADOR_NUMERO is when 0 => Piedra, when 1 => Papel, when others => Tijera);
    end OBTENER_MANO_JUGADOR;
    
    
    ------------------------------------------------------------------
    -- Función para pedir la mano del ordenador
    ------------------------------------------------------------------
    function OBTENER_MANO_ORDENADOR return ELECCION is
    begin
        return PAPEL;
    end OBTENER_MANO_ORDENADOR;
     
    ------------------------------------------------------------------
    -- Función para imprimir el resultado
    ------------------------------------------------------------------
    procedure MOSTRAR_RESULTADO (MANO_ORDENADOR: Eleccion;
                                 MANO_JUGADOR: Eleccion; 
                                 GANADOR: Resultado) is
    begin
        Put_Line("Ha ganado: " & GANADOR'Image);
    end MOSTRAR_RESULTADO;
    
    ------------------------------------------------------------------
    -- Variables de una mano
    ------------------------------------------------------------------
    REGLAS_DE_MI_JUEGO: Reglas;
    MANO_JUGADOR: Eleccion;
    MANO_ORDENADOR: Eleccion;
    GANADOR: Resultado;
    
begin
    
    REGLAS_DE_MI_JUEGO := InicializarReglas;

    MANO_ORDENADOR := OBTENER_MANO_ORDENADOR;
    MANO_JUGADOR := OBTENER_MANO_JUGADOR;
    
    GANADOR := REGLAS_DE_MI_JUEGO (MANO_JUGADOR,MANO_ORDENADOR);
    
    MOSTRAR_RESULTADO(MANO_ORDENADOR, MANO_JUGADOR, GANADOR);
    
end Juego;