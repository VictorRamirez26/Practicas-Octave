function diferencia_central_Matricial

  dt = 0.01;
  x = 0:dt:2;

  M = [1 0 0
       0 -1 0
       0 0 2];

  C = [4 0 0
    0 -1 0
    0 0 3];

  K = [0 4 1
    4 2 0
    1 0 1];

  y(:, 1) = [1; 2; 1];
  dy = [1; 4; 0]; % Derivada Primera

  G = inv(M + (0.5*dt)*C);
  D = G*(2*M-((dt^2)*K))
  H = G*((0.5*dt*C)-M);

  dy2 = inv(M)*(R(0) - C*dy - K*y(:,1)) % Derivada segunda, Despejo de la formula gral

  taylorAux = y(:,1) - dt*dy + (0.5*(dt^2)*dy2);

  for i=1:length(x)-1
    if i == 1
      y(:,i+1) = (dt^2)*G*R(x(i)) + (D*y(:,i)) + H *taylorAux

    else
      y(:,i+1) = (dt^2)*G*R(x(i)) + (D*y(:,i)) + (H *y(:,i-1));
    endif
  endfor

  plot(x, y)

endfunction

function Vector = R(x)
  Vector = [(5*exp(x)+(8*exp(2*x)+cos(x))); (-8*exp(2*x)+4*exp(x)); (-cos(x)-3*sin(x)+exp(x))];
endfunction
