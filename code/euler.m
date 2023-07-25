function euler
  clc
  x0 = 0;
  h = 0.1;
  x = 0:h:1;
  x(1) = 0;
  len_x = length(x);
  y(1) = 2;
  ye(1) = 2;
  for i=1: len_x-1
    fm = (2*y(i))-(2*x(i))-1; 
    y(i+1) = y(i) + h*(fm);
    ye(i+1) = (e^(2*x(i+1))) + x(i+1) +1;
    
  endfor

  plot(x , y ,'r', x , ye , 'g')
endfunction
