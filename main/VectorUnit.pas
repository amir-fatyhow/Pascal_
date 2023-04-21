Unit VectorUnit;

Interface
  Uses Crt;
  
  const n = 3;
  
  Type Vector = array[1..n] of real;
  
  procedure AddVector(a, b: Vector; var c: Vector);
  procedure SubVector(a, b: Vector; var c: Vector);
  procedure ProdVector( a: Vector; var b: Vector);
  function ScalProd(a, b: Vector): real;
  function MixProd(a,b,c:Vector):real;
  function ModulVector(a:Vector):real;
  procedure VectorProd(a, b: Vector; var c: Vector);
  procedure InputVector (Var a: Vector);
  procedure OutputVector (b:Vector);
  procedure MenuVector;
  procedure Wait;
  
implementation 

  procedure OutputVector (b:Vector);
    Var i: integer;
    begin
    writeln('Вывод : ');
     for i:= 1 to n do begin
       write(b[i],'  ');
     end;
    end;
  
  procedure InputVector (Var a: Vector);
  var i:integer;
    begin
  writeln('Введите вектор :');
  writeln;
   for i:= 1 to n do begin
     read(a[i]);
     end;
   end;
    
  procedure AddVector(a, b: Vector; var c: Vector);
    var i:integer;
    begin 
      for i:= 1 to n do
        c[i] := a[i] + b[i]
    end;
    
  procedure SubVector(a, b: Vector; var c: Vector);
    var i:integer;
    begin 
      for i:= 1 to n do
        c[i] := a[i] - b[i]
    end;    
    
  procedure ProdVector( a: Vector; var b: Vector);
    var i: integer;l:real;
    begin
      writeln('Введите число');
      readln(l);
      for i:= 1 to n do
        b[i]:= l * a[i];
    end;
    
  function ScalProd(a, b: Vector): real;
    var s: real;
    i: integer;
    begin
      s:= 0;
      for i:= 1 to n do
        s:= s + a[i] * b[i];
      
      ScalProd := s;
    end;
    
  procedure VectorProd(a, b: Vector; var c: Vector);
    begin
      c[1]:= a[2] * b[3] - a[3] * b[2];
      c[2]:= a[3] * b[1] - a[1] * b[3];
      c[3]:= a[1] * b[2] - a[2] * b[1];
    end;
    
   function MixProd(a,b,c:Vector):real;
    Var x : Vector;
    begin
      VectorProd(b,c,x);
      MixProd:=ScalProd(a,x);
    end;
    
   function ModulVector(a:Vector):real;
    begin
      ModulVector:= sqrt(ScalProd(a,a));
    end;
    
   procedure Wait;
    begin
      repeat until KeyPressed;
      while KeyPressed do ReadKey;
    end;
   
  procedure MenuVector;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Сложение векторов');
      writeln('2.Разность');
      writeln('3.Умножение вектора на число');
      writeln('4. Скалярное пр-ие двух векторов');
      writeln('5.Векторное произведение');
      writeln('6.Смешанное произведение');
      writeln('7.Модуль');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
            var a,b,c: Vector;
              begin
                InputVector(a);
                InputVector(b);
                AddVector(a, b,c);
                OutputVector(c);
              end;
              Wait
            end;
            
        2:  begin
          clrscr;
             var a,b,c: Vector;
                  begin
                    InputVector(a);
                    InputVector(b);
                    AddVector(a, b,c);
                    OutputVector(c);
                  end;
              Wait
            end; 
            
        3:  begin
          clrscr;
              var a,b: Vector;
              begin
                InputVector(a);              
                ProdVector(a, b);
                OutputVector(b);
              end;
              Wait
           end;
            
         4:  begin
          clrscr;
              var a,b: Vector;
              begin
                InputVector(a); 
                InputVector(b);        
                writeln('Ответ ' + ScalProd(a, b));
              end;
              Wait
            end;
            
          5:  begin
          clrscr;
              var a,b,c: Vector;
              begin
                InputVector(a);
                InputVector(b);
                VectorProd(a, b,c);
                OutputVector(c);
              end;
              Wait
            end;
            
         6:  begin
          clrscr;
           var a,b,c: Vector;
                    begin
                      InputVector(a);
                      InputVector(b);
                      InputVector(c);
                      writeln('Ответ ',MixProd(a,b,c));
                    end;
                Wait
            end;   
            
         7:  begin
          clrscr;
              var a: Vector;
                  begin
                    InputVector(a);
                    writeln('Ответ ',ModulVector(a));
                  end;
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