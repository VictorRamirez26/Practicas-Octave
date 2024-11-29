function trapecios_multiples
  clc
  h = 0.1;
  x = 0:h:0.4;
  y = [1,7,4,3,5];

  size = length(y);
  y0 = y(1);
  yn = y(size);
  sum = 0;
  for i=2:size-1
      sum = sum + 2 * y(i);
  endfor

  integral = (h/2) * (y0 + sum + yn)
endfunction
