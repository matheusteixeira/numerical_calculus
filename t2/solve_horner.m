function y = solve_horner(a, boundaries)
  y = a(1) .* boundaries .+ a(2);

  for i = 3 : length(a)
    y = (y .* boundaries) .+ a(i);
  end
end