% [H] = bidiag_house(A)
%
% Reduce square matrix A to bidiagonal form

function A = bidiag_house(A)

  [n,~] = size(A);
  for j = 1:n-1

    % Introduce zeros in column j (below diagonal)
    u = reflector(A(j:end,j));
    A(j:n,j:n) = A(j:n,j:n) - 2*u*(u'*A(j:n,j:n));

    % Introduce zeros in row j (right of superdiagonal)
    u = reflector(A(j,j+1:end)');
    A(j:n,j+1:n) = A(j:n,j+1:n) - 2*(A(j:n,j+1:n)*u)*u';

  end
