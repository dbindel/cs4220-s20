function x = lec11division(d, n)
  % Approximate x = 1/d by n steps of binary long division.

  r = 1;     % Current remainder
  x = 0;     % Current reciprocal estimate
  bit = 0.5; % Value of a one in the current place

  for k = 1:n
    if r > d*bit
      x = x +   bit;
      r = r - d*bit;
    end
    bit = bit/2;
  end
