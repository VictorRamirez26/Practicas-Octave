function Suma_Matrices
  
 mat1 = llenar_matriz()
 mat2 = llenar_matriz()
 
 metriz = Mat_Suma(mat1, mat2)
 
 
 
endfunction

function [matriz] = llenar_matriz()
   for i=1:2;4
   
    for j=1:2;
      matriz(i,j) = input("Ingrese el valor ");
    endfor
  endfor
  return 
endfunction

function [Rta] = Mat_Suma(matriz1, matriz2)
  
   for i=1:2;
    for j=1:2;
      Rta(i,j) = matriz1(i,j) + matriz2(i,j);
    endfor
  endfor
  
endfunction
