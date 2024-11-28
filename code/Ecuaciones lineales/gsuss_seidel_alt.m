function gsuss_seidel_alt
  clc
  A = [-3 1 -2;
        4 -5 0;
        1 -3 6];
  b = [-2;
        5;
        6];

  % Inicialización
  n = size(A, 1);
  xn = zeros(n, 1); % Solución actual
  xa = zeros(n, 1); % Solución anterior
  tol = 0.001;
  max_it = 100;
  error = inf;
  k = 0;

  [D , B] = dividir_matriz(A);

  D_inv = inv(D)
  T = -D_inv*B
  c = D_inv * b

  while error>tol
    for i=1:3
      xn(i) = T(i,:) * xa + c(i);
      error = abs(xn(i)- xa(i));
      xa(i) = xn(i);
    endfor
    k=k+1;
  endwhile

  k
  xn
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


