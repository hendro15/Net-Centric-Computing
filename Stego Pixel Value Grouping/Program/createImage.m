function [newPixel] = createImage(newHistogram, oldPixel, x)

newPixel = oldPixel;
k = 1;
for i = 1:x
    for j = 1:x
       newPixel(i,j,1) = newHistogram(k);
       k = k + 1;
    end
end

end