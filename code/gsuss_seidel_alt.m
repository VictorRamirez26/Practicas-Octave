function gsuss_seidel_alt
  clc
  A = [-3 1 -2
  4 -5 0
  1 -3 6];
  
  b = [-2 
  5 
  6];
  
  xn = [0
  0
  0];
  xa = [0
  0
  0];
  er = [0 0 0];
  tol = 0.001;
  error = 100;
  k = 0
  
  D = diag(A)
  D_inv = inv_D(D)
  B = A - D
  T = -D_inv*B
  c = D_inv * b
  
  while error>tol
    for i=1:3
      
      xn(i) = T(i,:) * xa + c(i)       
      error = abs(xn(i)- xa(i));
      xa(i) = xn(i);
    endfor
    k=k+1 
  endwhile
  
endfunction

function [D] = diag(A)
  
  for i=1:length(A)
    for j=1:length(A)
      if i==j
        D(i,j) = A(i,j);
      endif
    end
  endfor
  return
endfunction 

function [D] = inv_D(A)
  
  for i=1:length(A)
    for j=1:length(A)
      if i==j
        D(i,j) = 1/A(i,j);
      endif
    end
  endfor
  return
endfunction 


