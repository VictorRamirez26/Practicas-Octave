function temp

  
  for i=1:4
    temp(i) = input("Ingrese la temperatura: ")
  endfor
  
  max = temp(i);
  min = temp(i);
  for i=1:4
    
   if max < temp(i)
      max = temp(i);
   endif
    
   if min > temp(i)
      min = temp(i);
   endif
    
    
  endfor
  
  disp("El valor maximo es: ") , disp(max)
  disp("El valor minimo es: ") , disp(min)


endfunction
