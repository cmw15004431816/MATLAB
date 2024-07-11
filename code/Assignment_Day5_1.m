function [outputImage] = Assignment_Day5_1(inputImage)
disp('Showing the input image...');
pause(1);
figure;
imshow(inputImage);
title('Input image');
pause(2);
disp('Differential encoding in progress...');
inputImage = double(inputImage);
if size(inputImage, 3) == 1
[rows, cols] = size(inputImage);
outputMatrix = zeros(size(inputImage));
outputMatrix(1, 1) = inputImage(1, 1);
for col = 2:cols
    outputMatrix(1, col) = inputImage(1, col) - inputImage(1, col-1);
end
for row = 2:rows
    outputMatrix(row, 1) = inputImage(row, 1) - inputImage(row-1, 1);
    for col = 2:cols
        outputMatrix(row, col) = inputImage(row, col) - inputImage(row, col-1);
    end
end
else
[rows, cols, ~] = size(inputImage);
outputMatrix = zeros(size(inputImage));
for channel = 1:3
outputMatrix(1, 1, channel) = inputImage(1, 1, channel);
for col = 2:cols
    outputMatrix(1, col, channel) = inputImage(1, col, channel) - inputImage(1, col-1, channel);
end
for row = 2:rows
    outputMatrix(row, 1, channel) = inputImage(row, 1, channel) - inputImage(row-1, 1, channel);
    for col = 2:cols
        outputMatrix(row, col, channel) = inputImage(row, col, channel) - inputImage(row, col-1, channel);
    end
end
end
end
save('output.mat', "outputMatrix");
pause(2);
disp('The result has been saved in the file output.mat');
clear all;
pause(1);
disp('All variables has been cleared');
load('output.mat', 'outputMatrix');
pause(1);
disp('The variable outputMatrix has been loaded from the file output.mat');
pause(2);
disp('Showing the differential image...');
pause(1);
figure;
imshow(uint8(abs(outputMatrix)), []);
title('Differential image');
pause(1);
disp('Decoding in progress...');
if size(outputMatrix, 3) == 1
[rows, cols] = size(outputMatrix);
outputImage = zeros(size(outputMatrix));
outputImage(1, 1) = outputMatrix(1, 1);
for col = 2:cols
    outputImage(1, col) = outputMatrix(1, col) + outputImage(1, col-1);
end
for row = 2:rows
    outputImage(row, 1) = outputMatrix(row, 1) + outputImage(row-1, 1);
    for col = 2:cols
        outputImage(row, col) = outputMatrix(row, col) + outputImage(row, col-1);
    end
end
pause(2);
disp('Showing the output image...');
pause(1);
outputImage = uint8(outputImage);
figure;
imshow(outputImage);
title('Output image');
else
[rows, cols, ~] = size(outputMatrix);
outputImage = zeros(size(outputMatrix));
for channel = 1:3
    outputImage(1, 1, channel) = outputMatrix(1, 1, channel);
for col = 2:cols
    outputImage(1, col, channel) = outputMatrix(1, col, channel) + outputImage(1, col-1, channel);
end
for row = 2:rows
    outputImage(row, 1, channel) = outputMatrix(row, 1, channel) + outputImage(row-1, 1, channel);
    for col = 2:cols
        outputImage(row, col, channel) = outputMatrix(row, col, channel) + outputImage(row, col-1, channel);
    end
end
end
pause(2);
disp('Showing the output image...');
pause(1);
outputImage = uint8(outputImage);
figure;
imshow(outputImage);
title('Output image');
end
disp('Done');
end