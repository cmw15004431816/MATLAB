function [B] = Assignment_Day1_2(A)
[cols, rows] = size(A);
B=zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        B(i, j) = A(j, i);
    end
end
end