function [x float_ops] = gauss_seidel(n, t, r, d, b, xi, relax, tolerance, float_ops)
  x = xi;
  counter = 0;
  difference = 1;
  relax_factor = 1 - relax;

  while(difference > tolerance && counter < 100)
    counter++;
    xi = x;

    i = 1;
    x(i) = 1.5 - relax_factor*xi(i+1);
    float_ops += 2;

    for i = 2 : n/2
      x(i) = 1 - relax_factor*xi(i+1) - relax_factor*xi(i-1)/4;
      float_ops += 5;
    end

    for i = n/2+1 : n-1
      x(i) = (2 - relax_factor*xi(i+1) - relax_factor*xi(i - 1))/5;
      float_ops += 5;
    end

    for i = n
      x(i) = 3 - relax_factor*x(i-1);
      float_ops += 2;
    end

    difference = max(abs(x .- xi));
    float_ops += 1;
  end
  counter
end
