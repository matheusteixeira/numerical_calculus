function rmin = min_quota(a, n)
  rmin = 1 / (1 + max(abs(a(1:n)))/abs(a(n+1)));
end
