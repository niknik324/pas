Program Flavius;
Uses
  Classes, SysUtils, StrUtils, Crt;
Type
  salor = ^salors;
  salors = Record num : integer; next: salor End;
Var
  start_num: integer;
  salors_status: array of integer;
  first, the_salor, head: salor;

// функция отрислвки человечков
procedure man_sit (i : integer);
begin
  if (salors_status[i*2-1] = 1) and (salors_status[i*2] = 1) then
    begin
      writeln('      |  o  ||  o  |');
      writeln('      | /|\ || /|\ |');
      writeln('      | / \ || / \ |');
    end
  else if (salors_status[i*2-1] <> 1) and (salors_status[i*2] = 1) then
    begin
      writeln('      |     ||  o  |');
      writeln('      |     || /|\ |');
      writeln('      |     || / \ |');
    end
  else if (salors_status[i*2-1] = 1) and (salors_status[i*2] <> 1) then
    begin
      writeln('      |  o  ||     |');
      writeln('      | /|\ ||     |');
      writeln('      | / \ ||     |');
    end
  else if (salors_status[i*2-1] <> 1) and (salors_status[i*2] <> 1) then
    begin
      writeln('      |     ||     |');
      writeln('      |     ||     |');
      writeln('      |     ||     |');
    end
end;

// функция построения корабля
procedure visualize();
var
  i: integer;
begin

  write('            /\     ',#10#13);
  write('           /  \    ',#10#13);
  write('          /    \   ',#10#13);
  write('         /      \   ',#10#13);
  write('        /  схема \  ',#10#13);
  write('       / рассадки \ ',#10#13);
  write('       ------------ ',#10#13);
  for i := 1 to ((length(salors_status)) div 2) do
    begin
      man_sit(i);
      write('      | ');
      if salors_status[i*2-1] = 1 then
        begin
          if i*2-1 < 10 then
            write(' ',i*2-1,'  ||  ')
          else
            write(i*2-1,'  ||  ');
        end
      else
        write('    ||  ');
      if salors_status[i*2] = 1 then
        begin
          if i*2 < 10 then
            write(' ',i*2,' |',#10#13)
          else
            write(i*2,' | ',#10#13);
        end
      else
        write('   |',#10#13);
    end;
      write('       ----------',#10#13);
  end;

// главная функций
procedure read_and_do();
var
  i: integer;
begin
  ClrScr();
  New(the_salor);
  New(head);
  New(first);

  the_salor^.num := 1;
  the_salor^.next := Nil;
  head := the_salor;
  first := the_salor;

  writeln('Number of salors:');
  readln(start_num);
  SetLength(salors_status,start_num+1);
// формирем массив и кольцевой список
  for i := 1 to start_num - 1 do
    begin
      salors_status[i] := 1;

      New(the_salor);
      the_salor^.num := i+1;
      the_salor^.next := Nil;
      head^.next := the_salor;
      head := the_salor;
    end;
  salors_status[start_num] := 1;
  the_salor^.next := first;
  writeln('Схема корабля:');
  visualize();
  writeln('Нажмите Enter для продолжения.');
  readln();
  write(the_salor^.num,' ',the_salor^.next^.num,' ',the_salor^.next^.next^.num,#10#13);

// цикл числу моряков, выкидывающий из кольцевого списка через двоих и зануляющий погибшего в salors_status[]
  for i := 1 to start_num-2 do
    begin
      ClrScr();
      write('На ',i,'-м шаге погибнет моряк № ');
      head := the_salor^.next;
      salors_status[head^.num] := 0;
      the_salor^.next := the_salor^.next^.next;
      the_salor := the_salor^.next^.next;
      write(head^.num,#10#13);
      Dispose(head);
      visualize();
    readln();
    end;
    ClrScr();
    write('Выживут №№ ',the_salor^.num,' и ',the_salor^.next^.num,#10#13);
end;

begin
  read_and_do();
end.
