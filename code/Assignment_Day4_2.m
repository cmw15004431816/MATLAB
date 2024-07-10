function outputImage = Assignment_Day4_2(inputImage, maskImage)
if size(maskImage, 3) == 3
   maskImage = rgb2gray(maskImage);
end
binaryMask = imbinarize(maskImage);
[maskHeight, maskWidth] = size(binaryMask);
resizedImage = imresize(inputImage, [maskHeight, maskWidth]);
if size(resizedImage, 3) == 3
   binaryMask = repmat(binaryMask, [1, 1, 3]);
end
if size(resizedImage) ~= size(binaryMask)
   error('Resized image and mask image must be of the same size.');
end
outputImage = uint8(double(resizedImage) .* double(binaryMask));
end