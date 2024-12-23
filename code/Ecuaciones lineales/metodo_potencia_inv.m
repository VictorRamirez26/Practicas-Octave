function metodo_potencia_inv
  clc
  A = [-10, 4 ; -4, 0];
  A_inv = inv(A);
  x = [2;2];
  error = 0;
  tol = 0.00001;
  alpha = [0;0];
  k = 0;

  while error < 1 - tol

    x_norm = (1/(norm(x,inf))) * x;

    xk = A_inv * x_norm;

    xk_norm = xk / (norm(xk,inf)); %Autovector

    error = abs((transpose(xk_norm) * xk_norm)/(transpose(x_norm) * x_norm));

    alpha = xk ./ x_norm;
    x = xk;
    k = k + 1;
  endwhile

  k
  xk_norm
  lambda = 1/alpha(1)

  izq = A_inv * xk_norm %Lado izquierdo de la ecuación
  der = (1 / lambda) * xk_norm %Lado derecho de la ecuación
end
