function roots = locate_polynomial_roots(a, n, h)
  rmin = min_quota(a, n);
  rmax = max_quota(a, n);
  boundaries = [ rmin rmax ];

  boundaries_partitions = boundaries(1):h:boundaries(2);

  y = solve_horner(a, boundaries_partitions);

  roots = [];

  % find real roots
  for i = 1 : (length(boundaries_partitions) - 1)
    bolzano_condition = y(i)*y(i + 1) <= 0;

    if bolzano_condition
      new_root = (boundaries_partitions(i) + boundaries_partitions(i + 1))/2;
      roots = [roots new_root];
    end

  end

  % use dummy complex root to fill the rest
  for i = length(roots) + 1 : length(a) - 1
    new_complex_root = complex(0, rmax/2);
    roots = [roots new_complex_root];
  end
end