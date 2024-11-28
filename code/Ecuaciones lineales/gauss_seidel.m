function gsuss_seidel
  clc;
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

  while error > tol && k < max_it
    for i = 1:n
      s1 = 0; % Suma de elementos anteriores
      s2 = 0; % Suma de elementos posteriores

      for j = 1:n
        if j < i % Parte superior de la diagonal
          s1 = s1 + A(i, j) * xn(j);
        elseif j > i % Parte inferior de la diagonal
          s2 = s2 + A(i, j) * xa(j);
        end
      endfor

      xn(i) = (-s1 - s2 + b(i)) / A(i, i);
    endfor

    % Calcular error como norma
    error = norm(xn - xa, inf);
    xa = xn; % Actualizo para la sig iteracion
    k = k + 1;
  end
  k
  xn
  resultado_real = A \ b

endfunction

