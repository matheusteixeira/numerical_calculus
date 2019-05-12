function M = multiplicity(R, n)
  M = 1

  sum_multiplicity = abs(R(1)) + abs(R(2));

  while sum_multiplicity < 0.1
    M++;
    sum_multiplicity += abs(R(M+1));
  end
end