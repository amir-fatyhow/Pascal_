Unit StacKLib;

Interface
  Uses crt;
  Type Ptr = ^Stac;
      Stac = record
          Inf: integer; {Information}
          Next: Ptr;
  end; 
  var Top, Kom, Temp: Ptr;
  
procedure MakeStack;
procedure ViewStack;
procedure ReverseStack;
procedure ConcatTwoStack;
procedure MenuStack;

implementation
  procedure MakeStack;
    var Ok: boolean;
      value1: integer;
      begin
        Ok:= True; Top:= Nil;
        while Ok do
        begin
          write('Введите число: ');
          readln(Value1);
          if value1 = 999 then Ok:= false
          else 
          begin
            New(Kom);
            Kom^.Next:= Top;
            Kom^.Inf:= value1;
            Top:= Kom;
          end;
        end;
      end;
       
  procedure ReverseStack;
    var Value1: integer;
    Top1, Kom1: Ptr;
    Ok: boolean;
  begin          
      New(Top1);
      Top1^.Inf := Top^.Inf;
      Top1^.Next := Nil;
      Kom1:= Top1;
            
      Top:= Top^.Next;
      
      while Top<>Nil do
      begin  
        New(Top1);
        Top1^.Inf := Top^.Inf;
        Top1^.Next := Kom1;
        Kom1:= Top1;
              
        Top:= Top^.Next; 
      end;
      Kom1:= Top1;
      
      Top := Kom1;
      Kom := Kom1;
  end;
  
  procedure ConcatTwoStack;
    var value1: integer;
    Ok: boolean;
   
    begin      
    Temp:= Top;
    MakeStack;
    while Top^.Next<>Nil do
    begin
      Top:= Top^.Next;
    end;
    Top^.Next:= Temp;
    {writeln(Temp^.Inf);}
    Temp:= Kom;
    Top := Kom;
  end;
  
  procedure ViewStack;
  begin
    writeln('Вывод стэка:');
    while Kom<>Nil do
    begin
      writeln(Kom^.Inf);
      Kom:= Kom^.Next;
    end;
  end;
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure MenuStack;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Создать стэк');
      writeln('2.Перевернуть стэк');
      writeln('3.Соединить два стэка');
      writeln('4.Посмотреть стэк');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
              MakeStack;
              Wait
            end;   
        2:  begin
          clrscr;
              ReverseStack;
              Writeln('Стэк перевернут');
              Write('Нажмите любую клавишу, кроме кнопки выкл!');
              Wait
            end; 
        3: begin
          clrscr;
            ConcatTwoStack;
            Writeln('Два стэка соединены');
            Write('Нажмите любую клавишу, кроме кнопки выкл!');
            Wait      
        end; 
        4: begin
          clrscr;
            ViewStack;
            Wait;
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