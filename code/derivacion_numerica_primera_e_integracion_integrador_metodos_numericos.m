function derivacion_numerica_primera_e_integracion_integrador_metodos_numericos
  clc
  h = 0.5;
  x = 0:0.5:3;
  y = [167, 176, 201, 241, 291, 347, 400];
  longitud = length(x);

  for i = 1:length(x)
    if i == 1
      fs(i) = (1/(2*h))*(-3*(y(i)) + 4*(y(i+1)) - (y(i+2)));
    else
      if i == length(x)
        fs(i) = (1/(2*h))*(3*(y(i)) - 4*(y(i-1)) + (y(i-2)));
      else
        fs(i) =((y(i+1)) - (y(i-1)))/(2*h);
      end
     end
    end
    fs


  y0 = f(x(1), fs(1));
  yn = f(x(longitud), fs(longitud));
  par = 0;
  impar = 0;

  for i=2:longitud-1
    if mod(i,2) != 0
      par = par + 2*f(x(i), fs(i));
    else
      impar = impar + 4*f(x(i), fs(i));
    endif
  endfor

  result = (h/3)*(y0 + par + impar + yn)

endfunction



function y = f(x, dx)
  y = 2*pi*x*(dx^2)
end
