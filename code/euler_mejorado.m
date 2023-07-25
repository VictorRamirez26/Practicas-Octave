function euler_mejorado
  clc
  x0 = 0;
  h = 0.1;
  x = 0:h:1;
  x(1) = 0;
  len_x = length(x);
  y(1) = 2;
  ye(1) = 2;
  
  for i=1: len_x-1
    fm = f(x(i) , y(i));
    y(i+1) = y(i) + h*(fm); %Hasta aca es euler normal
    
    fi = 0.5*(fm + f(x(i+1) , y(i+1))); %Saco el promedio entre la pendiente actual y la siguiente
    y(i+1) = y(i) +h*fi; %Con esa nueva pendiente aplico el metodo de euler
        
    ye(i+1) = (e^(2*x(i+1))) + x(i+1) +1; %Solucion exacta
    
  endfor
  plot(x , y ,'r', x , ye , 'g')

endfunction

function result = f(x , y)
  result = (2*y)-(2*x)-1;
endfunction
