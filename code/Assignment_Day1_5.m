function [array] = Assignment_Day1_5(A)
[rows, cols] = size(A);
array = zeros(rows*cols, 1);
for i = 1:rows*cols
    min = realmax;
    for j = 1:rows
        for k = 1:cols
            if A(j, k) < min
                min = A(j, k);
                min_a = j;
                min_b = k;
            end
        end
    end
    array(i, 1) = min;
    A(min_a, min_b) = realmax;
end
end