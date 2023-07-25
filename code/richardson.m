function richardson
  clc  
  par1 = 0;
  impar1 = 0;
  
  par2 = 0;
  impar2 = 0;
  
  h1 = (pi/2)/6
  h2 = (pi/2)/10
  
  x1 = 0:h1:pi/2
  x2 = 0:h2:pi/2
  
  for i=1 : length(x1)
    y1(i) = sin(2*x1(i));
  endfor
  for i=1 : length(x2)
    y2(i) = sin(2*x2(i));
  endfor
  
  
  yn1 = y1(length(x1));
  y01 = y1(1);  
  
  yn2 = y2(length(x2));
  y02 = y2(1); 
  
  for i=2:length(x1)-1
    if mod(i,2) != 0
      par1 = par1 + 2*y1(i);
    else
      impar1 = impar1 + 4*y1(i);
    endif
  endfor  
  
  result1 = (h1/3)*(y01 + par1 + impar1 + yn1)  
  
  for i=2:length(x2)-1
    if mod(i,2) != 0
      par2 = par2 + 2*y2(i);
    else
      impar2 = impar2 + 4*y2(i);
    endif
  endfor  
  
  result2 = (h2/3)*(y02 + par2 + impar2 + yn2)
  

    

endfunction
