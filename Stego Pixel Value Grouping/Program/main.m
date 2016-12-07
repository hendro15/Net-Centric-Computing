clear;
clc;

image = 'E:\Kuliah\S2\Semester 1\TD Jaringan Multimedia\Medical Image Database\Chest.jpg';
pixelSize = 256;

[x, y, my_image]= readImage(image);

resImage = resize(pixelSize, my_image, image);

pixel = getPixel(pixelSize, resImage);
% [zero, z_index, nonzero, n_index] = groupingPixel(pixel);

msg = randi([0 1], length(pixel), 1);

tic;
[newHistogram, locationMap] = embedding(msg, pixel);

newImage = createImage(newHistogram, resImage, pixelSize);
toc;

waktu = toc
figure(1), imshow(resImage), title('Before');
figure(2), imshow(newImage), title('After');