N = 4;
tic(); 
for i = 1:10
  %A = randn(N); 
  xs = ones(N,1);
  %b = A*xs;
  %A = [0.8, -0.2, -0.2, -0.3; -0.2, 0.9, -0.2, -0.3; -0.3, -0.3, 0.8, -0.2; -0.2, -0.2, -0.4, 0.8];
  %b = [0.5; 0.4; 0.3; 0];
  A = [2, 1, 1, 0; 4, 3, 3, 1; 8, 7, 9, 5; 6, 7, 9, 8];
  b = [1; 2; 4; 5];
  
  for k = 1: N-1
		
    
    for i = k+1: N
			m(i,k) = A(i,k)./A(k,k);
      b(i,1) = (b(i,1) - (m(i,k).*b(k,1)));
			for j = k: N
				A(i,j) = (A(i,j)-(m(i,k).*A(k,j)));
      end
		end
	end

  xt = zeros(N,1); xt(N,1) = b(N,1)./A(N,N);
  for i=N-1:-1:1
    xt(i,1) = (b(i)-A(i,i+1:N)*xt(i+1:N,1))./A(i,i);
  end
  
  E_r(i,1) = norm(xs-xt,inf)/norm(xs,inf);
  R_r(i,1) = norm(b-A*xt,inf)/norm(b,inf);
endfor
  %A
  %b
  xt

[mean(E_r),mean(R_r)];
toc();
ans
