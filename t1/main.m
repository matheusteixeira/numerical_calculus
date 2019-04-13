%  Dado o sistema linear abaixo para n=40 equações:

%   para  i = 1;                     x(i)+x(i+1)          = 1.50;
%   para  i = 2:n/2                  x(i-1)+4*x(i)+x(i+1) = 1.00;
%   para  i = n/2+1:n-1              x(i-1)+5*x(i)+x(i+1) = 2.00;
%   para  i = n;                     x(i-1)+x(i)          = 3.00;

% a). Armazene o sistema acima em forma de matriz completa;
float_ops_lu = 0;
float_ops_trid = 0;
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

printf("LU Crout\n");

% a1). Resolva o sistema acima por um método direto completo (LU-Crout);
[L U float_ops_lu1] = lu_crout(n, A, B, float_ops_lu);
[C float_ops_lu2] = solve_l(n, L, B, float_ops_lu);
[X float_ops_lu3] = solve_u(n, U, C, float_ops_lu);

% a2). Imprima somente a 1º e última incógnitas e o resíduo máximo;
first_x_lu_crout = X(1)
last_x_lu_crout = X(40)
residuo_max_lucrout = max(abs(X*A - B))

% a3). Calcule o número total de operações em PONTO FLUTUANTE utilizadas e calcule o número de operações teórico;
float_operations_lu_crout = float_ops_lu1 + float_ops_lu2 + float_ops_lu3
printf("\n");

printf("Tridiagonal Gauss\n")
n = 4;
% b). Armazene o sistema acima na forma otimizada de 4 vetores;
t = [ NaN   1   1   1   ]; %faixa à esquerda da principal
r = [  1    4   5   1   ]; %diagonal principal
d = [  1    1   1   NaN ]; %faixa à direita da principal
b = [  1.5  1   2   3   ]; %termos independentes

% b1). Resolva o sistema acima por um método direto otimizado (Gauss-Otimizado para matriz tridiagonal);
[ res_trid  float_ops_trid] = trid_gauss(n, r, t, d, b, float_ops_trid);

% b2). Imprima somente a 1º e última incógnitas e o resíduo máximo;
first_x_trid_gauss = res_trid(1)
last_x_trid_gauss = res_trid(4)
float_operations_trid_gauss = float_ops_trid

% b3). Calcule o número total de operações em PONTO FLUTUANTE utilizadas e calcule o número de operações teórico;


printf("\n");
