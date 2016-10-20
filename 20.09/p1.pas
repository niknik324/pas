Program p1;
Var
  x,y:real;
Begin
  Readln(x,y);
  if (0 <= x) and (2 >= x) and (0 <= y) and (1 >= y)
    then
      WriteLn('Да')
    else
      WriteLn('Нет');
End.
