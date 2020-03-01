% [H] = hess_house(A)
%
% Reduce square matrix A to upper Hessenberg form

function A = hess_house(A)

  [n,~] = size(A);
  for j = 1:n-2
    u = reflector(A(j+1:end,j));
    A(j+1:n,j:n) = A(j+1:n,j:n) - 2*u*(u'*A(j+1:n,j:n));
    A(:,j+1:n) = A(:,j+1:n) - 2*(A(:,j+1:n)*u)*u';
    A(j+2:n,j) = 0;
  end
