function rungeKutta

  h = 0.1;
  x = 0:h:10;
  size = length(x);
  y = zeros(1,size);
  y(1) = 4;
  w = 1/2; % Para cambiar entre euler mejorado y modificado
  for i=1 : size-1
    k1 = h * f(x(i),y(i))
    xg = x(i) + (h/(2*w));
    yg = y(i) + (k1/(2*w));
    k2 = h * f(xg,yg);
    y(i+1) = y(i) + (1-w) * k1 + w * k2;
  endfor

  f = 6*exp(-x/2) -2 +x;
  plot(x,y,"o", x,f , "r")

endfunction

function [result] = f(x,y)
  result = -0.5 * y + 0.5 * x;
  return
endfunction

