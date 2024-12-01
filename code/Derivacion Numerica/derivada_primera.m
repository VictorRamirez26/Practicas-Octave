function derivada_primera

  h = 0.4;
  x = 0:h:2;
  y = [0 , 0.22 , -2.05, -0.61, -0.8 , -1];
  size = length(x)
  dy = zeros(1,size);

  for i=1 : size
    if( i == 1)
      dy(i) = (1/(2*h)) * (-3*y(i) + 4*y(i+1) - y(i+2));
    elseif i == size
      dy(i) = (1/(2*h)) * (3*y(i) - 4*y(i-1) + y(i-2));
    else
      dy(i) = (1/(2*h)) * (y(i+1) - y(i-1));
    endif
  endfor

  plot(x,y, x,dy,"r")

endfunction
