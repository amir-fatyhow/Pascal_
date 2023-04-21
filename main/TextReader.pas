Unit TextReader;

Interface
    Uses Crt;
    
    Type Student = record
      Name: String[10];
      Mark: String[3];
    end;
    
    procedure MakeAndAddText;
    procedure MyWrite(stroka: string);
    procedure ViewText;
    procedure BadBoys(exam: byte);
    procedure MenuTextReader;
    procedure Wait;

Implementation
  procedure MakeAndAddText;
    var ch: char;
        Ok: boolean;
        TextName: string[12];
        Name: string[10];
        Mark: string[3];
        StudentText: Text;
  begin
    Ok:= true;
    writeln('Введите имя файла');
    readln(TextName);
    assign(StudentText, TextName);
    
    {$I-}append(StudentText){$I+};    
    if not FileExists(TextName) then
      write('file', TextName,'does not exist');
    
    while Ok do
    begin
      GoToXY(30, 10);
          writeln('Будете ещё вводить? y/n');
          
          GoToXY(30, 11);
          readln(ch);
          
          GoToXY(30, 11);
          write('                       ');
          
          if ch = 'n' then 
          begin
            Ok:= False;
            close(StudentText);
          end
          
          else
          begin
            GoToXY(30, 20);
            writeln('Введите фамилию студента');
            
            GoToXY(30, 21);
            readln(Name);
                        
            GoToXY(30, 22);
            writeln('Введите оценки');
            
            GoToXY(30, 23);
            readln(Mark);
            
            GoToXY(30, 21);
            writeln('                       ');
            
            GoToXY(30, 22);
            writeln('                       ');
            
            GoToXY(30, 23);
            writeln('                       ');
            
            write(StudentText, Name:10, Mark:3);
            end;
    end;
  end;
  
  procedure MyWrite(stroka: string);
    var resalt: string; {result - }
        i, n: byte;
  begin
    resalt:= stroka;
    n:= length(stroka);
    i:= 1;
    while(resalt[i] = ' ') and (i <= n) do i:= i + 1;
    delete(resalt, 1, i - 1);
    writeln(resalt);
  end;       
  
  procedure ViewText;
    var k: byte;
        ch: char;
        TextName: string[12];
        Name: string[10];
        Mark: string[3];
        StudentText: Text;
  begin
    k:= 3;
    writeln('Введите имя файла');
    readln(TextName);
    assign(StudentText, TextName);
    
    {$I-}reset(StudentText){$I+};
    if not FileExists(TextName) then
      write('file', TextName,'does not exist')
    else begin
      while not EOF(StudentText) do
      begin
        k:= k + 1;
        read(StudentText, Name, Mark);
        GoToXY(1, k);
        MyWrite(Name);
        GoToXY(11, k);
        write(Mark);
      end;
    end;
  end;
  
  procedure BadBoys(exam: byte);
  var ch: char;
      k: byte;
      TextName: string[12];
      Name: string[10];
      Mark: string[3];
      StudentText: Text;
  begin
      k:= 3;
      writeln('Введите имя файла');
      readln(TextName);
      
      assign(StudentText, TextName);
      {$I-}reset(StudentText){$I+};
      if not FileExists(TextName) then
        writeln('файл ', TextName, ' не найден')
      else
      begin
        while not EOF(StudentText) do
        begin
          read(StudentText, Name, Mark);
          if Mark[exam] = '2' then
          begin
            k:= k + 1;
            GoToXY(1, k);
            MyWrite(Name);
          end;
        end;
        close(StudentText);
      end;
  end;
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;  
  
  procedure MenuTextReader;
  var Mode, flag: integer;
      Ok, okFlag: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Создать файл');
      writeln('2.Посмотреть файл');
      writeln('3.Добавить файл');
      writeln('4.Вывести список студентов по матану(1)');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      clrscr;
      Case Mode of
        1:  begin
              MakeAndAddText;;
              Write('Нажмите любую клавишу, кроме кнопки выкл!');
            end;   
        2:  begin
              ViewText;
              Wait;
              Write('Нажмите любую клавишу, кроме кнопки выкл!');
            end;
        3:  begin
            MakeAndAddText;
            Write('Нажмите любую клавишу, кроме кнопки выкл!');
          end; 
        4:  begin
            BadBoys(1);
            Wait;
            Write('Нажмите любую клавишу, кроме кнопки выкл!');
          end; 
        0: begin
        Ok:= false;
        clrscr;
        end;
        else
            begin
              clrscr;
              GoToXY(40, 11);
              writeln('Ошибка! Повторите ввод!');
              delay(1000)
            end;
      end;
    end;
  end;
end.