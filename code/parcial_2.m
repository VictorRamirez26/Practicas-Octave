function parcial_2
  clc
  x = [0.2 0.4 0.6 0.8 1.0];
  y = [46.36 55.86 58.9 60.42 61.56];
  h = x(2)- x(1);

    %Calcular las derivadas primeras en los puntos
  for i=1:length(x)
    if i==1
      fs(i) = 1/(2*h) * ((-3*y(i)) + (4*y(i+1))-(1*y(i+2)));
    elseif i == length(x)
      fs(i) = 1/(2*h) * ((3*y(i)) - (4*y(i-1))+(1*y(i-2)));
    else
      fs(i) = 1/(2*h) * (y(i+1)-y(i-1));
    endif

  endfor
  fs
  %Calcular la integral con trapecios multiples

  y0 = y(1);
  yn = y(length(y));
  sum = 0;
  sum2 = 0;
  h2 = 0.4;
  for i=2:length(x)-1
    sum = sum + (2*y(i));
  endfor

  for i=3:2:length(x)-1 %Calculo con el doble del menor paso
    sum2 = sum2 + (2*y(i));
  endfor

  result1 = (h/2)*(y0 + sum + yn)
  result2 = (h2/2)*(y0 + sum2 + yn)

  %Richardson
  B = (h/h2)^2;
  I = ((B*result2) - result1)/(B-1)

  %Simpson multiples
  par = 0;
  impar = 0;

  for i=2:length(x)-1
    if mod(i,2) != 0
      par = par + (2*y(i));
    else
      impar = impar + (4*y(i));
    endif
  endfor

  result3 = (h/3)*(y0 + impar + par + yn)



endfunction
