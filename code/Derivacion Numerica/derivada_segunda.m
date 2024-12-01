function derivada_segunda

  h = 0.1;
  x = 0:h:1;
  y = f(x);
  size = length(x)
  dy2 = zeros(1,size);

  for i=1 : size
    if( i == 1)
      dy2(i) = (1/(h^2)) * (2*y(i) - 5*y(i+1) + 4*y(i+2) - y(i+3) );
    elseif i == size
      dy2(i) = (1/(h^2)) * (2*y(i) - 5*y(i-1) + 4*y(i-2) - y(i-3));
    else
      dy2(i) = (1/(h^2)) * (y(i+1)- 2*y(i) + y(i-1));
    endif
  endfor

  plot(x,y, x,dy2,"r")

endfunction

function [y] = f(x)
  size = length(x);
  y = zeros(1,size);
  for i = 1 : size
    y(i) = cos(pi * x(i));
  endfor
  return
endfunction
