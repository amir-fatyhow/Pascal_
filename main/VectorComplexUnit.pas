Unit VectorComplexUnit;

Interface
  Uses Crt, Compl;
  
  const n = 3;
    
  Type VectorComplex = array[1..n] of Complex;
  
  procedure AddVector(a, b: VectorComplex; var c: VectorComplex);
  procedure SubVector(a, b: VectorComplex; var c: VectorComplex);
  procedure ProdVector( a: VectorComplex; var b: VectorComplex);
  function ScalProd(a, b: VectorComplex): Complex;
  function MixProd(a,b,c: VectorComplex): Complex;
  function ModulVector(a:VectorComplex): Real;
  procedure VectorProd(a, b: VectorComplex; var c: VectorComplex);
  procedure InputVector (Var a: VectorComplex);
  procedure OutputVector (b:VectorComplex);
  procedure MenuVectorComplex;
  procedure Wait;
  
implementation 

  procedure OutputVector (b: VectorComplex);
    Var i: integer;
    begin
    writeln('Вывод : ');
     for i:= 1 to n do begin
       write('b.re = ');
       write(b[i].Re);
       write('  ');
       write('b.im = ');
       write(b[i].Im);
       writeln('');
     end;
    end;
  
  procedure InputVector (Var a: VectorComplex);
  var i:integer;
    begin
  writeln('Введите вектор :');
  writeln;
   for i:= 1 to n do begin
     write('a.re = ');
     read(a[i].Re);
     write('a.im = ');
     read(a[i].Im);
     writeln('');
     end;
   end;
    
  procedure AddVector(a, b: VectorComplex; var c: VectorComplex);
    var i:integer;
    begin 
      for i:= 1 to n do
        Add(a[i], b[i], c[i]);
    end;
    
  procedure SubVector(a, b: VectorComplex; var c: VectorComplex);
    var i:integer;
    begin 
      for i:= 1 to n do
        Sub(a[i], b[i], c[i]);
    end;    
    
  procedure ProdVector( a: VectorComplex; var b: VectorComplex);
    var i: integer;l:real;
    begin
      writeln('Введите число');
      readln(l);
      for i:= 1 to n do
        Prod(l, a[i], b[i]);     
    end;
    
  function ScalProd(a, b: VectorComplex): Complex;
    var s, x: Complex;
    i: integer;
    begin
      Zero(s);
      for i:= 1 to n do begin
        Mult(a[i],b[i], x);
        Add(s, x, s);
      end;
      ScalProd := s;
    end;
    
  procedure VectorProd(a, b: VectorComplex; var c: VectorComplex);
  var x,s: Complex;
    begin
      Mult(a[2],b[3], x);Mult(a[3],b[2], s);
      Sub(x,s,c[1]);
      Mult(a[3],b[1], x);Mult(a[1],b[3], s);
      Sub(x,s, c[2]);
      Mult(a[1],b[2], x);Mult(a[2],b[1], s);
      Sub(x,s, c[3]);
    end;
    
   function MixProd(a,b,c:VectorComplex):Complex;
    Var x : VectorComplex;
    begin
      VectorProd(b,c,x);
      MixProd:=ScalProd(a,x);
    end;
    
   function ModulVector(a:VectorComplex):Real;
   Var x : Complex;
    begin
      x:= ScalProd(a,a);
      ModulVector:= Module(x);
    end;
    
   procedure Wait;
    begin
      repeat until KeyPressed;
      while KeyPressed do ReadKey;
    end;
   
  procedure MenuVectorComplex;
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
            var a,b,c: VectorComplex;
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
             var a,b,c: VectorComplex;
                  begin
                    InputVector(a);
                    InputVector(b);
                    SubVector(a, b,c);
                    OutputVector(c);
                  end;
              Wait
            end; 
            
        3:  begin
          clrscr;
              var a,b: VectorComplex;
              begin
                InputVector(a);              
                ProdVector(a, b);
                OutputVector(b);
              end;
              Wait
           end;
            
         4:  begin
          clrscr;
              var a,b: VectorComplex;
              begin
                InputVector(a); 
                InputVector(b);
                Output(ScalProd(a, b));
              end;
              Wait
            end;
            
          5:  begin
          clrscr;
              var a,b,c: VectorComplex;
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
           var a,b,c: VectorComplex;
                    begin
                      InputVector(a);
                      InputVector(b);
                      InputVector(c);
                      Output(MixProd(a,b,c));
                    end;
                Wait
            end;   
            
         7:  begin
          clrscr;
              var a: VectorComplex;
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