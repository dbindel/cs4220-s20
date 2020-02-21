% Set up filter
h   = fspecial('motion', 30, 20);

im1 = imread('../data/origimg.jpg');
image(im1);
im2 = imfilter(im1, h, 'circular');
imwrite(im2, '../data/blurry.png');
