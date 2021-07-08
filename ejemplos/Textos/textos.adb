with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Strings.Fixed;
use Ada.Strings.Fixed;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Ada.Strings.Maps.Constants;
use Ada.Strings.Maps.Constants;

with Ada.Characters.Handling;
use Ada.Characters.Handling;

procedure Textos is
    TEXTO: String := "Hola TEXTOS";     -- En este caso no hay problema
    --TEXTO: String := "ADIOS TEXTOS";    -- En este caso SI hay problema. 
                                        -- Ya que luego cambiamos el valor por uno de diferente tamaño
    --TEXTO: String;                      -- En este caso falla por no estar la variable 
                                        -- inicializada con un determinado tamaño.
                                        
    TEXTO_UNBOUNDED : UnBounded_String;
    PALABRA: String := "textos"; 
begin

    -- TEXTOS FIJOS
    TEXTO := "Hola textos";
    Put_Line("Texto: " & TEXTO);
    Put_Line(" longitud: " & TEXTO'Length'Image);
    for Posicion in 1 .. TEXTO'Length loop
        Put_Line(" Caracter: " & TEXTO(Posicion));
    end loop;
    
   if Index(TEXTO, "texto") /=0 then
        Put_Line(" Contiene la palabra 'texto'");
   end if;

   Put_Line(     Translate(TEXTO, Upper_Case_Map)    );
   Put_Line(     Translate(TEXTO, Lower_Case_Map)    );

   Put_Line(     To_Upper(TEXTO)    );
   Put_Line(     To_Lower(TEXTO)    );


    -- TEXTOS BOUNDED
    TEXTO_UNBOUNDED := To_Unbounded_String("Hola textos");
    Put_Line("Texto: " & To_String(TEXTO_UNBOUNDED));
    
    TEXTO_UNBOUNDED := To_Unbounded_String("Adios textos");
    Put_Line("Texto: " & To_String(TEXTO_UNBOUNDED));
    Put_Line(" longitud: " & Length(TEXTO_UNBOUNDED)'Image);
    
    for Posicion in 1 .. Length(TEXTO_UNBOUNDED) loop
        Put_Line(" Caracter: " & Element(TEXTO_UNBOUNDED,Posicion));
    end loop;
    
    Put_Line(""&PALABRA(1));

   if Index(TEXTO_UNBOUNDED, ""&PALABRA(1))/=0 then
        Put_Line(" Contiene la palabra 'texto'");
   end if;

   Put_Line(To_String(     Translate(TEXTO_UNBOUNDED, Upper_Case_Map)    ));
   Put_Line(To_String(     Translate(TEXTO_UNBOUNDED, Lower_Case_Map)    ));


end Textos;