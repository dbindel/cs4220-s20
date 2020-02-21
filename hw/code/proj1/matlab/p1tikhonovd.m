% [imresult] = p1tikhonov(obj, lambda, rhs)
%
% Produce an image by Tikhonov deblurring with parameter lambda.
%
function [imresult] = p1tikhonovd(obj, lambda, rhs)

  if nargin < 3
    b = obj.imblur;
  else
    b = rhs;
  end

  [h, w, ~] = size(obj.imblur);
  s = obj.s;
  f = conj(s) ./ (conj(s) .* s + lambda^2);
  imresult = zeros(size(b));
  for k = 1:size(b,3)
    bhat = fft2(b(:,:,k));
    X = reshape(f .* bhat(:), h, w);
    imresult(:,:,k) = real(ifft2(X));
  end
end
