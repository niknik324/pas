Program p3;
Var
  x,y:real;
Begin
  Readln(x,y);
  if (sqr(x) + sqr(y) <= 1) and (abs(x) + abs(y) >= 1)
    then
      WriteLn('Да')
    else
      WriteLn('Нет');
End.
