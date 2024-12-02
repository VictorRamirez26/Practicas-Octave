function derivada_parcial_con_diff_central

  clc

  c = 12/((0.2)^2);

  K = [2 -1 0 0
        -1 2 -1 0
        0 -1 2 -1
        0 0 -1 2];

  M = [((0.2)^2) 0 0 0
       0 ((0.4)^2) 0 0
       0 0 ((0.6)^2) 0
       0 0 0 ((0.8)^2)];

  M_aux = -inv(M)*c*K;

  u0 = [sin(0.2 * pi); sin(0.4 * pi); sin(0.6 * pi); sin(0.8 * pi)];
  du0 = [3;3;3;3];

  dt = 0.001;
  t = 0:dt:1;
  size = length(t);

  u = zeros(4, size);
  u(:,1) = u0;

  u_ant = u0 - dt*du0 + (dt^2)/2 * M_aux*u0;

  for i = 1: size-1

    if i==1
      u(:,i+1) = (2 * eye(4) + (dt^2) * M_aux) * u(:,i) - eye(4) * u_ant;
    else
      u(:,i+1) = (2 * eye(4) + (dt^2) * M_aux) * u(:,i) - eye(4) * u(:,i-1);
    endif

  endfor

  %plot(t, u(1,:))

  %% practica derivada

  dx = 0.2 % paso entre las x

  x = 0:dx:1;
  size_x = length(x);

  du_dx = zeros(size_x,size);

  u_aux = zeros(size_x,size);

  % Para cada valor de t, grafico U(x)
  for i = 1 : size
    u_aux(:,i) = [0 ; u(:,i) ; 0]; % Para cada t sabemos que en X = 0 y X = 1 su valor es 0
  endfor

  for j = 1 : size  % Itero cada valor de t
      for i = 1 : size_x
          if i == 1
              du_dx(i,j) = (1/(2*dx)) * (-3*u_aux(i,j) + 4*u_aux(i+1,j) - u_aux(i+2,j));
          elseif i == size_x
              du_dx(i,j) = (1/(2*dx)) * (3*u_aux(i,j) - 4*u_aux(i-1,j) + u_aux(i-2,j));
          else
              du_dx(i,j) = (1/(2*dx)) * (u_aux(i+1,j) - u_aux(i-1,j));
          endif
      endfor
  endfor

  % Ejemplo t = 30
  plot(x, u_aux(:,30), 'b', x, du_dx(:,30), 'r')
  legend('u(x)', 'du/dx')

  u_aux(:,30)
  du_dx(:,30)


endfunction

