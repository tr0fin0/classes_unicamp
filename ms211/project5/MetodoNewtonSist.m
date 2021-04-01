function [x,it] = MetodoNewtonSist(f,Jf,x0,e1,e2,it_max)
  
  x= x0;
  z = f(x0);
  it = 0;
  
  if( norm(z,inf) >= e1)
    
    M = Jf(x0);
    r = M\-z;
    x = x0 + r;
    it =1;
    
    while( (norm(z,inf) >= e1) || ((norm(r,inf) >= e2)) && (it < it_max) )
    
      x0 = x;
      M = Jf(x0);
      r = M\-z;
      x = x0 + r;
      z = f(x);
      it = it + 1;
      
    end
  
  endif
  
endfunction