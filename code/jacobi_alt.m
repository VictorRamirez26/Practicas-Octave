function jacobi_alt
  
  A = [-3 1 -2
       4 -5 0
       1 -3 6]
       
  B = [-2 5 6]
  
  X = [0 0 0];
  xn = [0 0 0];
  max_it = 10;
  error = 1000;
  k=0;
  tol = 0.0001;
  er = [0 0 0];
  
  D , B = separar_mat(A);
  D
  B
  
  
  
  
endfunction

function [D , B] = separar_mat(A)
  
  for i=1:3
    
    for j=1:3
      if i=j
        D(i,j) = A(i,j)
      else
        B(i,j) = A(i,j)
      endif
    endfor
    
   
  endfor
  
  
endfunction
