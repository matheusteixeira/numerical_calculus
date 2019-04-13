function [L U] = lu_crout(n, A, B)
  L(n, n) = 0;
  m = size(B, 1);

  k = 1;

  % [A, B, L] = row_swap(k, n, A, B, L);
  for i = 1 : n
    L(i, 1)  = A(i, 1);
    U(i,i) = 1;
  end

  for j = 2 : n
    U(1, j) = A(1, j)/L(1, 1);
  end

  % k = 2, 3,..., n-1
  for k = 2 : n - 1

    % [A, B, L] = row_swap(k, n, A, B, L);
    for i = k : n
      j = k;
      L(i,j) = A(i,j) - sum(L(i, 1 : j -1) * U(1 : j -1, j));
    end

    for j = k + 1 : n
      i = k;
      % keyboard
      U(i, j) = (1/L(i,i))*(A(i,j) - sum(L(i, 1 : i - 1) * U(1 : i -1, j)));
    end
  end

  % k = n
  k = n;

  % [A, B, L] = row_swap(k, n, A, B, L);
  i = n;
  j = n;

  L(i, j) = A(i,j) - sum(L(i, 1 : j - 1) * U(1 : j -1, j));
end