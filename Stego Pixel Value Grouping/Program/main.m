clear;
clc;

image = 'E:\Kuliah\S2\Semester 1\TD Jaringan Multimedia\Program\Lena.tiff';

% Use pixelSize for resize image
% pixelSize = 512;

[x, y, my_image]= readImage(image);

% convert to grayscale
my_image = rgb2gray(my_image);

% resImage = resize(pixelSize, my_image, image);

oriPixel = getPixel(x, y, my_image);
% [zero, z_index, nonzero, n_index] = groupingPixel(pixel);

msg = randi([0 1], length(oriPixel), 1);

tic;
[newHistogram, locationMap] = embedding(msg, oriPixel);

newImage = createImage(newHistogram, my_image, x, y, image);
toc;

waktu = toc
figure(1), imshow(my_image), title('Before');
figure(2), imshow(newImage), title('After');