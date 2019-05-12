function xi = locate_roots(f, boundaries)
    h = 0.1;
    A = boundaries(1);
    B = boundaries(2);

    x = A:h:B;
    y = f(x);
    numraizes = 0;
    for i = 1 : (length(x) - 1)
    y(i);
    y(i+1);
      if (y(i)*y(i + 1)) < 0 && abs(y(i))<10*h && abs(y(i + 1))<10*h
          i;
          numraizes = numraizes + 1;
          xi(numraizes) = 0.5*(x(i) + x(i + 1));
      end
    end
end
