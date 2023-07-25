function Ingresar_datos
  
  a = input('Ingrese valor 1: ');
  b = input('Ingrese valor 2: ');
  
  if a < b
    
    disp('El menor valor es') , a
  elseif b < a
    disp('el menor valor es') , b
  else
    disp('los valores son iguales')
  endif
  
  
endfunction
