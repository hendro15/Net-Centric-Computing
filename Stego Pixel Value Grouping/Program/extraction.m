function [pixel, message] = extraction(stegoPixel, locationMap)

group = zeros(0);
pixel = zeros(0);
message = zeros(0);

for i = 1:length(locationMap)
    if locationMap(i) == 5
        message = [message;stegoPixel(i)];
        pixel = [pixel;0];
    elseif locationMap(i) == 4
        pixel = [pixel;stegoPixel(i)];
    elseif locationMap(i) == 0
        if (isempty(group) == 1)
            group = [group;stegoPixel(i)];
        else
            %decode/extract
        end
    elseif locationMap(i) == 1
        group = [group;stegoPixel(i)];
    elseif locationMap(i) == 2
        group = [group;stegoPixel(i)];
    elseif locationMap(i) == 3
        group = [group;stegoPixel(i)];
    end
end

end