function rungeKutta
  clc
  h = 0.1;
  x = 0:h:10;
  y0 = 4;
  w = 1;
  
  for i=1:length(x)
    y(i) = y0;
    k1 = h * f(x(i) , y(i));
    xg = x(i) + h/(2*w);
    yg = y(i) + k1/(2*w);
    k2 = h*f(xg, yg);
    y0 = y0 + (1 - w)*k1 + w*k2;
  endfor
  f = 6*exp(-x/2) -2 +x;
  plot(x , y, 'o', x , f)
  
endfunction

function result = f(x , y)
  result = (0.5 * x) - (0.5 * y);
endfunction
