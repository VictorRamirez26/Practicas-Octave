function final_ejercicio_diff_central
  clc
  b = (50/19) * [5;8;9;8;5];
  K =[2 -1 0 0 0
       -1 2 -1 0 0
       0 -1 2 -1 0
       0 0 -1 2 -1
       0 0 0 -1 2];

  dt = 0.1;
  t = 0:dt:150;
  z(:,1) = [0;0;0;0;0];
  z_ant = [0;0;0;0;0];
  M = 5*eye(5);

  for i=1:length(t)-1
    if t(i) < 50
      g = (-(1/625)*(t(i)^2)) + (2/25)*t(i); %Parabola
    else
      g = 0;
    endif

    if i==1
      z(:,i+1) = inv(M) * ((2*M - (dt^2)*K)*z(:,i) - (M*z_ant) + ((dt^2) *b*g));
    else
      z(:,i+1) = inv(M) * ((2*M - (dt^2)*K)*z(:,i) - (M*z(:,i-1)) + ((dt^2) *b*g));
    endif
  endfor
  z
  plot(t,z)


endfunction
