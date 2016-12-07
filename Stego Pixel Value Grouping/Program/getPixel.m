function [histogram] = getPixel(x, image)

for i = 1:x
    for j = 1:x
        value(i,j) = image(i,j,1); 
    end
end
histogram = value(:);
end