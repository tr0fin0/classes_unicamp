load("sherman5.mat")
A = Problem.A;
det(A)%1 e 3 não são singulares

D = diag(diag(A));
det(D)%1 e 3 possuem elementos não nulos na diagonal