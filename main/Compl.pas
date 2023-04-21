Unit Compl;

Interface
  Uses Crt;
  Type Complex = record
    Re, Im: real
  end;
  
  procedure Add(u, v: Complex; var w: Complex);
  procedure Sub(u, v: Complex; var w: Complex);
  procedure Mult(u, v: Complex; var w: Complex);
  procedure Inv(z: Complex; var w: Complex);
  procedure Diviz(u, v: Complex; var w: Complex);
  procedure Prod(a: real; z: Complex; var w: Complex);
  procedure Zero(var z: Complex);
  procedure One(var z: Complex);
  function Module(var z: Complex): real;
  procedure ExpC(z: Complex; var s: Complex);
  procedure SinC(z: Complex; var s: Complex);
  procedure CosC(z: Complex; var s: Complex);
  procedure Input(var z: Complex);
  procedure Output(w: Complex);
  procedure MenuCompl;
  procedure Wait;

implementation

  procedure Add(u, v: Complex; var w: Complex);
    begin
      w.Re := u.Re + v.Re;
      w.Im := u.Im + v.Im;
    end;
    
   procedure Sub(u, v: Complex; var w: Complex);
    begin
      w.Re := u.Re - v.Re;
      w.Im := u.Im - v.Im;
    end;      
    
  procedure Mult(u, v: Complex; var w: Complex);
    begin
      w.Re := u.Re * v.Re - u.Im * v.Im;
      w.Im := u.Re * v.Im + u.Im * v.Re;
    end;
    
  procedure Inv(z: Complex; var w: Complex);
    var q: real;
    begin
      q:= sqr(z.Re) + sqr(z.Im);
      w.Re := z.Re / q;
      w.Im := -z.Im / q;
    end;
    
  procedure Diviz(u, v: Complex; var w: Complex);
    var z: Complex;
    begin
      Inv(v, z);
      Mult(u, z, w);
    end; 
    
  procedure Prod(a: real; z: Complex; var w: Complex);
  begin
    w.Re := z.Re * a;
    w.Im := z.Im * a;
  end;    
  
  procedure Zero(var z: Complex);
  begin
    z.Re := 0;
    z.Im := 0;
  end;
  
  procedure One(var z: Complex);
  begin
    z.Re := 1;
    z.Im := 0;
  end;
  
  function Module(var z: Complex): real;
  begin
    Module:= sqrt(sqr(z.Re) + sqr(z.Im)); 
  end;
  
  procedure Input(var z: Complex);
  begin
    Writeln('Введите вещественную часть:');
    Write('z.Re = ');read(z.Re);
    Writeln('Введите мнимую часть:');
    Write('z.Im = ');read(z.Im);
  end;
  
  procedure Output(w: Complex);
  begin
    Write(w.Re + ' ' + '+ ' + w.Im + 'i' );
  end; 
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure ExpC(z: Complex; var s: Complex);
  const eps = 0.001;
  var k: integer;
      p: Complex;
      
  begin
    k:= 0; One(p);
    One(s);
    while Module(p) >= eps do
    begin
      k := k + 1;
      Mult(p, z, p);
      Prod(1/k, p, p);
      Add(s, p, s);
    end;
  end; 
      
  procedure SinC(z: Complex; var s: Complex);
  const eps = 0.001;
  var k: integer;
      p, z2: Complex;
      
  begin
    k:= 0; One(p);
    One(s);
    Mult(z, z, z2);
    
    while Module(p) >= eps do
    begin
      k := k + 2;
      Mult(p, z2, p);
      Prod(-1/ k / (k - 1), p, p);
      Add(s, p, s);
    end;
  end;
      
  procedure CosC(z: Complex; var s: Complex);
  const eps = 0.001;
  var k: integer;
      p, z2: Complex;
      
  begin
    k:= 0; One(p);
    One(s);
    Mult(z, z, z2);
    
    while Module(p) >= eps do
    begin
      k := k + 1;
      Mult(p, z2, p);
      Prod(-1 / (2 * k) / (2 * k + 1), p, p);
      Add(s, p, s);
    end;
  end;  
  
  procedure MenuCompl;
  var Mode: integer;
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('1.Сложение комплексных чисел');
      writeln('2.Умножение комплексных чисел');
      writeln('3.Инверсия(1 / z)');
      writeln('4.Деление комплексных чисел');
      writeln('5.Комплексный ноль');
      writeln('6.Комплексная единица');
      writeln('7.Комплексный модуль');
      writeln('8.Умножение комплексного числа на вещественное');
      writeln('9.Комплексная экспонента');
      writeln('10.Комплексный косинус');
      writeln('11.Комплексный синус');
      writeln('0.Выход');
      GoToXY(0, 15);
      Write('Пункт номер: ');
      readln(Mode);
      GoToXY(0, 15);
      Case Mode of
        1:  begin
          clrscr;
              var u, v, w: Complex;
              Input(u);
              Input(v);
              Add(u, v, w);
              Output(w);
              Wait
            end;
        2:  begin
          clrscr;
              var u, v, w: Complex;
              Input(u);
              Input(v);
              Mult(u, v, w);
              Output(w);
              Wait
            end; 
        3:  begin
          clrscr;
              var z, w: Complex;
              Input(z);
              Inv(z, w);
              Output(w);
              Wait
            end;
        4:  begin
          clrscr;
              var u, v, w: Complex;
              Input(u);
              Input(v);
              Diviz(u, v, w);
              OutPut(w);
              Wait
            end;
        5:  begin
          clrscr;
              var z: Complex;
              Zero(z);
              Output(z);
              Wait
            end;
        6:  begin
          clrscr;
              var z: Complex;
              One(z);
              Output(z);
              Wait
            end;
        7:  begin
          clrscr;
              var z: Complex;
              Input(z);
              writeln('Modul = ',Module(z));
              Wait
            end;
        8:  begin
          clrscr;
              var z, w: Complex;
              var a: real;
              write('Введите вещественное число: ');
              read(a);
              Input(z);
              Prod(a, z, w);
              Output(w);
              Wait
            end;
        9:  begin
          clrscr;
              var z: Complex;
              Input(z);
              ExpC(z, z);
              Output(z);         
              Wait
            end;
        10:  begin
          clrscr;
              var z, w: Complex;
              Input(z);
              CosC(z, w);
              Output(w);
              Wait
            end;
        11:  begin
          clrscr;
              var z, w: Complex;
              Input(z);
              SinC(z, w);
              Output(w);
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