function Assignment_Day2_5(I)
if ~islogical(I) && ~ismember(unique(I), [0, 1])
        error('Input image must be a binary image with values 0 and 1.');
end
    count0 = sum(I(:) == 0);
    count1 = sum(I(:) == 1);
    count = [count0 count1];
    figure;
    bar([0, 1], count, 'BarWidth', 0.5, 'FaceColor', 'b');
    title('Pixel Value Counts in Binary Image');
    xlabel('Pixel Value');
    ylabel('Count');
    xticks([0 1]);
    xticklabels({'0 (Black)', '1 (White)'});
    grid on;
end