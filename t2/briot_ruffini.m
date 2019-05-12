function [b R] = briot_ruffini(a, xi)
  if(length(a) == 1)
    b = [0];
    R = a(1);
  else
    b(1) = a(1);

    for i = 2 : length(a) - 1
        b(i) = a(i) + xi*b(i-1);
    end

    R = a(end) + xi*b(end);
  end
end