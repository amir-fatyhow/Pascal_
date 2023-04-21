Unit ComplMatr;

Interface
  Uses Crt, Compl;
  
  const n = 2;
  const eps = 0.001;
 
  Type Matrix = array[1..n, 1..n] of Complex;
  
  procedure AddMatrix(a, b: Matrix; var c: Matrix);
  procedure ProdMatrix(alpha: real; a: Matrix; var b: Matrix);
  procedure MultMatrix(a, b: Matrix; var c: Matrix);
  procedure OneMatrix(var e: Matrix);
  procedure ZeroMatrix(var e: Matrix);
  function NormMatrix(var e: Matrix) : real;
  procedure ExpMatrix(a: Matrix; var b: Matrix);
  procedure MenuMatrix();

implementation  

  procedure AddMatrix(a, b: Matrix; var c: Matrix);
    var i, j: integer;
    begin
      for i := 1 to n do
        for j := 1 to n do
          Add(a[i,j], b[i,j], c[i,j]);
    end;
    
  procedure ProdMatrix(alpha: real; a: Matrix; var b: Matrix);
    var i, j: integer;
    begin
    for i := 1 to n do
      for j := 1 to n do
        Prod(alpha, a[i,j], b[i,j]);
    end;
  
  procedure MultMatrix(a, b: Matrix; var c: Matrix);
  var i, j, k: integer;
  p, s: Complex;
  begin
    for i := 1 to n do
      for j := 1 to n do
      begin
        Zero(s);
        for k := 1 to n do
        begin
          Mult(a[i,k], b[k,j], p);
          Add(s, p, s);
        end;
        c[i,j] := s;
      end;        
  end;
  
  procedure OneMatrix(var e: Matrix);
  var i, j: integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        Zero(e[i,j]);
      
    for i := 1 to n do
    One(e[i,i]);
  end;
  
  procedure ZeroMatrix(var e: Matrix);
  var i, j: integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        Zero(e[i,j]);
  end;
  
  function NormMatrix(var e: Matrix) : real;
  var i, j: integer;
  z, s : real;
  begin
    for i := 1 to n do
    begin
      s := 0;
      for j := 1 to n do
        s := s + Module(e[i,j]);
          
      if s > z then z := s;       
    end;
    NormMatrix := z;
  end;
  
  procedure ExpMatrix(a: Matrix; var b: Matrix);
  const eps = 0.001;
  var k : integer;
  p : Matrix;
  begin
    OneMatrix(p);
    OneMatrix(b);
    k := 0;
    while NormMatrix(p) >= eps do
    begin
      k := k + 1;
      MultMatrix(p, a, p);
      ProdMatrix(1 / k, p, p);
      AddMatrix(b, p, b);
    end;
  end;
  
  procedure MenuMatrix;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Сложение матриц');
      writeln('2.Умножение матрицы на число');
      writeln('3.Умножение двух матриц');
      writeln('4.Матрица заполненная единицами по главной диагонали');
      writeln('5.Матрица заполненная нулями');
      writeln('6.Нормаль матрицы');
      writeln('7.Экспонента матрицы');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
          var i, j: integer;
          var a, b, c: Matrix;
              for i := 1 to n do
                for j := 1 to n do
                begin
                  Writeln('a[' + i + ',' + j + ']');
                  Input(a[i,j]);
                  Writeln();
                end; 
      
              for i := 1 to n do
                  for j := 1 to n do
                  begin
                    Writeln('b[' + i + ',' + j + ']');
                    Input(b[i,j]);
                    Writeln();
                  end;
      
              AddMatrix(a, b , c);  
            
              Output(a[1,1]);Write('  ');
              
              Output(a[1,2]);Write('  ');
              
              Write('+');Write('  ');
              
              Output(b[1,1]);Write('  ');
              
              Output(b[1,2]);Write('  ');
              
              Write('=');Write('  ');
              
              Output(c[1,1]);Write('  ');
              
              Output(c[1,2]);Writeln('');
              
              Output(a[2,1]);Write('  ');
              
              Output(a[2,2]);Write('  ');
              
              Write(' ');Write('  ');
              
              Output(b[2,1]);Write('  ');
              
              Output(b[2,2]);Write('  ');
              
              Write(' ');Write('  ');
              
              Output(c[1,1]);Write('  ');
              
              Output(c[2,2]);
              
              Wait
            end;
            
        2:  begin
          clrscr;
          var i, j: integer;
          var a, b: Matrix;
          var alpha: real;
              Write('alpha = ');
              read(alpha);
  
              for i := 1 to n do
                  for j := 1 to n do
                  begin
                    Writeln('a[' + i + ',' + j + ']');
                    Input(a[i,j]);
                    Writeln();
                  end; 
      
              ProdMatrix(alpha, a , b);  
  
              Output(a[1,1]);Write('  ');
              
              Output(a[1,2]);Write('  ');
              
              Write('*');Write('  ');
              
              Write(alpha);Write(' = ');Output(b[1,1]);Write('  ');
              
              Output(b[1,2]);Writeln('');
              
              Output(a[2,1]);Write('  ');
              
              Output(a[2,2]);Write('         ');
              
              Output(b[2,1]);Write('  ');
              
              Output(b[2,2]);Write('  ');
              
              Wait
            end; 
            
        3:  begin
          clrscr;
              var a, b, c: Matrix;
              var i, j, k: integer;
              var p, s: Complex;
              for i := 1 to n do
                for j := 1 to n do
                begin
                  Writeln('a[' + i + ',' + j + ']');
                  Input(a[i,j]);
                  Writeln();
                end; 
      
                for i := 1 to n do
                    for j := 1 to n do
                    begin
                      Writeln('b[' + i + ',' + j + ']');
                      Input(b[i,j]);
                      Writeln();
                    end; 
                MultMatrix(a, b, c);  
  
                 Output(a[1,1]);Write('  ');
              
              Output(a[1,2]);Write('  ');
              
              Write('*');Write('  ');
              
              Output(b[1,1]);Write('  ');
              
              Output(b[1,2]);Write('  ');
              
              Write('=');Write('  ');
              
              Output(c[1,1]);Write('  ');
              
              Output(c[1,2]);Writeln('');
              
              Output(a[2,1]);Write('  ');
              
              Output(a[2,2]);Write('  ');
              
              Write(' ');Write('  ');
              
              Output(b[2,1]);Write('  ');
              
              Output(b[2,2]);Write('  ');
              
              Write(' ');Write('  ');
              
              Output(c[1,1]);Write('  ');
              
              Output(c[2,2]);
              Wait
            end;
            
         4:  begin
          clrscr;
              var i, j: integer;
              var e: Matrix;
              OneMatrix(e);  
  
              for i := 1 to n do
                begin
                  for j := 1 to n do
                  begin
                    
                    if i = j then textcolor (green)
                    else textcolor (white);
                    
                    Output(e[i,j]);
                    Write('  ');
                  end;
                  Writeln();
                end;
              textcolor (white);
              Wait
            end;
            
          5:  begin
          clrscr;
              var e: Matrix;
              var i, j: integer;
              ZeroMatrix(e);  
  
              for i := 1 to n do
                begin
                  for j := 1 to n do
                  begin
                    Output(e[i,j]);
                    Write('  ');
                  end;
                  Writeln();
                end;
              Wait
            end;
            
         6:  begin
          clrscr;
         var i, j: integer;
         var e: Matrix; 
            for i := 1 to n do
              for j := 1 to n do
              begin
                Writeln('e[' + i + ',' + j + ']');
                Input(e[i,j]);
                Writeln();
              end; 
  
           for i := 1 to n do
                begin
                  for j := 1 to n do
                  begin
                    Output(e[i,j]);
                    Write('  ');
                  end;
                  Writeln();
                end;
           Writeln();    
           Writeln('Normal = ' + NormMatrix(e)); 
                Wait
            end;   
            
         7:  begin
          clrscr;
              var a, b : Matrix;
              var k, i, j : integer;
              var p : Matrix;
              for i := 1 to n do
                for j := 1 to n do
                begin
                  Writeln('a[' + i + ',' + j + ']');
                  Input(a[i,j]);
                  Writeln();
                end; 
  
                ExpMatrix(a, b);
  
                for i := 1 to n do
                  begin
                    for j := 1 to n do
                    begin
                      Output(b[i,j]);
                      Write('  ');
                    end;
                    Writeln();
                   
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