function X = solve_u(n, U, C)
  X(n) = C(n);

  for i = n - 1: -1 : 1
    X(i) = C(i) - sum(U(i, i + 1 : n) .* X(i+1 : n));
  end
end
