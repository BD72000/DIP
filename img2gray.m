img = imread("img.jpg");  

[rows, cols, channels] = size(img);

gray_img = zeros(rows, cols, 'uint8');

for i = 1:rows
    for j = 1:cols
        R = double(img(i,j,1));
        G = double(img(i,j,2));
        B = double(img(i,j,3));

        gray_val = (R + G + B) / 3;
         gray_img(i,j) = uint8(gray_val);
    end
end
figure;
subplot(1,2,1); imshow(img); 
title('Original RGB Image');
subplot(1,2,2); imshow(gray_img); 

title('Grayscale Image (RGB Average)');
