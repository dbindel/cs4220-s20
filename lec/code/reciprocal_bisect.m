function x = lec11bisect(d, n)
  % Approximate x = 1/d by n steps of bisection
  % At each step f(x) = dx-1 is negative at the lower
  % bound, positive at the upper bound.

  hi = 1;   % Current upper bound
  lo = 0;   % Current lower bound

  for k = 1:n
    x  = (hi+lo)/2;
    fx = d*x-1;
    if fx > 0
      hi = x;
    else
      lo = x;
    end
  end
  x = (hi+lo)/2;
