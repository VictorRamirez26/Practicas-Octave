function final_25_6_24
  clc
  K = [2 -1 0 0 0
       -1 2 -1 0 0
       0 -1 2 -1 0
       0 0 -1 2 -1
       0 0 0 -1 2];

  M = eye(5) * 5;
  dt = 0.1;
  t = 0:dt:50;
  size = length(t);
  L = 60;
  z_ant = -dt * [sin((pi * 10) /L); sin((pi * 20) /L); sin((pi * 30) /L); sin((pi * 40) /L); sin((pi * 50) /L)]

  z = zeros(5,size);
  identidad = eye(5);
  for i=1: size-1
    if i == 1
      z(:,i+1) = (2*identidad - inv(M)*K*(dt^2)) * z(:,i) - identidad * z_ant;
    else
      z(:,i+1) = (2*identidad - inv(M)*K*(dt^2)) * z(:,i) - identidad * z(:,i-1);
    endif
  endfor

  plot(t,z(3,:))
  z(3,476)

endfunction
