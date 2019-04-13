function C = solve_l(n, L, B)
  C(1) = B(1)/L(1,1);

  for i = 2 : n
    C(i) = (B(i) - sum(L(i, 1 : i - 1) .* C(1 : i-1)))/L(i,i);
  end
end