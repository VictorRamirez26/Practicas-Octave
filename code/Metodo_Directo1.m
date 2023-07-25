function Metodo_Directo1
  clc
  x = [3; 7; 9];
  y = [5; -1; 2];

  a = Base_cuadratica(x) \ y
endfunction

function rta = Base_cuadratica(x)

    for i = 1:length(x)
      rta(i, 1) = 1;
      rta(i, 2) = x(i);
      rta(i, 3) = x(i)^2;
    endfor
endfunction
