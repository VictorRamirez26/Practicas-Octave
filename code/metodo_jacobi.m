function metodo_jacobi
  clc
  A = [10 -5 0 0
       -5 20 -5 0
       0 -5 20 -5
       0 0 -5 10]

  B = [-10 20 20 -10]

  X = [0 0 0 0];
  xn = [0 0 0 0];
  max_it = 4;
  error = 1000;
  k=0;
  tol = 0.00001;
  er = [0 0 0 0];
  while error > tol && k < max_it

    for i=1:4
      sum = 0;
      for j=1:4

        if i != j
         sum = sum + A(i , j)*X(j);
       endif
      X(i) = (B(i) - sum)/ A(i,i);
      er(i) = abs(X(i) - xn(i));
    endfor

    xn = X;
    error = max(er);

    endfor

    k = k + 1
  endwhile

  X
  er


endfunction
