function Assignment_Day8_1(imagePath)
    I = imread(imagePath);
    grayImage = rgb2gray(I);
    BW = edge(grayImage, 'canny');
    [H, T, R] = hough(BW);
    P = houghpeaks(H, 10, 'threshold', ceil(0.3 * max(H(:))));
    lines = houghlines(BW, T, R, P);
    figure, imshow(I), hold on
    title('Detected Lines');
    longestLines = struct('point1', {}, 'point2', {}, 'length', {});
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        len = norm(lines(k).point1 - lines(k).point2);
        if length(longestLines) < 3
            longestLines(end+1).point1 = lines(k).point1;
            longestLines(end).point2 = lines(k).point2;
            longestLines(end).length = len;
        else
            [~, minIndex] = min([longestLines.length]);
            if len > longestLines(minIndex).length
                longestLines(minIndex).point1 = lines(k).point1;
                longestLines(minIndex).point2 = lines(k).point2;
                longestLines(minIndex).length = len;
            end
        end
    end
    for k = 1:length(longestLines)
        if isempty(longestLines(k).point1) || isempty(longestLines(k).point2)
            continue;
        end
        xy = [longestLines(k).point1; longestLines(k).point2];
        plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'red');
        plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
        plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'green');
    end
    hold off;
end
