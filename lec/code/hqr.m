function [Q,R] = hqr(A)
  % Compute the QR decomposition of an m-by-n matrix A using
  % Householder transformations.

  [m,n] = size(A);
  Q = eye(m);      % Orthogonal transform so far
  R = A;           % Transformed matrix so far

  for j = 1:n

    % -- Find H = I-2vv' to put zeros below R(j,j)
    u    = R(j:end,j);
    u(1) = u(1) + sign(u(1))*norm(u);
    v    = u/norm(u);

    % -- R := HR, Q := QH
    R(j:end,:) = R(j:end,:)-2*v*(v'*R(j:end,:));
    Q(:,j:end) = Q(:,j:end)-(Q(:,j:end)*(2*v))*v';

  end
