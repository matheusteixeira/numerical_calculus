function x = sysnewton(xi, f1, f2, tolerance)
    iter = 0;
    dx = [tolerance; tolerance];
    do
      jacob(1, 1) = ( f1( [xi(1) + dx(1); xi(2)] ) - f1(xi))/dx(1);
      jacob(1, 2) = ( f1( [xi(1); xi(2) + dx(2)] ) - f1(xi))/dx(2);
      jacob(2, 1) = ( f2( [xi(1) + dx(1); xi(2)] ) - f2(xi))/dx(1);
      jacob(2, 2) = ( f2( [xi(1); xi(2) + dx(2)] ) - f2(xi))/dx(2);

      % jacob = [exp(xi(1)) 1;
      %          2*xi(1)    2*xi(2);];

      image = -[f1(xi); f2(xi);];

      dx = jacob\image;

      x = xi .+ dx;
      xi = x;

      iter += 1;
    until (max(abs(dx)) < tolerance || iter > 1000)
end
