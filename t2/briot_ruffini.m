function [b remainder] = briot_ruffini(a, xi)

  b(1) = a(1);

  for i = 2 : length(a) - 1
      b(i) = a(i) + xi*b(i-1);
  end

  remainder = a(end) + xi*b(end);
end