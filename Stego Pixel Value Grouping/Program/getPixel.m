function [histogram] = getPixel(x, y, image)

k = 1;
for i = 1:x
    for j = 1:y
        value(k) = image(i,j); 
        k = k + 1;
    end
end
histogram = value(:);
end