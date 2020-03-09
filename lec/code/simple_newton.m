% [x] = simple_newton(f, df, x, rtol, maxiter)
%
% Use Newton iteration to find a solution to f(x) = 0.
% Terminates after maxiter steps or when we reach the
% residual tolerance rtol.  Applies a simple guard condition
% to improve robustness.
%
% Args:
%   f:  Function that returns f(x)
%   df: Function that returns f'(x)
%   x:  Starting guess
%   rtol: Residual tolerance (default 1e-6)
%   maxiter: Maximum function evaluations (default 100)
% 
function x = simple_newton(f, df, x, rtol, maxiter)

  % Set default parameter values
  if nargin < 4, rtol = 1e-6;   end
  if nargin < 5, maxiter = 100; end

  fx = f(x);
  dfx = df(x);
  dx = -fx/dfx;

  fevals = 1;
  while (abs(fx) > rtol) & (fevals < maxiter)
    xnew = x+dx;
    fxnew = f(xnew);
    
    if abs(fxnew) < abs(fx)
    
      % Accept a step (and compute a new Newton update) if it reduces |f(x)|
      x   = xnew;
      fx  = fxnew;
      dfx = df(x);
      dx  = -fx/dfx;
      
    else

      % If we increase |f(x)|, try a smaller update
      dx = dx/2;
 
    end
  end