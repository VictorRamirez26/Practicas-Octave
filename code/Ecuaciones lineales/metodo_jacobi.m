function metodo_jacobi
  clc
  A = [10 -5 0 0
       -5 20 -5 0
       0 -5 20 -5
       0 0 -5 10]

  B = [-10; 20; 20; -10]

  x = [0 0 0 0];
  xn = [0 0 0 0];
  max_it = 1000;
  error = 1000;
  k=0;
  tol = 0.00001;
  er = [0 0 0 0];

  while error > tol && k < max_it

    for i=1:4
      sum = 0;
      for j=1:4

        if i != j % Sumo todos menos los de la diagonal principal
         sum = sum + A(i , j) * x(j);
        endif

      x(i) = (B(i) - sum)/ A(i,i); % Aplico la formula completa
      er(i) = abs(x(i) - xn(i));

      endfor

    xn = x;
    error = max(er);

    endfor

    k = k + 1;
  endwhile

  x % Aproximación

  resultado_real = A \ B


endfunction
