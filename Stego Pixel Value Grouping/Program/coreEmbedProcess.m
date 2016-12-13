function [newPixel, lm] = coreEmbedProcess(constantValue, pixel, message)

d = (int16(pixel)) - (int16(constantValue));

if (d == 1)
    lm = 3;
    newD = d + message;
    newPixel = newD + pixel;
    
elseif(d == 0)
    lm = 2;
    newD = -message;
    newPixel = newD + pixel;
else
    lm = 1;
    newD = d - message;
    newPixel = newD + pixel;
end

end