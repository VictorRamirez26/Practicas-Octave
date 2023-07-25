function ejercicio_cuestionario
  clc
  h = 0.15;
  x = 0:h:0.3
  y(1) = 1;
  w = 0.5;
  # w = 1 -> euler modificado
  # w = 0.5 -> euler mejorado
  for i = 2: length(x)
    k1 = h * f(x(i-1), y(i-1));
    xG = x(i-1) + h / (2 * w);
    yG = y(i-1) + k1 / (2 * w);
    k2 = h * f(xG, yG);
    y(i) = y(i-1) + (1 - w) * k1 + w * k2;
  endfor
  plot(x, y)
  y

endfunction

function derivada = f(x, y)
  derivada = -y + (x*x);
endfunction
