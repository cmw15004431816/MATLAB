function [J] = Assignment_Day2_2(I)
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    J = 0.299 * R + 0.587 * G + 0.114 * B;
    J = uint8(J);
    imwrite(J, 'output.bmp');
end