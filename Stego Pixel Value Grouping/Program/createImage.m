function [newPixel] = createImage(newHistogram, oldPixel, x, y, path)

newPixel = oldPixel;
k = 1;
for i = 1:x
    for j = 1:y
       newPixel(i,j) = newHistogram(k);
       k = k + 1;
    end
end

[pathstr, name, ext] = fileparts(path);
filename = strcat('stego_',name,'.tiff');
imwrite(newPixel, filename);

end