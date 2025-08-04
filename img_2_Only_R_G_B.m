img = imread("img.jpg");  

[rows, cols, channels] = size(img);

red_img = zeros(rows, cols, 3, 'uint8');
red_img(:,:,1) = img(:,:,1);

green_img = zeros(rows, cols, 3, 'uint8');
green_img(:,:,2) = img(:,:,2); 

blue_img = zeros(rows, cols, 3, 'uint8');
blue_img(:,:,3) = img(:,:,3);

figure;
subplot(2,2,1); imshow(img); title('Original RGB Image');
subplot(2,2,2); imshow(red_img); title('Red Only');
subplot(2,2,3); imshow(green_img); title('Green Only');
subplot(2,2,4); imshow(blue_img); title('Blue Only');

