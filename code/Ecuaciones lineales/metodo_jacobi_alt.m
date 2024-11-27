function metodo_jacobi_alt

  clc
  A = [50 -25 0 0
       -25 50 -25 0
       0 -25 50 -25
       0 0 -25 50]

  b = [10; 20; 20; 10]
  xa = [0;0;0;0];
  xn = [0;0;0;0];
  [D , B] = dividir_matriz(A);

  D_inv = inv(D);

  T = - D_inv * B;
  c = D_inv * b;

  max_it = 1000;
  error = 1000;
  k=0;
  tol = 0.00001;

  while error > tol

    for i=1: length(A)
      xn(i) = T(i,:) * xa + c(i);
      error = abs(xn(i)- xa(i));
      xa(i) = xn(i);
    endfor

  endwhile

  xa

  resultado_real = A \ b

endfunction

function [D,B] = dividir_matriz(A)
  size = length(A);
  D = zeros(size,size);
  B = zeros(size,size);

  for i=1 : size
    for j=1 : size
      if i == j
        D(i,j) = A(i,j);
        B(i,j) = 0;
      else
        B(i,j) = A(i,j);
        D(i,j) = 0;
      endif
    endfor
  endfor
  return
endfunction
