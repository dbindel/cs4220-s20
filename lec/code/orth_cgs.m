function [Q,R] = orth_cgs(A)

  [m,n] = size(A);
  Q = zeros(m,n);
  for j = 1:n
    v = A(:,j);           % Take the jth original basis vector
    rp = Q(:,1:j-1)'*v;   % Project v onto previous basis vectors     
    v = v-Q(:,1:j-1)*rp;  % Make it orthogonal to q_i, i = 1:j-1
    R(1:j-1,j) = rp;      % Update R with multipliers
    R(j,j) = norm(v);     % Get the normalizing factor
    v = v/R(j,j);         % Normalize what remains
    Q(:,j) = v;           % Append the result to the basis
  end
