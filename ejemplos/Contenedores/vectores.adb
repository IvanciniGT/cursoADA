-- Que es un paquete en ADA
-- Conjunto de funciones y un conjunto de variables

-- Genericos: Hay paquetes que permiten realizar sus funciones, para diferentes tipos de objetos que se definen en tipo de ejecución.

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Containers.Vectors;

procedure Vectores is
    package mi_paquete_de_vectores is new Ada.Containers.Vectors
        (
        Index_Type => Natural, -- Incluye el CERO      POSITIVE EMPIEZA EN EL 1
        Element_Type => Integer
        );
    use mi_paquete_de_vectores;
    --mi_vector: mi_paquete_de_vectores.Vector;
    mi_vector: Vector;
begin
    mi_vector.append(10);
    mi_vector.append(20);
    mi_vector.append(30);
    mi_vector.append(40);
    mi_vector.append(50);
    mi_vector.append(60);
    mi_vector.prepend(0);
    
    PUT_LINE( mi_vector.Length'Image );
    PUT_LINE( Integer'Image(   mi_vector(4) ) );
    PUT_LINE( Integer'Image(   mi_vector(0) ) );
    
    PUT_LINE( ">>>" & Integer'Image(   mi_vector.First_Element ) );
    PUT_LINE( ">>>" & Integer'Image(   mi_vector.Last_Element ) );
    
    PUT_LINE( Integer'Image(   mi_vector.First_Index ) );
    PUT_LINE( Integer'Image(   mi_vector.Last_Index ) );
    
    for elemento of mi_vector loop
        PUT_LINE( "-" & elemento'Image );
    end loop;

    mi_vector.delete(0);    
    mi_vector.delete(3);

    for indice in mi_vector.First_Index .. mi_vector.Last_Index loop
        PUT_LINE( Integer'Image(   mi_vector(indice) ) );
    end loop;

end;