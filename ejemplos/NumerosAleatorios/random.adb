with ada.Text_IO;
use ada.Text_IO;

with ada.numerics.discrete_random; -- aleatorios sobre un conjunto finito de posibilidades

procedure Random is
    
    type RANGO_NUMERO_ALEATORIO is new Integer range 1..100;
    
    package mi_paquete_numeros_aleatorios is new ada.numerics.discrete_random(
        RANGO_NUMERO_ALEATORIO
    ); 
    use mi_paquete_numeros_aleatorios;
    
    MI_GENERADOR: GENERATOR;
    
    NUMERO_ALEATORIO: RANGO_NUMERO_ALEATORIO;
    
    
begin
    --
    reset(MI_GENERADOR); -- Lo inicializa
    --
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    PUT_LINE(NUMERO_ALEATORIO'IMAGE);    
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    PUT_LINE(NUMERO_ALEATORIO'IMAGE);    
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    PUT_LINE(NUMERO_ALEATORIO'IMAGE);    
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    PUT_LINE(NUMERO_ALEATORIO'IMAGE);    
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    PUT_LINE(NUMERO_ALEATORIO'IMAGE);    
    NUMERO_ALEATORIO := random(MI_GENERADOR); 
    PUT_LINE(NUMERO_ALEATORIO'IMAGE);    
end;