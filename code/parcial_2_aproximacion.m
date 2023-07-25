function parcial_2_aproximacion
  clc
  x = [2 , 4  6  8  10];
  y = [26.84 ; 32.34 ; 34.1 ; 34.98 ;  35.64 ];
  fi = fi(x)
  fiT = transpose(fi)
  A = fiT * fi
  b = fiT * y
  a = A\b

endfunction

function result = fi(x)

  for i=1:length(x)
    result(i , 1) = 1;
    result(i , 2) = 1/x(i);
  endfor


endfunction
