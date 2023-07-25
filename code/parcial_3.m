function parcial_3
  clc
  K = [2 -1 0 0
      -1  2 -1 0
       0 -1 2 -1
       0 0 -1 2];

  M = [1 0 0 0
      0 1 0 0
      0 0 1 0
      0 0 0 1];

  b = [10;5;5;5];

  dt = 1/10;
  t = 0:dt:150;
  z(:,1) = [0;0;0;0];
  zant = 0.005*b;

  for i=1:length(t)-1
    if t(i) < 50
      g = 1 - (1/50)* t(i);
    else
      g = 0;
    endif

    if i==1
      z(:,i+1) = (inv(M)*b*g*(dt^2)) - zant + ((2*M)-inv(M)*(dt^2)*K)*z(:,i);
    else
      z(:,i+1) = (inv(M)*b*g*(dt^2)) - z(:,i-1) + ((2*M)-inv(M)*(dt^2)*K)*z(:,i);
    endif

  endfor

  %plot(t,z(3,:), "r" , t , z(4,:) , "g")


  %Calculo la derivada de z3
  for i=1:length(t)
    if i==1
      dz(i) = 1/(2*dt) * (-3*z(3,i) + 4*z(3,i+1) -z(3,i+2));
    elseif i == length(t)
      dz(i) = 1/(2*dt) * (3*z(3,i) - 4*z(3,i-1) + z(3,i-2));
    else
      dz(i) = 1/(2*dt) * (z(3,i+1)-z(3,i-1));
    endif
  endfor

  plot(t ,z(3,:) , "g" , t,dz, "r")

  %Calculo la integral de z3^2 con trapecios multiples
  y0 = dz(1)^2;
  yn = dz(length(t))^2;
  sum = 0;
  for i=2:length(t)-1
    sum = sum + 2*(dz(i)^2);
  endfor

  integral = (dt/2)*(y0 + sum + yn)
  integral_real = integral(dz)
endfunction
