
function [x, y, my_image] = readImage(image)

%read the image
my_image = imread(image);
[x, y, z] = size(my_image);

end