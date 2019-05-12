format long
%  1). Determine os zeros REAIS da função f(x) = x*tan(x)-1, e seus resíduos,
% entre -2*pi e 2*pi. Lembre-se de verificar e evitar pontos de descontinuidades
% (nesse caso existem descontinuidades em pi/2 e seus múltiplos);

boundaries = [-2*pi 2*pi];
f = @(x) x .* tan(x) .- 1;

tolerance = 1e-14; % erro atingido será < 1e-15, pois converge até o ultimo dígito double
newton_roots = newton_roots(f, tolerance, boundaries)

residuo = f(newton_roots)

% 2). Determine todas as raízes, respectivas multiplicidades e resíduos do polinômio de grau 7
% com os seguintes coeficientes em ordem decrescente de grau:

a = [ +1 -7  +20.95 -34.75 +34.5004 -20.5012 +6.7512 -0.9504 ];
n = length(a) - 1;

xi = locate_polynomial_roots(a, n, 0.1);

% 2a). Use o método de Newton tradicional (com multiplicidade M=1);
traditional_newton_roots = traditional_newton(xi, a, n, tolerance)

% 2b). Use o método de Newton, usando a estimativa da multiplicidade M de
% cada raiz (teste diferentes valores de raízes iniciais e diferentes limites (1e-2, 1e-3,...)
% para a soma dos restos na estimativa da multiplicidade).

% 2c). Monte o polinômio fatorado em binômios (x-raiz(1))^M(1) * (x-raiz(2))^M(2) * ....., com as raizes arredondadas paar o seu valor exato.

% RESPOSTAS:

% x = + 0.800000000014627 + 0.000000000000000 i com M = 1
% x = + 0.899999999783241 + 0.000000000000000 i com M = 1
% x = + 1.000000000009858 + 0.000000000000000 i com M = 3
% x = + 1.100000000070061 + 0.000000000000000 i com M = 1
% x = + 1.200000000046985 + 0.000000000000000 i com M = 1;

% ARREDONDE PARA GERAR O POLINÔMIO EXATO.

% 2d). Obtenha e imprime as raízes pela função  roots do Octave e pelo WolfraAlfa.

% 3). Dado o sistema:

% f1 = x(1)^3+x(2)^3-2 = 0

% f2 = sen(x(1))*cos(x(2))-0.45 = 0

% determine e imprima:

% - uma solução  pelo método de Newton com derivadas numérica;

% - o resíduo máximo das equações do sistema de  equações não lineares

% Escolha valores iniciais (radianos) e critério de parada compatível com a variavel double.

