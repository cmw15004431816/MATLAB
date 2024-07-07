function [min] = Assignment_Day1_3(A)
[rows, cols] = size(A);
min = realmax;
for i = 1:rows
    for j = 1:cols
        if A(i, j) < min
            min = A(i, j);
        end
    end
end
end