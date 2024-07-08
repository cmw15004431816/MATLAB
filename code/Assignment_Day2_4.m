function [J] = Assignment_Day2_4(I)
K = Assignment_Day2_2(I);
level = 128;
J = K > level;
imwrite(J, 'output.bmp');
end