Program p2;
Var
  x,y:real;
Begin
  Readln(x,y);
  if ((0 <= x) and (x <= -abs(y) + 2)) or ((0 > x) and (sqr(x) + sqr(y) < 4))
    then
      WriteLn('Да')
    else
      WriteLn('Нет');
End.
