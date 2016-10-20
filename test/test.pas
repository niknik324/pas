Program test;
Uses
  Crt;
Var
  x,y:integer;
Begin
  Readln(x,y);
  ClrScr();
  if (0<=x)and(2>=x)
    then
      WriteLn(x)
    else
      WriteLn(y);
End.
