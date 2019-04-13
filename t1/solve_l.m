function [C float_ops] = solve_l(n, L, B, float_ops)
  C(1) = B(1)/L(1,1);
  float_ops += 1;

  for i = 2 : n
    C(i) = (B(i) - sum(L(i, 1 : i - 1) .* C(1 : i-1)))/L(i,i);
    float_ops += 2 + 2 * sum(1 : i - 1);
  end
end