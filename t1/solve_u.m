function [X float_ops] = solve_u(n, U, C, float_ops)
  X(n) = C(n);

  for i = n - 1: -1 : 1
    X(i) = C(i) - sum(U(i, i + 1 : n) .* X(i+1 : n));
    float_ops += 1 + 2 * sum(i + 1 : n);
  end
end
