function rmax = max_quota(a, n)
  rmax = 1 + max(abs(a(2:n+1)))/abs(a(1));
end
