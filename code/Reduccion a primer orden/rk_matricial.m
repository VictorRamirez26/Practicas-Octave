function rk_matricial

  dt = 0.01;
  t = 0:dt:10;
  M = [0 1
      -9.8 0];

  size = length(t);
  y = zeros(2,size);
  y(:,1) = [0;2]; % Valores iniciales
  w = 1;

  for i = 1: size-1
    k1 = dt * (M * y(:,i));
    %tg = t(i) + (dt / (2 * w)); No se usa al menos que la función sea distinto de cero del lado derecho
    yg = y(:,i) + (k1 / (2*w));
    k2 = dt * (M * yg);
    y(:,i+1) = y(:,i) + (1-w) * k1 + w * k2;

  endfor

  plot(t,y(1,:) , "r",t, y(2,:) , "b")


endfunction
