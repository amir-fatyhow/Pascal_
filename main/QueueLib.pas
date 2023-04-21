Unit QueueLib;

Interface

  Uses crt, StackLib;
  Type PtrQ = ^Queu;
     Queu = record
       Inf: integer;
       Next: PtrQ;
     end; 
  var Left, Right, TopQ, TempQ: PtrQ;    
 
 
procedure MakeQueue; 
procedure addElementInQueue;
procedure makeStackFromQueue; 
procedure printElements; 
procedure MenuQueue;


Implementation

  
  procedure MakeQueue;
  var Ok: boolean; 
      Value1: integer;
  begin     
        Ok:= True;
        write('Введите число: ');
        readln(Value1);
        New(TopQ);
        if Value1 = 999 then
        begin
          Ok:= false;
          TopQ^.Next:= Nil;
        end;
        TopQ^.Inf := Value1;
        Right:= TopQ;
        Left:= TopQ;
        
        while Ok do
        begin
          write('Введите число: ');
          readln(Value1);
          if Value1 = 999 then 
          begin
            Ok:= false;
            TopQ^.Next:= Nil;
          end
          else
          begin
            New(TopQ);
            Right^.Next:= TopQ;
            TopQ^.Inf:= Value1;
            Right:= TopQ;
          end;
        end;
  end;
  
  procedure addElementInQueue; 
  var Value1: integer;
  begin
    write('Введите число: ');
    readln(Value1);
    New(TopQ);
    Right^.Next:= TopQ;
    TopQ^.Inf:= Value1;
    Right:= TopQ;
  end;
  
  procedure makeStackFromQueue;
  var KonQ: PtrQ;
  {!!!!!!!!!!}
  begin
  Top := nil;
  KonQ := Left;
  while KonQ <> nil do
    begin
      New(Kom);
        Kom^.Next := Top;
        Kom^.Inf := KonQ^.Inf;
        Top := Kom;
        KonQ := KonQ^.Next;
    end;
  end;
  
  procedure printElements;
  begin
    TempQ:= Left;
    while TempQ^.Next<>Nil do
      begin
        writeln(TempQ^.Inf);
        TempQ:= TempQ^.Next;
      end;
   writeln(TempQ^.Inf);   
  end;

  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure MenuQueue;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Создать очередь');
      writeln('2.Добавить элемент в очередь');
      writeln('3.Вывести элементы очереди');
      writeln('4.Сделать из очереди стэк');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
              MakeQueue;
              Writeln('Нажмите любую клавишу, кроме кнопки выкл!');
              Wait
            end;
        2:  begin
          clrscr;
              addElementInQueue; 
              Writeln('Нажмите любую клавишу, кроме кнопки выкл!');
              Wait
            end; 
        3:  begin
          clrscr;
              printElements;  
              Wait
            end;
        4:  begin
          clrscr;
              makeStackFromQueue; 
              Writeln('Нажмите любую клавишу, кроме кнопки выкл!');
              Wait
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