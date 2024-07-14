function Assignment_Day8_2(imagePath)
    I = imread(imagePath);
    grayImage = rgb2gray(I);
    binaryImage = imbinarize(grayImage);
    binaryImage = imopen(binaryImage, strel('disk', 5));
    binaryImage = imclose(binaryImage, strel('disk', 5));
    binaryImage = imfill(binaryImage, 'holes');
    labeledImage = bwlabel(binaryImage);
    stats = regionprops(labeledImage, 'Area', 'PixelIdxList');
    [~, sortedIndices] = sort([stats.Area], 'descend');
    figure, imshow(I), hold on
    title('Detected Areas');
    for k = 1:min(3, length(sortedIndices))
        pixelIdxList = stats(sortedIndices(k)).PixelIdxList;
        regionMask = false(size(binaryImage));
        regionMask(pixelIdxList) = true;
        boundaries = bwboundaries(regionMask);
        for b = 1:length(boundaries)
            boundary = boundaries{b};
            plot(boundary(:,2), boundary(:,1), 'LineWidth', 2, 'Color', 'green');
        end
    end
    hold off;
end