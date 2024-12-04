function final_19_11_24

  clc;
  T = 10000;
  m = 0.8;
  L = 100;

  dr = 100/6;
  r = 0:dr:100;

  K = (T/(dr^2)) * [(4/3) (-4/3) 0 0 0
                    (-3/4) (2) (-5/4) 0 0
                    0 (-5/6) 2 (-7/6) 0
                    0 0 (-7/8) (2) (-9/8)
                    0 0 0 (-9/10) (2)];

  iteraciones = 0;
  M = eye(5) * m;

  A_inv = inv(K) * M;

  z0 = [1;1;1;1;1];
  error = 10;
  pk = 0;
  tolerancia = 10^-3;
  alfa = [0;0;0;0;0];
  k = 0;

  while error > tolerancia

    z0_n = (1/norm(z0,inf)) * z0;
    zk = A_inv * z0_n;
    zk_n = (1/norm(zk,inf)) * zk;

    pk1 = (transpose(zk_n) * zk_n) / (transpose(z0_n) * z0_n);

    error = abs(pk1 - pk);
    alfa = zk ./ z0_n;
    pk = pk1;
    z0 = zk;
    k = k + 1;
  endwhile

  k
  lambda = 1 / alfa(1)
  zk_n

  izq = (1 / lambda) * zk
  der = A_inv * zk

  Frecuencia = [7.1233; 7.1918; 7.2067;7.2119;7.2143]
  base_1 = [1;1;1;1;1]
  base_2 = [1/(6^2);1/(12^2);1/(18^2);1/(24^2);1/(30^2)]
  fi = [base_1 , base_2];
  fiT = transpose(fi);
  coeficientes = fiT * fi \ fiT * Frecuencia;
  A = coeficientes(1)
  B = coeficientes(2)

  N = 2;
  error = 100 * (abs(Frecuencia(N) - A) / A) % El menor número de intervalos para que el error sea menor al 1% es N = 12

endfunction

