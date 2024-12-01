function diferencia_central
  dt = 0.1;
  t = 0:dt:10;
  size = length(t);
  tita = zeros(2,size);
  tita(:,1) = [0;2]; % Valores iniciales
  tita_ant = tita(:,1) - dt*(tita(2,1)) + ((dt^2)/2)*(-9.8*tita(:,1));

  for i = 1 : size-1
    if i == 1
      tita(:,i+1) = (2-(9.8*(dt^2))) * tita(:,i) - tita_ant;
    else
      tita(:,i+1) = (2-(9.8*(dt^2))) * tita(:,i) - tita(:,i-1);
    endif
  endfor

  plot(t,tita(:,:))

endfunction
