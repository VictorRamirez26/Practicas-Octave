function gsuss_seidel
  clc
  A = [-3 1 -2
        4 -5 0
        1 -3 6];

  b = [-2
        5
        6];

  xn = [0 0 0];
  xa = [0 0 0];
  er = [0 0 0];
  tol = 0.001;
  error = 100;
  k = 0
  max_it = 1
  while error>tol && k < max_it
   for i=1:3
     s1 = 0;
     s2 = 0;
     for j=1:3
       if j<i
         s1 = s1 + A(i,j)*xn(j);
       endif
       if i<j
         s2= s2 + A(i,j)*xa(j)
       endif
     endfor

     xn(i) = (-s1 - s2 + b(i)) / A(i,i);
     error = abs(xn(i)- xa(i));
     xa(i) = xn(i);
   endfor

   k=k+1
  endwhile

  xn
endfunction
