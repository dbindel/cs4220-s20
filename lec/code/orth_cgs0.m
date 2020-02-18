function [Q] = orth_cgs(A)

  [m,n] = size(A);
  Q = zeros(m,n);
  for j = 1:n
    v = A(:,j);                    % Take the jth original basis vector
    v = v-Q(:,j-1)*(Q(:,j-1)'*v);  % Make it orthogonal to q_i, i = 1:j-1
    v = v/norm(v);                 % Normalize what remains
    Q(:,j) = v;                    % Append the result to the basis
  end
