function [zero, z_index, nonzero, n_index] = groupingPixel(histogram)

zero = zeros(0);
z_index = zeros(0);
nonzero = zeros(0);
n_index = zeros(0);

for i = 1:length(histogram)
    if(histogram(i) == 0)
        zero = [zero;histogram(i)];
        z_index = [z_index;i];
    else
        nonzero = [nonzero;histogram(i)];
        n_index = [n_index;i];
    end
end

end