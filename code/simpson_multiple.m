function simpson_multiple
  clc
  x = [0 , 0.4 , 0.8 , 1.2 ,  1.6 , 2 , 2.4];
  y = [0 , 0.389418 , 0.717356 , 0.932039 , 0.999574 , 0.909297 , 0.675463];
  longitud = length(x);
  h = x(2) - x(1);
  y0 = y(1);
  yn = y(longitud);
  par = 0;
  impar = 0;

  for i=2:longitud-1
    if mod(i,2) != 0
      par = par + 2*y(i);
    else
      impar = impar + 4*y(i);
    endif
  endfor

  result = (h/3)*(y0 + par + impar + yn)
endfunction
