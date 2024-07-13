function enhancedImage = Assignment_Day7_1(originalImage, laplacianOperator)
    if size(originalImage, 3) == 3
        grayImage = rgb2gray(originalImage);
    else
        grayImage = originalImage;
    end
    enhancedImage = grayImage;
    grayImage = double(grayImage);
    [imageHeight, imageWidth] = size(grayImage);
    [kernelHeight, kernelWidth] = size(laplacianOperator);
    padHeight = floor(kernelHeight / 2);
    padWidth = floor(kernelWidth / 2);
    paddedImage = padarray(grayImage, [padHeight, padWidth], 'replicate');
    laplacianImage = zeros(imageHeight, imageWidth);
    for i = 1:imageHeight
        for j = 1:imageWidth
            region = paddedImage(i:i+kernelHeight-1, j:j+kernelWidth-1);
            laplacianImage(i, j) = sum(sum(region .* laplacianOperator));
        end
    end
    minValue = min(laplacianImage(:));
    maxValue = max(laplacianImage(:));
    laplacianImage = laplacianImage - minValue;
    laplacianImage = 255 * (laplacianImage / (maxValue - minValue));
    laplacianImage = uint8(laplacianImage);
    enhancedImage = enhancedImage + laplacianImage;
    enhancedImage = mat2gray(enhancedImage);
    enhancedImage = uint8(enhancedImage * 255);
    if size(originalImage, 3) == 3
        enhancedImage = repmat(enhancedImage, [1 1 3]);
    end
end