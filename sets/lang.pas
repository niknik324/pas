Program lang;
Uses
  Classes, SysUtils, StrUtils, Crt;
Var
  readenfile: TextFile;
  francais,english,deutsch : set of 1..30;
  students: array[1..30] of string;
  cu_name,filename: string;
  i,ii: integer;
Begin
  Assign(readenfile, 'students.txt');
  reset(readenfile);
  for i := 1 to 30 do
     readln(readenfile,students[i]);
  Close(readenfile);

english := [];

  i := 1;
  Assign(readenfile, 'english.txt');
  reset(readenfile);
  for ii := 1 to 20 do
    begin
     readln(readenfile,cu_name);
     for i := i to 30 do
       begin
          if cu_name = students[i] then
            begin
              english := english + [i];
              break;
            end;
       end;
    end;
  Close(readenfile);

deutsch := [];

  i := 1;
  Assign(readenfile, 'deutsch.txt');
  reset(readenfile);
  for ii := 1 to 25 do
    begin
     readln(readenfile,cu_name);
     for i := i to 30 do
       begin
          if cu_name = students[i] then
            begin
              deutsch := deutsch + [i];
              break;
            end;
       end;
    end;
  Close(readenfile);

francais := [];

  i := 1;
  Assign(readenfile, 'francais.txt');
  reset(readenfile);
  for ii := 1 to 10 do
    begin
     readln(readenfile,cu_name);
     for i := i to 30 do
       begin
          if cu_name = students[i] then
            begin
              francais := francais + [i];
              break;
            end;
       end;
    end;
  Close(readenfile);

writeln('Все языки знают:');
  for i := 1 to 30 do
    if (i in english*francais*deutsch) then
      writeln(students[i]);


writeln(#10#13'Ни одного языка не знают:');
  for i := 1 to 30 do
    if not(i in english+francais+deutsch) then
      writeln(students[i]);
End.
