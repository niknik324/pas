Program kalendas;
Uses
  Classes, SysUtils, StrUtils, Crt;
Const
  summary2write = 'summary.txt';
Var
  readenfile: TextFile;
  readenline, persons2read, event2read: string;
  year, counter1, counter2, counter3: integer;
  event2print: array of string;
  born2print: array of string;
  dead2print: array of string;
  switcher: integer;

Procedure brain(); forward;
//  формирование вывода из массива
Procedure printarray (array2printT: array of string; writemodeT: integer);
var
  i: integer;
Begin
  if writemodeT = 0
    then
      begin
        for i := 0 to High(array2printT) do
          writeln(array2printT[i]);
      end
    else
      begin
        for i := 0 to High(array2printT) do
          writeln(readenfile,array2printT[i]);
      end
End;

// формирование итогового вывода
Procedure writesummary (writemodeTT: integer);
Begin
  if writemodeTT = 0
    then
      begin
        writeln('В ', year, ' году отмечается годовщина:'#13#10'=========================================');
        printarray (event2print,writemodeTT);
        writeln(#13#10'В ', year, ' году юбилей у:'#13#10'=========================================');
        printarray (born2print,writemodeTT);
        writeln(#13#10'В ', year, ' году вспоминают:'#13#10'=========================================');
        printarray (dead2print,writemodeTT);
    end
  else
    begin
      writeln(readenfile,'В ', year, ' году отмечается годовщина:'#13#10'=========================================');
      printarray (event2print,writemodeTT);
      writeln(readenfile,#13#10'В ', year, ' году юбилей у:'#13#10'=========================================');
      printarray (born2print,writemodeTT);
      writeln(readenfile,#13#10'В ', year, ' году вспоминают:'#13#10'=========================================');
      printarray (dead2print,writemodeTT);
    end
End;

// вывод на экран и в файл
Procedure print_result ();
begin
  ClrScr();
  writesummary(0);
  Assign(readenfile, summary2write);
  rewrite(readenfile);
  writesummary(1);
  Close(readenfile);
end;

// читаем события из файла
Procedure readevent ();
Begin
  Assign(readenfile, event2read);
  reset(readenfile);
  counter1 := 1;
  while not eof(readenfile) do
  begin
    readln(readenfile, readenline);
    if (year-StrToInt(ExtractWord(2,readenline,[';']))) mod 5 = 0
      then
        begin
          SetLength(event2print,counter1);
          event2print[counter1-1] := readenline;
          counter1 := counter1 + 1;
        end;
  end;
  Close(readenfile);
End;

// читаем персоналии из файла
Procedure readperson ();
Begin
  Assign(readenfile, persons2read);
  reset(readenfile);
  counter2 := 1;
  counter3 := 1;
  while not eof(readenfile) do
  begin
    readln(readenfile, readenline);
    if (year-StrToInt(ExtractWord(2,readenline,[';']))) mod 5 = 0
      then
        begin
          SetLength(born2print,counter2);
          born2print[counter2-1] := readenline;
          counter2 := counter2 + 1;
        end;
    if (year-StrToInt(ExtractWord(3,readenline,[';']))) mod 5 = 0
      then
        begin
          SetLength(dead2print,counter3);
          dead2print[counter3-1] := readenline;
          counter3 := counter3 + 1;
        end;


  end;
  Close(readenfile);
End;

// ввод года
Procedure ask4year ();
begin
  ClrScr();
  writeln('Введите текущий год:');
  Readln(year);
  readevent ();
  readperson ();
  print_result ();
  writeln(#13#10'Что бы вы хотели делать дальше?'#13#10'1 Ввеси новый год'#13#10'2 Назад в главное меню'#13#10'3 Выйти из программы');
  readln(switcher);
  switcher := switcher*10;
  brain();
end;

//меню выбора режима работы
Procedure main_menu ();
begin
  ClrScr();
  writeln('Вас приветствует учебная программа "Каледарь юбилейных дат"');
  writeln('===========================================================');
  writeln('пожалуйста, выберите режим работы:');
  writeln('1 Просмтреть данные для заданного года');
  writeln('2 Задать пользовательские файлы данных');
  writeln('3 Добавить в файл новую строку событий');
  writeln('4 Добавить в файл новую строку персоналий');
  writeln('5 Завершить работу');
  readln(switcher);
  brain();
end;

//пользовательские имена файлов
Procedure new_name();
var
  conf: string;
begin
  ClrScr();
  writeln('Ввелите имя файла событий:');
  readln(event2read);
  writeln('Ввелите имя файла персоналий:');
  readln(persons2read);
  writeln('Вы ввели имена ',event2read,' ',persons2read,' уыерены что хотите их сохранить (y/n)?');
  readln(conf);
  if conf <> 'y'
    then
      begin
        persons2read := 'persons.txt';
        event2read := 'event.txt';
      end;
  brain();
end;

//
Procedure add_line(file2add: string);
var
  line2ad: string;
begin
  ClrScr();
  writeln('Внимание! Проверка правильности ввода отсутствует! Соблюдайте формат:');
  writeln('Для событий: событие;дата;описание');
  writeln('Для персоналий: ФИО;дата рождения;дата смерти;описание');
  readln(line2ad);

  Assign(readenfile, file2add);
  append(readenfile);
  writeln(readenfile,line2ad);
  Close(readenfile);

  writeln('Запись добавлена. Спасибо!');
  readln();
  main_menu();
end;

//мозги меню
Procedure brain();
begin
  case switcher of
    1: ask4year ();
    2: new_name ();
    3: add_line(event2read);
    4: add_line(persons2read);
    5:;
    10: ask4year ();
    20: main_menu();
    30:;
    else
      begin
        ClrScr();
        writeln('Ваш ввод не распознан. Вы будете возвращены в начальное меню. Введите любой симовол.');
        readln();
        main_menu();
      end;
  end;
  ClrScr();
end;

//==============================================================================
Begin
// прдусиановка
  persons2read := 'persons.txt';
  event2read := 'event.txt';
// спрашиваем год
  main_menu ()
End.
