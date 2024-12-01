function rk_ejercicio_2

  M = [-2 1 0 0 0 0
        1 -2 1 0 0 0
        0 1 -2 1 0 0
        0 0 1 -2 1 0
        0 0 0 1 -2 1
        0 0 0 0 2/3 -2/3];

  K = 0.018 * M;

  p = 0.018 * [1;0;0;0;0;0];
  w = 0.5
  dt = 10;
  t = 0:dt:7500;

  size = length(t);
  z = zeros(6,size) % Valores iniciales son ceros z0 = [0;0;0;0;0;0]

  for i = 1:size-1
    k1 = dt * (K*z(:,i) + p);
    tg = t(i) + (dt/(2*w));
    zg = z(:,i) + (k1/(2*w));
    k2 = dt * (K*zg + p);
    z(:, i+1) = z(:,i) + (1-w)*k1 + w*k2;
  endfor

  plot(t, z(:,:), "r");

endfunction
