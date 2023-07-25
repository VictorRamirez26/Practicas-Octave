function ej26_val_contorno

  D = 0.5;
  B = D * [-2 , 1 , 0 , 0 ; 1 , -2 , 1 , 0; 0 , 1 , -2 , 1; 0 , 0 , 1 , -2];
  x = 0 : 1 : 5;
  L = 6;

  dt = 0.1;
  w = 0.5;
  t = 0 : dt : 20;
  u_0 = [sin(pi/L) ; sin((pi*2)/L);sin((pi*3)/L);sin((pi*4)/L)]
  u(:,1) = u_0;

  for i=2 : length(t)
    k1 = dt * (B*u(:,i-1));
    tg = t(i-1) + dt/(2*w);
    ug = u(:,i-1) + k1/(2*w);
    k2 = dt * (B*ug);
    u(:,i) = u(:,i-1) + (1-w)*k1 + w * k2;
  endfor

  plot(t, u)


endfunction

