% [imresult] = p1tikhonov(obj, lambda)
%
% Produce an image by Tikhonov deblurring with parameter lambda.
%
function [imresult] = p1tikhonov(obj, lambda)
  [h, w, ~] = size(obj.imblur);
  s = obj.s;
  b = obj.imblur;
  f = conj(s) ./ (conj(s) .* s + lambda^2);
  imresult = obj.imblur;
  for k = 1:3
    bhat = fft2(b(:,:,k));
    X = reshape(f .* bhat(:), h, w);
    imresult(:,:,k) = real(ifft2(X));
  end
end
