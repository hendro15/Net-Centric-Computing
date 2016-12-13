function [pixel, message] = extraction(stegoPixel, locationMap, EL)

group = zeros(0);
pixel = stegoPixel;
message = zeros(0);
index = zeros(0);

for i = 1:length(locationMap)
    if locationMap(i) == 5
        if (isempty(group) == 1)
            message = [message;stegoPixel(i)];
            pixel(i) = 0;
        else
            %decode & set group to zero
            for z = 1:length(index)
                if z == 1
                    avg = int16(stegoPixel(index(z)));
                elseif locationMap(index(z)) == 1
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg >= (-EL - 1)
                        temp = temp1 - 1;
                        pixel(index(z)) = temp;
                    else
                        temp = temp1 + 1;
                        pixel(index(z)) = temp;
                    end
                    
                elseif locationMap(index(z)) == 2
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg == EL
                        message = [message;1];
                        temp2 = temp1 - 1;
                    elseif temp1 - avg == -EL
                        message = [message;1];
                        temp2 = temp1 - 1;
                    else
                        message = [message;0];
                        temp2 = temp1;
                    end
                    temp = avg + floor((temp2 - avg + 1)/2);
                    pixel(index(z)) = temp;
                    
                elseif locationMap(index(z)) == 3
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg > (EL + 1)
                        message = [message;1];
                        temp2 = temp1 - 1;
                    else
                        message = [message;0];
                        temp2 = temp1;
                    end
                    temp = avg + floor((temp2 - avg)/2);
                    pixel(index(z)) = temp;
                    
                end
                temp = (avg*length(index)) - sum(pixel(index(2):index(length(index))));
                pixel(i - length(index) + 1) = temp;
                
            end
            group = zeros(0);
            index = zeros(0);
            
        end
    elseif locationMap(i) == 4
        if (isempty(group) == 1)
            pixel(i) = stegoPixel(i);
        else
            %decode & set group to zero
            for z = 1:length(index)
                if z == 1
                    avg = int16(stegoPixel(index(z)));
                elseif locationMap(index(z)) == 1
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg >= (-EL - 1)
                        temp = temp1 - 1;
                        pixel(index(z)) = temp;
                    else
                        temp = temp1 + 1;
                        pixel(index(z)) = temp;
                    end
                    
                elseif locationMap(index(z)) == 2
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg == EL
                        message = [message;1];
                        temp2 = temp1 - 1;
                    elseif temp1 - avg == -EL
                        message = [message;0];
                        temp2 = temp1;
                    else
                        message = [message;0];
                        temp2 = temp1;
                    end
                    temp = avg + floor((temp2 - avg + 1)/2);
                    pixel(index(z)) = temp;
                    
                elseif locationMap(index(z)) == 3
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg > (EL + 1)
                        message = [message;1];
                        temp2 = temp1 - 1;
                    else
                        message = [message;0];
                        temp2 = temp1;
                    end
                    temp = avg + floor((temp2 - avg)/2);
                    pixel(index(z)) = temp;
                    
                end
            end
            temp = (avg*length(index)) - sum(pixel(index(2):index(length(index))));
            pixel(index(1)) = temp;
            group = zeros(0);
            index = zeros(0);
        end
    elseif locationMap(i) == 0
        if (isempty(group) == 1)
            group = [group;stegoPixel(i)];
            index = [index;i];
            
        else
            %decode & set group, index to zero
            for z = 1:length(index)
                if z == 1
                    avg = int16(stegoPixel(index(z)));
                elseif locationMap(index(z)) == 1
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg >= (-EL - 1)
                        temp = temp1 - 1;
                        pixel(index(z)) = temp;
                    else
                        temp = temp1 + 1;
                        pixel(index(z)) = temp;
                    end
                    
                elseif locationMap(index(z)) == 2
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg == EL
                        message = [message;1];
                        temp2 = temp1 - 1;
                    elseif temp1 - avg == -EL
                        message = [message;1];
                        temp2 = temp1 - 1;
                    else
                        message = [message;0];
                        temp2 = temp1;
                    end
                    temp = avg + floor((temp2 - avg + 1)/2);
                    pixel(index(z)) = temp;
                    
                elseif locationMap(index(z)) == 3
                    temp1 = int16(stegoPixel(index(z)));
                    if temp1 - avg > (EL + 1)
                        message = [message;1];
                        temp2 = temp1 - 1;
                    else
                        message = [message;0];
                        temp2 = temp1;
                    end
                    temp = avg + floor((temp2 - avg)/2);
                    pixel(index(z)) = temp;
                end
                temp = (avg*length(index)) - sum(pixel(index(2):index(length(index))));
                pixel(index(1)) = temp;
                group = zeros(0);
                index = zeros(0);
            end
        end
    elseif locationMap(i) == 1
        group = [group;stegoPixel(i)];
        index = [index;i];
        
    elseif locationMap(i) == 2
        group = [group;stegoPixel(i)];
        index = [index;i];
        
    elseif locationMap(i) == 3
        group = [group;stegoPixel(i)];
        index = [index;i];
        
    end
end

end