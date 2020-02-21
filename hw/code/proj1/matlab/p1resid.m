% [resid] = p1resid(obj, im)
% [resid] = p1resid(obj, lambda)
%
% Produce a residual norm for the deblurring problem.
%
function [resid] = p1resid(obj, im)

  if length(im) == 1
    im = p1tikhonovd(obj, im);
  end

  [h, w, ~] = size(obj.imblur);
  s = obj.s;
  b = obj.imblur;
  resid2 = 0;
  for k = 1:3
    xhat = fft2(double(im(:,:,k)));
    x    = real(ifft2(reshape(s .* xhat(:), h, w)));
    r    = x-double(b(:,:,k));
    resid2 = resid2 + r(:)'*r(:);
  end
  resid = sqrt(resid2);
end
