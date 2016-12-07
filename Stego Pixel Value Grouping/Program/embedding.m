function [newHistogram, locationMap] = embedding(message, histogram)

newHistogram = histogram;
groupMatx = int16(zeros(0));
p = length(histogram);
locationMap = zeros(p,1);
temp = 0;
u = 1;

for i = 1:length(histogram)
    if (histogram(i) == 0)
        newHistogram(i) = message(u);
        locationMap(i,1) = 5;
        u = u + 1;
               
    elseif (histogram(i) ~= 0) % (1)
        if(isempty(groupMatx) == 1) % (2)
            groupMatx = [groupMatx;histogram(i)];
            temp = i;
            locationMap(i) = 4;
        else
            if((temp + 1) == i) % (3)
                y = (int16(histogram(i))) - groupMatx(1,1);
                % pisahkan nilai y = 1, y = -1, dan y = 0
                if(y <= 1 && y >= -1) % (4)
                    groupMatx = [groupMatx;histogram(i)];
                    temp = i;
                else
                    locationMap(i) = 4;
                    if(length(groupMatx) > 1) % (5)
                        for z = 1:length(groupMatx)
                            if z == 1
                                f = floor(mean(groupMatx));
                                newHistogram(i - length(groupMatx)) = f;
                                locationMap(i - (length(groupMatx)),1) = 0;
                            else
                                [newHistogram(i - ((length(groupMatx))-1)), lm] = coreEmbedProcess(f, groupMatx(z), message(u));
                                locationMap(i - ((length(groupMatx))-1),1) = lm;
                                u = u + 1;
                            end
                        end
                        groupMatx = int16(zeros(0));
                    else
                        groupMatx(1) = histogram(i);
                        temp = i;
                        locationMap(i,1) = 4;
                    end
                end
            else
                if(length(groupMatx) > 1) % (6)
                    for z = 1:length(groupMatx)
                        if z == 1
                            f = floor(mean(groupMatx));
                            newHistogram(i - length(groupMatx)) = f;
                            locationMap(i - (length(groupMatx)),1) = 0;
                        else
                            [newHistogram(i - ((length(groupMatx))-1)), lm] = coreEmbedProcess(f, groupMatx(z), message(u));
                            locationMap(i - ((length(groupMatx))-1),1) = lm;
                            u = u + 1;
                        end
                    end
                    groupMatx = int16(zeros(0));
                else
                    groupMatx(1) = histogram(i);
                    temp = i;
                    locationMap(i,1) = 4;
                end
            end
        end
    else
        if (length(groupMatx) > 1) % (7)
            for z = 1:length(groupMatx)
                if z == 1
                    f = floor(mean(groupMatx));
                    newHistogram(i - length(groupMatx)) = f;
                    locationMap(i - (length(groupMatx)),1) = 0;
                else
                    [newHistogram(i - ((length(groupMatx))-1)), lm] = coreEmbedProcess(f, groupMatx(z), message(u));
                    locationMap(i - ((length(groupMatx))-1),1) = lm;
                    u = u + 1;
                end
            end
            groupMatx = int16(zeros(0));
        else
            groupMatx(1) = histogram(i);
            temp = i;
            locationMap(i,1) = 4;
        end
    end
end
end