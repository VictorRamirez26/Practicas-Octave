function Sum_Taylor
  clc;
  clear all;
  i = 1;
  contador = 1;
  sum = 1;
  error = 0.11;
  while error > 0.1
    
    sum = sum + (2^i)/factorial(i)
    vecX(i) = i;
    vecY(i) = sum;
    vecE(i) = abs(e^2- sum)
    i = i+1;
    contador = contador+1;
    error = abs(sum - e^2);
  endwhile
  
  disp("La cantidad de terminos considerados es: ") , disp(contador)
  hold on;
  plot(vecX , vecY )
  xlabel("Valor serie de Taylor");
  ylabel("e^2");
  plot(vecX, vecE);
  hold off;
endfunction
