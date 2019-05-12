function x = newton_roots(f, tolerance, boundaries)
    xi = locate_roots(f, boundaries);

    n_roots = length(xi);
    for i = 1:n_roots
        dx = tolerance;
        k = 0;
        do
            k = k + 1;
            df = (f(xi(i)+dx)-f(xi(i)))/dx;
            dx = -f(xi(i))/df;
            x(i) = xi(i) + dx;
            xi(i) = x(i);
        until(abs(dx) < tolerance || k > 100)
    end%
end
