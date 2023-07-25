function derivacion_numerica
  clc
  h = 0.1
  x = 0:h:1
  
  for i = 1:length(x)
    if i == 1
      fs2(i) = (1/h^2)*(2*f(x(i)) - 5*f(x(i+1)) + 4*f(x(i+2)) - f(x(i+3)));
    else
      if i == length(x) 
        fs2(i) = (1/h^2)*(2*f(x(i)) - 5*f(x(i-1)) + 4*f(x(i-2)) - f(x(i-3)));
      else
        fs2(i) = (1/h^2)*(f(x(i+1)) - 2*f(x(i)) + f(x(i-1)));
      end
     end
    end
    fs2
  
endfunction

function y = f(x)
  
  y = cos(x * pi);
  
endfunction
