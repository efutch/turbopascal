Program Stack_Obj(Input,Output);

{ Demostracion del objeto para manejar stacks.  Notese que para hacer un }
{ stack de otro tipo de datos solamente se cambia el tipo declarado aqui }
{ Escrito por Egdares Futch H. Diciembre 1991 }
{ Compilador : Turbo Pascal Professional 6.0 }


(*********** ESTO DEBERIA DE ESTAR EN UN INCLUDE FILE ******************)

Const
   MaxStackSize = 30;

Type
   { Tipo de datos que contiene el stack }
   StackComponentType = Integer;

   { Objeto del stack }
   Stack = Object
              TOS : Integer;
              Data : Array[1..MaxStackSize] of StackComponentType; { OJO }
              Procedure Init;
              Procedure Push(What : StackComponentType);
              Procedure Pop(Var What : StackComponentType);
              Procedure Top(Var What : StackComponentType);
              Function Full : Boolean;
              Function Empty : Boolean;
              Procedure Done;
           End;

Procedure Stack.Init;
Begin
   TOS := 0;
End; {Stack.Init}

Procedure Stack.Push;
Begin
   If Full then WriteLn('Stack.Push : Espacio insuficiente')
    Else Begin
            Inc(TOS);
            Data[TOS] := What;
         End;
End; {Stack.Push}

Procedure Stack.Pop;
Begin
   If Empty then WriteLn('Stack.Pop : No hay elementos en el stack')
     Else Begin
             What := Data[TOS]; 
             Dec(TOS);
          End;
End; {Stack.Pop}

Procedure Stack.Top;
Begin
   If Empty then WriteLn('Stack.Top : No hay elementos en el stack')
     Else What := Data[TOS]; 
End; {Stack.Top}

Function Stack.Full;
Begin
   If TOS = MaxStackSize then Full := True Else Full := False;
End; {Stack.Full}

Function Stack.Empty;
Begin
   If TOS = 0 then Empty := True Else Empty := False;
End; {Stack.Empty}

Procedure Stack.Done;
Begin
   TOS := 0;
End; {Stack.Done}

(********************* FIN DEL INCLUDE FILE **************************)

Var
  X : Stack;
  Y : StackComponentType;

Begin
   X.Init;
   For Y := 1 to 34 do
     X.Push(Y);
   Repeat
      X.Pop(Y);
      WriteLn(Y);
   Until X.Empty;
   X.Done;
End.
