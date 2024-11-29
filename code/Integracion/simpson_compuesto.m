function simpson_compuesto

  clc
  h = (pi/2)/20;
  x = 0:h:(pi/2);
  y = f(x); % Calculo el valor de la función para cada x
  size = length(y);

  y0 = y(1);
  yn = y(size);
  par = 0;
  impar = 0;

  for i=2:size-1 % El primer elemento del subintervalo es impar
    if (mod(i,2) ~= 0)
      par = par + 2 * y(i);
    else
      impar = impar + 4 * y(i);
    endif
  endfor
  integral = (h/3) * (y0 + impar + par + yn)

endfunction

function [y] = f(x)
  size = length(x);
  y = zeros(1,size);
  for i = 1 : size
    y(i) = sin(2*x(i));
  endfor
  return
endfunction
