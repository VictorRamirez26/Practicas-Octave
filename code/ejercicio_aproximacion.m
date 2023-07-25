function ejercicio_aproximacion
A = [4 6 14
    6 14 36
    14 36 98]

b = [26
     63
     185]

result = A\b

fi = [1 0.4
     1 1.6]
fit = [1 1
      0.4 1.6]

A = fit * fi
b = fit  * [0.3894 ; 0.9996]
result = A \ b


endfunction
