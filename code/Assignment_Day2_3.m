function Assignment_Day2_3(I)
if size(I, 3) ~= 1
    error('Input image must be a grayscale image.');
end
Counter = zeros(256, 1);
for i = 0:255
    Counter(i + 1) = sum(I(:) == i);
end
    figure;
    bar(0:255, Counter, 'BarWidth', 1, 'FaceColor', 'k');
    title('Pixel Value Histogram');
    xlabel('Pixel Value');
    ylabel('Count');
    xlim([0 255]);
    grid on;
end