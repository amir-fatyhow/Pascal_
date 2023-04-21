Unit StackList;

Interface
  Uses Crt;
  
  Type PtrVertic = ^StackVertic;
      StackVertic = record
        Number: integer;
        Name: string[20];
        Next: PtrVertic;
      end;
      
      PtrHoriz = ^StackHoriz;
      StackHoriz = record
        Number: integer;
        Group: string[20];
        Head: PtrVertic;
        Next: PtrHoriz;
      end;
      
  var Left, Right, Horiz, Temp: PtrHoriz;
      
  procedure MakeMenuHoriz;
  procedure MakeMenuVertic(var Vertic: PtrVertic);
  procedure ChoiceMenuHoriz;
  procedure PutMenuVertic(Vertic: PtrVertic; n: integer);
  procedure AddMenuHoriz;
  procedure MenuStackList;
  procedure Wait;
  
implementation
  procedure MakeMenuVertic(var Vertic: PtrVertic);
  var Top, Right: PtrVertic;
      Ok: boolean;
      NameValue: string[20];
      k: integer;
  begin
      Ok:= True;
      k:= 1;
      
      writeln('Введите фамилию');
      readln(NameValue);
      
      New(Top);
      if NameValue = 'n' then 
      begin
       Ok:= False;
       Top:= Nil;
      end;
      
      Top^.Number:= k;
      Top^.Name:= NameValue;
      
      Vertic:= Top;
      Right:= Top;
      
      while Ok do
      begin
        k:= k + 1;
        writeln('Введите фамилию');
        readln(NameValue);
        if NameValue = 'n' then 
        begin
          Ok:= False;
          Right^.Next:= Nil;
        end
        
        else
          begin
          New(Top);
          Right^.Next:= Top;
          
          Top^.Number:= k;
          Top^.Name:= NameValue;
          
          Right:= Top;
          end;        
      end;
  end;      

  procedure MakeMenuHoriz;
  var Vertic: PtrVertic;
      GroupValue: string[10];
      Ok: boolean;
      k: integer;
  begin
    Ok:= True;
    k:= 1;
    
    writeln('Введите название группы');
    readln(GroupValue);
    New(Horiz);
    
    if GroupValue = 'n' then
    begin
      Ok:= false;
      Horiz^.Next:= Nil;
    end; 
    
    Horiz^.Group:= GroupValue;
    Horiz^.Number:= k;
    
    MakeMenuVertic(Vertic);
    Horiz^.Head:= Vertic;
    
    Right:= Horiz;
    Left:= Horiz;
    
    while Ok do 
    begin 
      k:= k + 1;
      writeln('Введите название группы');
      readln(GroupValue); 
      if GroupValue = 'n' then
        begin
          Ok:= false;
          Horiz^.Next:= Nil;
        end
      else 
        begin
        New(Horiz);
        Right^.Next:= Horiz;
        
        Horiz^.Number:= k;        
        Horiz^.Group:= GroupValue;
        MakeMenuVertic(Vertic);
        Horiz^.Head:= Vertic;
        
        Right:= Horiz;
        end;                     
    end;
  end;
  
  procedure AddMenuHoriz;
  var Top: PtrHoriz;
      Vertic: PtrVertic;
      GroupValue: string[10];
      Ok: boolean;
      k: integer;
  begin
      
    while Ok do 
    begin 
      k:= k + 1;
      writeln('Введите название группы');
      readln(GroupValue); 
      New(Horiz);
      if GroupValue = 'n' then
        begin
          Ok:= false;
          Horiz^.Next:= Nil;
        end
      else 
        begin
        
        Right^.Next:= Horiz;
        
        Horiz^.Number:= k;        
        Horiz^.Group:= GroupValue;
        MakeMenuVertic(Vertic);
        Horiz^.Head:= Vertic;
        
        Right:= Horiz;
        end;                     
    end;
    
  end;
  
  procedure PutMenuVertic(Vertic: PtrVertic; n: integer);
  var Top: PtrVertic;
      PozX, PozY: integer;
  begin
    PozY:= 2; PozX:= 12*n-7;
    Top:= Vertic;
    while Top<>Nil do
    begin
      PozY:= PozY +1;
      GoToXY(PozX, PozY);
      
      write(Top^.Number);
      write(' ');
      writeln(Top^.Name);
      Top:= Top^.Next;
    end;
  end;      
  
  procedure ChoiceMenuHoriz;
  var n: integer;
      Top: PtrHoriz;
      Ok, once: boolean;
      t: string;
  begin
    Ok:= True;
    once:= True;
    while Ok do
      begin
          Temp:= Left;
          n:= 0;
          GoToXY(1,1);
          
          while Temp<> Nil do
          begin
            n:= n + 1;
           write(Temp^.Number: 5, '.', Temp^.Group: 6);
            
            Temp:= Temp^.Next;
          end; 
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          writeln;
          GoToXY(90,90);
          write('Выберите пункт меню: ');
          GoToXY(90,92);
          read(n); {Выход 999}
          if n = 999 then Ok:= false
          else begin
            Top:= Left;
          
         
            while(Top^.Number<>n) do Top:= Top^.Next;
            PutMenuVertic(Top^.Head, n); 
          end;
    
      end;
    
  end;
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure MenuStackList;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Создать группу');
      writeln('2.Посмотреть группы');
      //writeln('3.Добавить горизонтальное меню');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
              MakeMenuHoriz;
              Write('Нажмите любую клавишу, кроме кнопки выкл!');
              //Wait
            end;   
        2:  begin
          clrscr;
            ChoiceMenuHoriz;
            end; 
        //3:  begin
        //  clrscr;
        //      AddMenuHoriz;
        //      Wait
        //    end;           
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
  