 Dado o sistema linear abaixo para n=40 equações:
```
  para  i=1;                     x(i)+x(i+1)          = 1.50;
  para  i=2:n/2                  x(i-1)+4*x(i)+x(i+1) = 1.00;
  para  i=n/2+1:n-1              x(i-1)+5*x(i)+x(i+1) = 2.00;
  para  i=n;                     x(i-1)+x(i)          = 3.00;
```

a). Armazene o sistema acima em forma de matriz completa;

a1). Resolva o sistema acima por um método direto completo (Eliminação Gaussiana (ECV) ou LU-Crout (CCO));

a2). Imprima somente a 1º e última incógnitas e o resíduo máximo;

a3). Calcule o número total de operações em PONTO FLUTUANTE utilizadas e calcule o número de operações teórico;

b). Armazene o sistema acima na forma otimizada de 4 vetores;

b1). Resolva o sistema acima por um método direto otimizado (Gauss-Otimizado para matriz tridiagonal);

b2). Imprima somente a 1º e última incógnitas e o resíduo máximo;

b3). Calcule o número total de operações em PONTO FLUTUANTE utilizadas e calcule o número de operações teórico;

c). Resolva o sistema acima por um método iterativo (Gauss-Seidel), utilizando o armazenamento otimizado em 4 vetores item b):

c1). Teste fatores de relaxação f (sub ou sobre, entre 0<f<2) e determine previamente (com critério de parada grosseiro, 1e-2) o seu valor otimizado, que permita a convergência com o menor número de iterações. Imprima o numero de iterações de cada teste (pode-se usar critério de parada maior, 1e-2, para  efetuar menos iterações nesta fase de testes);

c2). Determine a solução S={xi} do sistema acima, pelo método iterativo de Gauss-Seidel, com critério de parada Max|Dxi|<=1.10-4 (Dx = diferenças entre variáveis novas e antigas), e uso o valor otimizado do fator de relaxação obtido acima. Imprima somente a 1º e última incógnitas e o resíduo máximo. Use um algoritmo otimizado, que não realize cálculos com lugares vazios na matriz, senão o método de Gauss-Seidel não vale a pena;

c3). Imprima o número de iterações e o número total de operações em PONTO FLUTUANTE utilizadas;

c4). Imprima o erro de Truncamento máximo na solução S obtida acima, em variavel ‘double’ para isolar o efeitos dos arredondamentos. Lembre-se que o erro de Truncamento máximo pode ser obtido com  Max|xi(aproximado,double,criterio)-xi(aproximado,double,criterio2)|.


d). Imprima, no final, o número de operações em PONTO FLUTUANTE utilizadas em cada um dos 3 métodos e indique o melhor método utilizado.


Obs.:

(i). Faça o algoritmo completo, com um programa principal (tipo main.m) que chame todas as functions necessárias para cada item, postado no ambiente VPL deste link. O main.m deve ser o primeiro arquivo.

(ii). Imprima resposta de forma clara e concisa com os resultados de cada item.

