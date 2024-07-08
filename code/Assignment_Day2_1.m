function [I] = Assignment_Day2_1(filename)
    file = fopen(filename, 'r');
    if file == -1
        error('Cannot open file: %s', filename);
    end
    fseek(file, 18, 'bof');
    width = fread(file, 1, 'int32');
    height = fread(file, 1, 'int32');
    fseek(file, 2, 'cof');
    bitDepth = fread(file, 1, 'int16');
    if bitDepth ~= 24
        error('Only 24-bit BMP files are supported.');
    end
    rowSize = floor((bitDepth * width + 31) / 32) * 4;
    dataSize = rowSize * height;
    fseek(file, 54, 'bof');
    rawData = fread(file, dataSize, 'uint8');
    fclose(file);
    I = reshape(rawData, [rowSize, height]);
    I = I(1:width*3, :);
    I = permute(reshape(I, [3, width, height]), [3, 2, 1]);
    I = uint8(I);
    I = flipud(I);
    I = I(:, :, [3, 2, 1]);
end
