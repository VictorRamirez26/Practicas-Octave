function punto_fijo
  f = f1(2);
  g = g1(f , 2 , -1/3);
  tol = 0.001;
  i = 0;
  error = 1;

  while (error > tol && i <= 10)
    x = g
    f = f1(x);
    g = g1(f , x , -1/3);
    i = i + 1
    error = abs(f) ;
  endwhile


endfunction

function [result] = f1(x)
  result = (x^2) - 3;
endfunction

function [result2] = g1(f , x , alfa)
  result2 = (alfa*f) + x ;
endfunction

