function ejercicio_RK
  clc
  h = 10;
  w = 0.5;
  x = 0:h:7500;
  z = zeros(6 , 1);
  K =(0.018)* [-2 1 0 0 0 0
              1 -2 1 0 0 0
              0 1 -2 1 0 0
              0 0 1 -2 1 0
              0 0 0 1 -2 1
              0 0 0 0 2/3 -2/3];

  p = 0.018 * [1; 0 ; 0 ; 0 ; 0 ; 0];

  for i=1: length(x)
    dz = K * z + p;
    k1 = h * dz;
    xg = x(i) + h/(2*w);
    zg = z + k1 / (2*w);
    dzg = K * zg + p ;
    k2 = h * dzg;
    zn = z + (1-w)*k1 + w *k2;
    mz(:,i) = z;
    z = zn;
  endfor

  plot(x , mz(3,:))

endfunction
