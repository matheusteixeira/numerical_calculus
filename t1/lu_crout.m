function [L U B] = lu_crout(n, A, B)
  L(n, n) = 0;
  U(n, n) = 0;

  for i = 1 : n
    L(i, 1)  = A(i, 1);
    U(i,i) = 1;
  end

  for j = 2 : n
    U(1, j) = A(1, j)/L(1, 1);
  end

  % k = 2, 3,..., n-1
  for k = 2 : n - 1
    for i = k : n
      j = k;
      L(i,j) = A(i,j) - sum(L(i, 1 : j -1) * U(1 : j -1, j));
    end

    for j = k + 1 : n
      i = k;
      U(i, j) = (1/L(i,i))*(A(i,j) - sum(L(i, 1 : i - 1) * U(1 : i -1, j)));
    end
  end

  % k = n
  k = n;
  i = n;
  j = n;

  L(i, j) = A(i,j) - sum(L(i, 1 : j - 1) * U(1 : j -1, j));
end