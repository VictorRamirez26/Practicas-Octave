function trapecios_multiples_2
  clc
  h = (pi/2)/20;
  x = 0:h:(pi/2);
  y = f(x); % Calculo el valor de la función para cada x
  size = length(y);

  y0 = y(1);
  yn = y(size);
  sum = 0;
  for i=2:size-1
      sum = sum + 2 * y(i);
  endfor

  integral = (h/2) * (y0 + sum + yn)
endfunction

function [y] = f(x)
  size = length(x);
  y = zeros(1,size);
  for i = 1 : size
    y(i) = sin(2*x(i));
  endfor
  return
endfunction
