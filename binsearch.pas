Program BinSearchDemo(Input,Output);

{ Programa que hace una busqueda binaria en un array de enteros.  Puede ser }
{ modificado facilmente para buscar en cualquier tipo de datos, incluyendo  }
{ records, listas, etc.                                                     }
{ Escrito por Egdares Futch H. para el curso de Programacion II             }
{ Compilador : Turbo Pascal Professional 6.0                                }

Type
   Arr = Array[0..99] of Integer;

Function BinSearch(Low,High : Integer; What : Integer;
                   Where : Arr) : Integer;
Var
   Middle : Integer;
Begin
   Middle := (High + Low) div 2;
   If (Where[Middle] > What) or (Low >= High) then
      Begin
         BinSearch := -1;
         Exit;
      End;
   If What = Where[Low] then
      BinSearch := Low Else
   if What = Where[High] then
      BinSearch := High Else
   If What = Where[Middle] then
      BinSearch := Middle
      Else Begin
              If What > Where[Middle] then
                 BinSearch := BinSearch(Middle,High,What,Where)
                 Else BinSearch := BinSearch(Low,Middle,What,Where);
           End;
End; {BinSearch}

Var
   MyArray : Arr;
   H,N : Integer;

Begin
   For H := 0 to 99 do MyArray[H] := H * 2;   { Llenamos el array de cosas }
   N := 0;
   Repeat
      Write('Ingrese el numero a buscar ? ');
      ReadLn(N);
      WriteLn('El numero lo encontre en la posicion = ',
                     BinSearch(0,99,N,MyArray));
   Until N < 0;
End. {MainProgram}