Program allmenu;
uses VectorComplexUnit,ComplMatr,Compl,VectorUnit,StackLib,QueueLib,StackList,FileReader,Crt,TextReader;

begin
  var Mode: integer;
  var   Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Комплексные числа');
      writeln('2.Комплексная матрица');
      writeln('3.Вектор');
      writeln('4.Комплексный вектор');
      writeln('5.Стэк');
      writeln('6.Очередь');
      writeln('7.Список студентов');
      writeln('8.Файл');
      writeln('9.Текстовый список студентов');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
        
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
          MenuCompl();
        end;
        2:  begin
          clrscr;
          MenuMatrix();
        end;
        3:  begin
          clrscr;
          MenuVector();
        end;
        4:  begin
          clrscr;
          MenuVectorComplex();
        end;
        5:  begin
          clrscr;
          MenuStack();
        end;
        6:  begin
          clrscr;
          MenuQueue();
        end;
        7:  begin
          clrscr;
          MenuStackList();
        end;
        8:  begin
          clrscr;
          MenuFileReader();
        end;
        9:  begin
          clrscr;
          MenuTextReader();
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