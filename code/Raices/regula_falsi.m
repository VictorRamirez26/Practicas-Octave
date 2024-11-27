function regula_falsi

  clc
  i = 0;
  iter_max = 50;
  encontrado = false;
  raiz = 0;
  a = 0;
  b = 2;
  tol = 0.001;

  while(true)

    fa = f(a);
    fb = f(b);
    m = (fa - fb) / (a - b);

    r = a - (fa/m);
    fr = f(r);

    if abs(fr) < tol
      encontrado = true;
      break ;
    endif

    if fr * fa < 0
      b = r;
    else
      a = r;
     endif

    i++;

    if i > iter_max
      raiz = r;
      break;
     endif

  endwhile

  encontrado, r, i

endfunction

function [result] = f(x)
  result = x - 2 ^(-x);
endfunction
