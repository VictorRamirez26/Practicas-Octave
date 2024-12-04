function reduccion_sistemas_edo
  clc
  h = 0.01;
  x = 0:h:10;
  L = 1;
  g = 9.8;
  y(:,1) = [0; 0]; #valores iniciales
  m = [0 1 ; -4 -0.6]; #Pendiente
  w = 0.5;


  for i=1:length(x)-1

    k1 = h*(f(x(i) , y(:,i)));

    xg = x(i) + h/(2*w);

    yg = y(:,i) + k1/(2*w);

    k2 = h*(f(xg(i) , yg(:,i)));

    y(:,i+1) = y(:,i) + (1-w)*k1 + w*k2;

  endfor

  plot(x , y)

endfunction

function result = f( x , y)
  result = [0 1 ; -4 -0.6]*y+sin(3*x)*[0 ; 10];
endfunction
