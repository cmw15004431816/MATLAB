function images = Assignment_Day4_1(image1, image2, number, option)
if option == 1
if size(image1) ~= size(image2)
    error('Input images must be of the same size.');
end
images = zeros([size(image1), number], 'like', image1);
for i = 1:floor(number/2)
    factor = (i - 1) / (floor(number/2) - 1);
    images(:, :, :, i) = (1 - factor) * image1;
end
for i = 1:floor(number/2)
    factor = (i - 1) / (floor(number/2) - 1);
    images(:, :, :, i + floor(number/2)) = factor * image2;
end
images(:, :, :, number) = image2;
else
if size(image1) ~= size(image2)
    error('Input images must be of the same size.');
end
images = zeros([size(image1), number], 'like', image1);
for i = 1:number
    factor = (i - 1) / (number - 1);
    images(:, :, :, i) = (1 - factor) * image1 + factor * image2;
end
end