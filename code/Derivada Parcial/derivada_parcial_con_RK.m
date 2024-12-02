function derivada_parcial_con_RK

  ceros = zeros(4,4)
  identidad = eye(4)
  c = 12/((0.2)^2)

  K = [2 -1 0 0
        -1 2 -1 0
        0 -1 2 -1
        0 0 -1 2];

  M = [((0.2)^2) 0 0 0
       0 ((0.4)^2) 0 0
       0 0 ((0.6)^2) 0
       0 0 0 ((0.8)^2)]

  M_aux = -inv(M)*c*K

  Matriz = [ceros, identidad; M_aux, ceros]

  y0 = [sin(0.2 * pi); sin(0.4 * pi); sin(0.6 * pi); sin(0.8 * pi); 3; 3; 3; 3];

  dt = 0.001;
  t = 0:dt:1;
  w = 0.5;
  size = length(t);

  y = zeros(8, size);
  y(:,1) = y0;

  for i = 1: size-1

    k1 = dt * Matriz * y(:,i);

    tg = t(i) + (dt/(2*w));

    yg = y(:,i) + (k1/(2*w));

    k2 = dt * Matriz * yg;

    y(:,i+1) = y(:,i) + (1-w) * k1 + w * k2;

  endfor

  plot(t, y(5,:))

endfunction
