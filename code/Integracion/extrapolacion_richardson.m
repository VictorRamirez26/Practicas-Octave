function extrapolacion_richardson

  clc
  % Inicialización con Integral en 6 pasos
  h1 = (pi/2)/6;
  x1 = 0:h1:(pi/2);

  y1 = f(x1); % Calculo el valor de la función para cada x1
  size1 = length(y1);

  y0_1 = y1(1);
  yn_1 = y1(size1);

  par = 0;
  impar = 0;

  for i=2:size1-1 % El primer elemento del subintervalo es impar
    if (mod(i,2) ~= 0)
      par = par + 2 * y1(i);
    else
      impar = impar + 4 * y1(i);
    endif
  endfor

  integral_1 = (h1/3) * (y0_1 + impar + par + yn_1)

  % Inicialización con Integral en 10 pasos
  h2 = (pi/2)/10;
  x2 = 0:h2:(pi/2);
  y2 = f(x2); % Calculo el valor de la función para cada x2
  size2 = length(y2);
  y0_2 = y2(1);
  yn_2 = y2(size2);

  par = 0;
  impar = 0;
  for i=2:size2-1 % El primer elemento del subintervalo es impar
    if (mod(i,2) ~= 0)
      par = par + 2 * y2(i);
    else
      impar = impar + 4 * y2(i);
    endif
  endfor
  integral_2 = (h2/3) * (y0_2 + impar + par + yn_2)

  n = 4; % Orden de error 4 por usar simpson_compuesto
  B = (h1/h2)^n;
  Integral = (B*integral_2 - integral_1) / (B - 1)


endfunction

function [y] = f(x)
  size = length(x);
  y = zeros(1,size);
  for i = 1 : size
    y(i) = sin(2*x(i));
  endfor
  return
endfunction
