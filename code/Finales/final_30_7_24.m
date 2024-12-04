function final_30_7_24
  clc
  K = [1 0 0 0 0 0 0 0 0
      -1 3 -1 0 0 0 0 0 0
      0 -1 3 -1 0 0 0 0 0
      0 0 -1 3 -1 0 0 0 0
      0 0 0 -1 3 -1 0 0 0
      0 0 0 0 -1 3 -1 0 0
      0 0 0 0 0 -1 3 -1 0
      0 0 0 0 0 0 -1 3 -1
      0 0 0 0 0 0 -0.5 2 -1.5];

  p = [50;5;5;5;5;5;5;5;0];
  size = length(p);

  u = zeros(size,1);
  tol = 10^(-6);
  resto = 2;


  while resto > tol
    for i = 1 : size
      sum = 0;
      for j = 1:size
        if i ~= j
          sum = sum + K(i,j) * u(j);
        endif

        u(i) = (p(i) - sum) / K(i,i);
      endfor
    endfor

    resto = norm(-K * u + p,inf);

  endwhile

  u

  % Derivada

  L = 8;
  dx = L/8;
  x = 0:dx:L;
  size = length(x);
  du = zeros(1,size);

  for i = 1 : size
    if i == 1
      du(i) = (1/(2*dx)) * (-3*u(i) + 4*u(i+1) -u(i+2));
    elseif i == size
      du(i) = (1/(2*dx)) * (3*u(i) - 4*u(i-1) +u(i-2));
    else
      du(i) = (1/(2*dx)) * (u(i+1) - u(i-1));
    endif

  endfor

  % Integral de (du/dx)^2 de 0 a L
  u0 = (du(1))^2;
  un = (du(size))^2;
  par = 0;
  impar = 0;

  for i = 2:size-1
    if mod(i,2) ~= 0
      par = par + 2 * (du(i)^2);
    else
      impar = impar + 4 * (du(i)^2);
    endif
  endfor

  Integral = (dx/3) * (u0 + par + impar + un)

  % Aproximacion
  N = [2 , 4 , 8 , 16];
  Ein = [552.96; 786.35; 981.61; 1027.3];
  fi = [1 (1/2) (1/4)
        1 (1/4) (1/16)
        1 (1/8) (1/64)
        1 (1/16) (1/256)];
  fiT = transpose(fi);

  result = (fiT * fi) \ (fiT * Ein);
  A = result(1)
  B = result(2)
  C = result(3)

  %Error global de la solucion obtenida con N = 8
  error_global = abs(Ein(3) - A) / A
endfunction
