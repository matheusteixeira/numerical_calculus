function x = traditional_newton(xi, a, n, tolerance)
  iter = 0;
  x = [];

  for(i = 1 : length(xi))
    x_intial = xi(i);

    do
      [quotient r1] = briot_ruffini(a, x_intial);

      [_ r2] = briot_ruffini(quotient, xi(1));

      dx = -r1/r2;

      x_intial = x_intial + dx;

      iter += 1;
    until (abs(dx) >= tolerance && iter < 1000)

    new_root = x_intial;

    x = [x new_root];
    [a _] = briot_ruffini(a, x(end));
  end
end
