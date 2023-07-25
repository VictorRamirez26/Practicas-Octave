function euler_reduccion_edo
  clc
  h = 0.1;
  g = 9.8;
  L = 1;
  x = 0:h:10;
  y(:,1) = [0; 2];
  m = [0 1; (-g/L) 0];  
  
  for i=1: length(x) - 1
    pend = m*y(:,i)
    y(:,i+1) = y(:,i)+h*pend;
  endfor

  plot(x , y);
endfunction