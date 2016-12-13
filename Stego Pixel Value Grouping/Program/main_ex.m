clc;

tic;
stegoImage = 'E:\Kuliah\S2\Semester 1\TD Jaringan Multimedia\Program\stego_Lena.tiff';
EL = 1;

[x_ex, y_ex, stego_image]= readImage(stegoImage);

stegoPixel = getPixel(x_ex, y_ex, stego_image);

[re_pixel, re_message] = extraction(stegoPixel, locationMap, EL);
toc;

waktu = toc