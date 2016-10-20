Program p4;
Var
  x,y:real;
Begin
  Readln(x,y);
  if (sqr(x) + sqr(y) >= 4) and (abs(x) <= 2) and (abs(y) <= 2) and ((x <= 0) or (y <= 0))
    then
      WriteLn('Да')
    else
      WriteLn('Нет');
End.
