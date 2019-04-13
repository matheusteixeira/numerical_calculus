format long
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
for i = 1
  r(i) = 1;
  d(i) = 1;
end

for i = 2 : n/2
  t(i) = 1;
  r(i) = 4;
  d(i) = 1;
end

for i = n/2 + 1 : n - 1
  t(i) = 1;
  r(i) = 5;
  d(i) = 1;
end

for i = n
  t(i) = 1;
  r(i) = 1;
end

% b1). Resolva o sistema acima por um método direto otimizado (Gauss-Otimizado para matriz tridiagonal);
[ X_trid  float_ops_trid] = trid_gauss(n, r, t, d, B, float_ops_trid);

% b2). Imprima somente a 1º e última incógnitas e o resíduo máximo;
first_x_trid_gauss = X_trid(1)
last_x_trid_gauss = X_trid(40)
residuo_max_trid_gauss = max(abs(X_trid*A - B))

% b3). Calcule o número total de operações em PONTO FLUTUANTE utilizadas e calcule o número de operações teórico;
float_operations_trid_gauss = float_ops_trid
printf("\n");

% c). Resolva o sistema acima por um método iterativo (Gauss-Seidel),
% utilizando o armazenamento otimizado em 4 vetores item b):

% c1). Teste fatores de relaxação f (sub ou sobre, entre 0<f<2) e determine previamente
% (com critério de parada grosseiro, 1e-2) o seu valor otimizado, que permita a convergência
%com o menor número de iterações. Imprima o numero de iterações de cada teste
% (pode-se usar critério de parada maior, 1e-2, para  efetuar menos iterações nesta fase de testes);

% c2). Determine a solução S={xi} do sistema acima, pelo método iterativo de Gauss-Seidel,
% com critério de parada Max|Dxi|<=1.10-4 (Dx = diferenças entre variáveis novas e antigas),
% e uso o valor otimizado do fator de relaxação obtido acima.
% Imprima somente a 1º e última incógnitas e o resíduo máximo. Use um algoritmo otimizado, que não realize cálculos com lugares vazios na matriz, senão o método de Gauss-Seidel não vale a pena;

% c3). Imprima o número de iterações e o número total de operações em PONTO FLUTUANTE utilizadas;

% c4). Imprima o erro de Truncamento máximo na solução S obtida acima, em variavel 'double'
% para isolar o efeitos dos arredondamentos.
% Lembre-se que o erro de Truncamento máximo pode ser obtido com
% Max|xi(aproximado,double,criterio)-xi(aproximado,double,criterio2)|.


% d). Imprima, no final, o número de operações em PONTO FLUTUANTE
% utilizadas em cada um dos 3 métodos e indique o melhor método utilizado.

