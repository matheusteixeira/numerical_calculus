%  Dado o sistema linear abaixo para n=40 equações:

%   para  i = 1;                     x(i)+x(i+1)          = 1.50;
%   para  i = 2:n/2                  x(i-1)+4*x(i)+x(i+1) = 1.00;
%   para  i = n/2+1:n-1              x(i-1)+5*x(i)+x(i+1) = 2.00;
%   para  i = n;                     x(i-1)+x(i)          = 3.00;

% a). Armazene o sistema acima em forma de matriz completa;

n = 40;

for i = 1 : n
  for j = 1 : n
    A(i, j) = 0;
  end
end

for i = 1
  A(i, i) = 1;
  A(i, i+1) = 1;
  B(i) = 1.5;
end

for i = 2 : n/2
  A(i, i-1) = 1;
  A(i, i) = 4;
  A(i, i+1) = 1;
  B(i) = 1;
end

for i = n/2+1 : n - 1
  A(i, i-1) = 1;
  A(i, i) = 5;
  A(i, i+1) = 1;
  B(i) = 2;
end

for i = n
  A(i, i-1) = 1;
  A(i, i) = 1;
  B(i) = 3;
end

[L U] = lu_crout(n, A, B);

C = solve_l(n, L, B);
X = solve_u(n, U, C);

first_x_lu_crout = X(1)

last_x_lu_crout = X(40)

residuo_max_lucrout = max(abs(X*A - B))

