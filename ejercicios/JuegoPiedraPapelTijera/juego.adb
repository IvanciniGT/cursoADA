with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
procedure Juego is

    ------------------------------------------------------------------
    -- Parametrización del Juego
    ------------------------------------------------------------------
    NUMERO_PARTIDAS_GANADAS_PARA_GANAR_JUEGO: constant := 2;

    ------------------------------------------------------------------
    -- Tipos a usar en el programa
    ------------------------------------------------------------------
    type Eleccion is (PIEDRA, PAPEL, TIJERA );
    type Resultado is (USUARIO, ORDENADOR, EMPATE);
    type Reglas is array (Eleccion, Eleccion) of Resultado; -- Tipo de datos donde poder poner reglas de juego
    type Tablero_Resultados is array (Resultado) of Integer;
    
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
    -- Función para imprimir el resultado de una mano
    ------------------------------------------------------------------
    procedure MOSTRAR_RESULTADO (MANO_ORDENADOR: Eleccion;
                                 MANO_JUGADOR: Eleccion; 
                                 GANADOR: Resultado) is
    begin
        Put_Line("Ha ganado: " & GANADOR'Image);
    end MOSTRAR_RESULTADO;
    
    ------------------------------------------------------------------
    -- Función para imprimir el resultado final
    ------------------------------------------------------------------
    procedure MOSTRAR_RESULTADO_FINAL (RESULTADOS: Tablero_Resultados ) is
    begin
        Put_Line("El ordenador ha ganado:" & RESULTADOS(Ordenador)'Image);
        Put_Line("Tu has ganado:" & RESULTADOS(Usuario)'Image);
        
        if RESULTADOS(Usuario) > RESULTADOS(Ordenador) then
            Put_Line("Eres un máquina !!!!");
        else
            Put_Line("Vaya paquete que estás hecho !!!!");
        end if;
    end MOSTRAR_RESULTADO_FINAL;

    ------------------------------------------------------------------
    -- Función para imprimir el resultado
    ------------------------------------------------------------------
    function JUGAR_MANO (REGLAS_DE_MI_JUEGO: Reglas) return Resultado is
        MANO_JUGADOR: Eleccion;
        MANO_ORDENADOR: Eleccion;
        GANADOR: Resultado;
    begin 
        MANO_ORDENADOR := OBTENER_MANO_ORDENADOR;
        MANO_JUGADOR := OBTENER_MANO_JUGADOR;
        
        GANADOR := REGLAS_DE_MI_JUEGO (MANO_JUGADOR,MANO_ORDENADOR);
        
        MOSTRAR_RESULTADO(MANO_ORDENADOR, MANO_JUGADOR, GANADOR);
        return  GANADOR;
    end JUGAR_MANO;
    
    ------------------------------------------------------------------
    -- Variables de una mano
    ------------------------------------------------------------------
    REGLAS_DE_MI_JUEGO: Reglas;
    GANADOR_DE_LA_MANO_ACTUAL: Resultado;
    RESULTADOS: Tablero_Resultados:= (0,0,0);
begin
    
    REGLAS_DE_MI_JUEGO := InicializarReglas;

    -- Hasta ganar el nñumero de partidas requerido
    while            RESULTADOS(ORDENADOR) /= NUMERO_PARTIDAS_GANADAS_PARA_GANAR_JUEGO 
            AND THEN RESULTADOS(USUARIO) /= NUMERO_PARTIDAS_GANADAS_PARA_GANAR_JUEGO loop
        GANADOR_DE_LA_MANO_ACTUAL := JUGAR_MANO(REGLAS_DE_MI_JUEGO); 
        -- Incremento la cuenta total para el ganador
        RESULTADOS(GANADOR_DE_LA_MANO_ACTUAL):=RESULTADOS(GANADOR_DE_LA_MANO_ACTUAL)+1;
    end loop;
    
    MOSTRAR_RESULTADO_FINAL(RESULTADOS);
    
end Juego;