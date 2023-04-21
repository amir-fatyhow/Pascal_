Unit FileReader;

Interface
  Uses Crt;
  
  Type Student = record
    Name: String[10];
    Mark: String[3];
  end;
  
  procedure MakeFile;
  procedure ViewFile;
  procedure ViewFileByFirstMark;
  procedure ViewFileBySecondMark;
  procedure ViewFileByThirdMark;
  procedure AddFile;
  procedure MenuFileReader;
  procedure Wait;
  
implementation
  procedure MakeFile;
  var ch: char;
      Ok: boolean;
      FileName: String[12];
      StudentFile: file of Student;
      HowStudent: Student;
  begin
      Ok:= True;
      writeln('Введите имя файла');
      readln(FileName);
      assign(StudentFile, FileName);
      rewrite(StudentFile);
      
      with HowStudent do
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
            close(StudentFile);
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
            
            write(StudentFile, HowStudent);
          end;
        end;
  end; 
  
  procedure ViewFile;
  var k: integer;
      ch: char;
      FileName: String[12];
      StudentFile: file of Student;
      HowStudent: Student;
  begin
    k:= 10;
    writeln('Введите имя файла');
    readln(FileName);
    
    assign(StudentFile, FileName);
    reset(StudentFile);
    
    with HowStudent do
      while not EOF(StudentFile) do
      begin
        k:= k + 1;
        read(StudentFile, HowStudent);
        GoToXY(1, k);
        write(Name);
        
        GoToXY(11, k);
        write(Mark);
      end;
      close(StudentFile);
  end; 
  
  procedure ViewFileByFirstMark;
  var k: integer;
      markP: String[1];
      ch: char;
      FileName: String[12];
      StudentFile: file of Student;
      HowStudent: Student;
  begin
    k:= 13;
    writeln('Введите имя файла');
    readln(FileName);
    
    writeln('Введите первую оценку');
    readln(markP);
    
    assign(StudentFile, FileName);
    reset(StudentFile);
    
    with HowStudent do
      while not EOF(StudentFile) do
      begin
        k:= k + 1;
        read(StudentFile, HowStudent);
        if Mark[1] = markP[1] then 
        begin
          GoToXY(1, k);
          write(Name);
        
          GoToXY(11, k);
          write(Mark);
        end;
      end;
      close(StudentFile);
  end;
  
  procedure ViewFileBySecondMark;
  var k: integer;
      markP: String[1];
      ch: char;
      FileName: String[12];
      StudentFile: file of Student;
      HowStudent: Student;
  begin
    k:= 13;
    writeln('Введите имя файла');
    readln(FileName);
    
    writeln('Введите вторую оценку');
    readln(markP);
    
    assign(StudentFile, FileName);
    reset(StudentFile);
    
    with HowStudent do
      while not EOF(StudentFile) do
      begin
        k:= k + 1;
        read(StudentFile, HowStudent);
        if Mark[2] = markP[1] then 
        begin
          GoToXY(1, k);
          write(Name);
        
          GoToXY(11, k);
          write(Mark);
        end;
      end;
      close(StudentFile);
  end;
  
  procedure ViewFileByThirdMark;
  var k: integer;
      markP: String[1];
      ch: char;
      FileName: String[12];
      StudentFile: file of Student;
      HowStudent: Student;
  begin
    k:= 13;
    writeln('Введите имя файла');
    readln(FileName);
    
    writeln('Введите третью оценку');
    readln(markP);
    
    assign(StudentFile, FileName);
    reset(StudentFile);
    
    with HowStudent do
      while not EOF(StudentFile) do
      begin
        k:= k + 1;
        read(StudentFile, HowStudent);
        if Mark[3] = markP[1] then 
        begin
          GoToXY(1, k);
          write(Name);
        
          GoToXY(11, k);
          write(Mark);
        end;
      end;
      close(StudentFile);
  end;
  
  procedure AddFile;
  var ch: char;
      Ok: boolean;
      NewName, FileName: String[20];
      NewFile, StudentFile: file of Student;
      HowStudent: Student;
      begin
        Ok:= True;
        writeln('Введите имя файла');
        readln(FileName);
        assign(StudentFile, FileName);
        
        reset(StudentFile);
        NewName:= 'aaa';
        assign(NewFile, NewName);
        rewrite(NewFile);
        
        while not EOF(StudentFile) do
        begin
          read(StudentFile, HowStudent);
          write(NewFile, HowStudent);
        end;
        
        with HowStudent do
          while Ok do
          begin
            GoToXY(30, 20);
            writeln('Будете ещё вводить? y/n');
            
            GoToXY(30, 21);
            readln(ch);
            
            GoToXY(30, 21);
            write('                       ');
            
            if ch = 'n' then
            begin
              Ok:= False;
              close(NewFile);
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
            
            write(NewFile, HowStudent);
            end;
          end;
          close(StudentFile);
          erase(StudentFile);
          rename(NewFile, FileName);
      end;
      
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;  
  
  procedure MenuFileReader;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Создать файл');
      writeln('2.Посмотреть файл');
      writeln('3.Добавить файл');
      writeln('4.Вывести список студентов по первой оценке');
      writeln('5.Вывести список студентов по второй оценке');
      writeln('6.Вывести список студентов по третьей оценке');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
              MakeFile;
              Write('Нажмите любую клавишу, кроме кнопки выкл!');
            end;   
        2:  begin
              ViewFile;
              Wait;
              Write('Нажмите любую клавишу, кроме кнопки выкл!');
            end;
        3:  begin
            AddFile;
            Write('Нажмите любую клавишу, кроме кнопки выкл!');
          end; 
        4:  begin
            ViewFileByFirstMark;
            Wait;
            Write('Нажмите любую клавишу, кроме кнопки выкл!');
          end;
        5:  begin
            ViewFileBySecondMark;
            Wait;
            Write('Нажмите любую клавишу, кроме кнопки выкл!');
          end; 
       6:  begin
            ViewFileByThirdMark;
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
  