function x = traditional_newton_with_multiplicity(xi, a, n, tolerance, m_tolerance)
  iter = 0;
  x = [];
  m = [];

  num_roots = 0;
  r_index = 1;

  while num_roots < n
    x_intial = xi(r_index);

    do
      [quotient r1] = briot_ruffini(a, x_intial);

      quotient = a;
      R = [];

      for j = 1 : length(a)
        [quotient new_R] = briot_ruffini(quotient, x_intial);
        R = [R new_R];
      end

      multiplicity = 1;

      R_sum = abs(R(1) + R(2));

      while R_sum < m_tolerance
        multiplicity++;
        R_sum += abs(R(multiplicity + 1));
      end

      dx = -R(multiplicity)/(multiplicity * R(multiplicity+1));

      x_intial = x_intial + dx;

      iter += 1;
    until (abs(dx) >= tolerance && iter < 1000)

    num_roots += multiplicity;
    r_index++;

    new_root = x_intial;
    new_multiplicity = multiplicity;

    x = [x new_root];
    m = [m new_multiplicity];

    for j = 1 : multiplicity
      [a _] = briot_ruffini(a, x(end));
    end
  end
end
