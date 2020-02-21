% [HX] = p1applyH(obj, X)
%
% Apply H to a sequence of 2D arrays.
%
function [HX] = p1applyH(obj, X)
  [h, w, ~] = size(obj.imblur);
  s = obj.s;
  HX = zeros(size(X));
  for k = 1:size(X,3);
    Xhatk = fft2(X(:,:,k));
    HXhatk = reshape(s .* Xhatk(:), h, w);
    HX(:,:,k) = real(ifft2(HXhatk));
  end
end
