#Календарь юбилейных дат

###Постановка задачи

Требуется создать программу, для заданного года выводящую на экран юбилейные даты трех видов: события, дни рождения, годовщины смерти. Юбилейной считается дата с которой введеная имеет разницу кратную 5.

###Спецификации

####Спецификации ввода:

Программа принимает два файла формата .txt или пользовательский ввод со строками вида *ФИО;дата рождения;дата смерти;описание* и *событие;дата;описание*.Также программа принимает пользовательские имена файлов. Предпочтительная кодировка - *UTF-8*.

По умолчанию файлы с данными лежат в одной папке с программой.

В качестве "текущего" года программа принимет любую разумную в масштабах человеческой истории дату. Для периода до нашей эры используется "-".

####Спецификации вывода:

Программа содержит текстовое меню для работы с входными данными и перехода в режим вывода данных.

Вывод осуществляется на экран и в файл *summary.txt*. При повтороном выводе полученная ранее информация затирается. Данные разбиты на три группы в соответтвии с условиями задачи.

Кодировка - *UTF-8*.

###Комментарий к структуре кода

- Прототип *brain()* объявлен заранее, так как имеются перекресные вызовы функций. Данная процедура сожержит *case* реагирующий на различный пользовательский ввод.
- *main_menu()*, как и следует из названия, выводит главное текстовое меню.
- *ask4year ()* спрашивает год, для которого необходимо вывести информацию и запускает работу *readevent()*, *readperson()* и *print_result()*
- *new_name()* используется для задания пользовательских имен файлов.
- *add_line(file2add)* добавляет текущий файл событий/персоналий новую строку. *file2add* управляет выбором файла.
- *readevent()* и *readperson()* читают файлы с данными и формируют 3 юбилейных массива.
- *writesummary(writemodeTT)* формирует вывод в файл либо на экран (управляется *writemodeTT*).
- *print_result()* дает команды на вывод данных.
