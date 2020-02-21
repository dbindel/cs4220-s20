% [obj] = p1setup
%
% Set up the image and blurring kernel used in project 2.
% The output object contains the following fields
%   imblur  - height-by-width-by-3 matrix.  The third index corresponds
%             to the RGB components of the pixel colors.
%   imblurf - Fourier transformed version of the blurred image
%   PSF     - point spread function
%   s       - Ordered eigenvalues of the blurring operator
%
function [obj] = p1setup()

  % Load the image
  obj = [];
  obj.imblur = imread('../data/blurry.png');

  % Generate the Fourier transformed version
  obj.imblurf = double(obj.imblur);
  for k = 1:3
    obj.imblurf(:,:,k) = fft2(obj.imblurf(:,:,k));
  end

  % NB: Since some students use Octave (which does not have fspecial),
  %     I provide the blurring kernel matrix in a .mat file.
  %     The default behavior of this script is to load from that file.
  %
  %K = fspecial('motion', 30, 20);
  K = load('../data/K.mat', '-ascii');
  obj.PSF = K;

  % Pad, shift to recenter, and Fourier transform
  [h,w,~] = size(obj.imblur);
  center = (size(K)+1)/2;
  PSF = zeros(h, w);
  PSF(1:size(K,1), 1:size(K,2)) = K;
  PSFfft = fft2(circshift(PSF, 1-center));
  obj.s = PSFfft(:);

end
