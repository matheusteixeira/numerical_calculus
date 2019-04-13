function [x float_ops_trid] = trid_gauss(n, r, t, d, b, float_ops_trid)
  for i = 2 : n
    aux = t(i)/r(i-1);
    r(i) = r(i) - aux*d(i-1);
    b(i) = b(i) - aux*b(i-1);
  end
  float_ops_trid += 5*n;

  x(n) = b(n)/r(n);
  float_ops_trid += 1;

  for i = n-1 : -1 : 1
    x(i) = (b(i) - d(i)*x(i+1))/r(i);
  end

  float_ops_trid += 3*(n-1);
end