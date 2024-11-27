function newton_raphson

  clc
  i = 0;
  iter_max = 50;
  encontrado = false;
  tol = 0.001;
  r = 2;

  while(true)

    m = df(r);
    fr = f(r);
    r = r - (fr/m);

    if abs(fr) < tol
      encontrado = true;
      break ;
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

function [result] = df(x)
  result = 1 + (2 ^(-x) * log(2));
endfunction
