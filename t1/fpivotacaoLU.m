function [A B]=fpivotacaoLU(k,n,A,m,B)
  max = 0;

  for i = k : n
    if abs(A(i,k)) > max
      max = abs(A(i,k));
      imax = i;
    end
  end

  %Troca de linhas na matriz a
  for j = 1 : n
    Aoriginal = A(k,j);
    A(k,j) = A(imax,j);
    A(imax,j) = Aoriginal;
  end

  %Troca de linhas na matriz b, de termos independentes
  for j = 1 : m
    % dbstop
    temp = B(1, j);
    B(k) = B(1, j);
    B(1, imax) = temp;
  end
end