function [max] = Assignment_Day1_4(A)
[rows, cols] = size(A);
max = realmin;
for i = 1:rows
    for j = 1:cols
        if A(i, j) > max
            max = A(i, j);
        end
    end
end
end