function secante

  
  i = 0;
  iter_max = 100000;
  calculando = true;
  encontrado = false;
  raiz = 0;
  a = 0;
  b = 2;
  t = 0.03;
  
  while(calculando)
    
    m = (f(a) - f(b)) / (a - b);
    r = a - (f(a)/m);
    fr = f(r);
    
    if abs(fr) < t
      calculando = false;
      encontrado = true;
      raiz = r;
    endif
    fa = f(a);
    fb = f(b);   
    

    i++;
    
    if i > iter_max
      calculando = false; 
      raiz = r;  
     endif
      
  endwhile
  
  encontrado, raiz, i
  
endfunction

function [result] = f(x)
  result = x - 2 ^(-x);
endfunction