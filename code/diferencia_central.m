function diferencia_central
  clc
  h = 0.01;
  g = 9.8;
  L = 1;
  y(1) = 0;
  dy = 2;

  x = 0:h:10 ;

  for i=1:length(x)-1
    if i==1
      aux = y(1) - (h*dy) + (0.5*(h^2))*((-g/L)*y(1)); %Si es la primera iteracion calculo la y anterior por formula
      y(i+1) = (2-((g/L)*(h^2)))*y(i) - aux ; %Con ese resultado calculo el punto siguiente
    else
      y(i+1) = (2-((g/L)*(h^2)))*y(i) - y(i-1) ; %Si no es la primera iteracion entonces cambio el aux por el punto anterior
    endif
  endfor

  plot(x,y);

endfunction

