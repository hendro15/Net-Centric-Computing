%----------------------------------------------------------------
% Resize image to specific pixel and save image to jpg file
% function [result] = resize (x, image)
% x = pixel size, image = file image + directory
%----------------------------------------------------------------

function [result] = resize (x, image, path)

result = imresize(image,[x x]);
[pathstr, name, ext] = fileparts(path);
filename = strcat(int2str(x), '_',name,'.jpg');
imwrite(result, filename);

end