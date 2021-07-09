with ada.numerics.discrete_random;

---------------------------------------------------------------------------
--  Calcular un numero aleatorio en un rango
---------------------------------------------------------------------------
function CALCULAR_NUMERO_ALEATORIO (MINIMO: Integer; MAXIMO: INTEGER) return Integer is
    subtype RANGO_NUMERO_ALEATORIO is Integer range MINIMO..MAXIMO;
    --type RANGO_NUMERO_ALEATORIO is new Integer range MINIMO..MAXIMO;
    package mi_paquete_numeros_aleatorios is new ada.numerics.discrete_random(
        RANGO_NUMERO_ALEATORIO
    ); 
    use mi_paquete_numeros_aleatorios;
    MI_GENERADOR: GENERATOR;
    NUMERO_ALEATORIO: RANGO_NUMERO_ALEATORIO;
begin
    reset(MI_GENERADOR); 
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    return NUMERO_ALEATORIO;--'Integer;
end CALCULAR_NUMERO_ALEATORIO;

