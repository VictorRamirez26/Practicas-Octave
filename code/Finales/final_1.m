function final_1

  clc;
  format long g;

  dr = 100/6;
  r = 0:dr:100;

  K = (10000 / dr^2) * [(4/3) (-4/3) 0 0 0
                        (-3/4) (2) (-5/4) 0 0
                        0 (-5/6) 2 (-7/6) 0
                        0 0 (-7/8) (2) (-9/8)
                        0 0 0 (-9/10) (2)];


  b = 10 * [cos((pi * r(1))/200); cos((pi * r(2))/200); cos((pi * r(3))/200); cos((pi * r(4))/200); cos((pi * r(5))/200)];

  tol = 10^-5;
  err = 2;

  z = zeros(5,1);

  while err > tol
    for i = 1:length(r)-2
      sum = 0;
      for j = 1:length(r)-2

        if i ~= j
          sum = sum + K(i,j) * z(j);
        endif

        z(i) = (b(i) - sum) / K(i,i);

      endfor
    endfor
    resto = b - K*z;
    err = norm(resto, inf);
  endwhile

  %% Calculo derivada

  u = [((4/3)*z(1)-(1/3)*z(2)); z(1); z(2); z(3); z(4); z(5); 0]

  length(u);

  length(r);

  du = zeros(length(u), 1);

  for i = 1:length(u)
    if i == 1
      du(i) = (1/(2*dr))*(-3*u(i) + 4*u(i+1) - 1*u(i+2));
    elseif i == length(u)
       du(i) = (1/(2*dr))*(3*u(i) - 4*u(i-1) + 1*u(i-2));
    else
       du(i) = (1/(2*dr))*(u(i+1) - u(i-1));
    endif
  endfor

  %%Calculo Integral
  T = 10000;
  r

  y0 = T*(du(1)^2)*2*pi*r(1);
  yn = T*(du(length(r))^2)*2*pi*r(length(r));

  pares = 0;
  impares = 0;

  length(r);

  for i=2:length(r)-1

    if mod(i,2) ~= 0
      pares = pares + 2 * (T*(du(i)^2)*2*pi*r(i));
    else
      impares = impares + 4 * (T*(du(i)^2)*2*pi*r(i));
    endif

  endfor


  I = (dr/3)*(y0 + impares + pares + yn)

  N = [4;6;8;10;12]

  fi = [1 (1/(4^2))
        1 (1/(6^2))
        1 (1/(8^2))
        1 (1/(10^2))
        1 (1/(12^2))];

  Eint = [165397.1 ; 162222.6; 161540.9; 161343.7; 161278.4];
  fiT = transpose(fi);
  coeficientes = (fiT * fi) \ (fiT * Eint);
  A = coeficientes(1)
  B = coeficientes(2)

  error = 100*((Eint(2) - A) / A) % Como el error es mayor a 1% no es aceptable, entonces tendria que cambiar la base elegida


endfunction

