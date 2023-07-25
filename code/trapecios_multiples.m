function trapecios_multiples
  clc
  x = [0 , 0.4 , 0.8 , 1.2 ,  1.6 , 2 , 2.4];
  y = [0 , 0.389418 , 0.717356 , 0.932039 , 0.999574 , 0.909297 , 0.675463];
  longitud = length(x);
  h = x(2) - x(1);
  y0 = y(1)/2;
  yn = y(longitud)/2;
  sum = 0;
  for i=2:longitud-1
    sum = sum + y(i);
  endfor

  result = h * (y0 + sum + yn)

endfunction
