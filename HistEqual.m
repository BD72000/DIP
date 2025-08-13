img = imread("C:\Users\bhavy\Downloads\img.jpg");
if size(img, 3) == 3
    img = rgb2gray(img);
end
[m,n]=size(img);
x = zeros(1, 256);
for i=1:1:m
    for j=1:1:n
        x(img(i,j)+1)=x(img(i,j)+1)+1;
    end
end

pdf=zeros(1,256);
for i=0:1:255
    pdf(i+1)=x(i+1)/(m*n);
end
cdf=zeros(1,256);
cdf(1)=pdf(1);
for i=1:1:255
    cdf(i+1)=pdf(i+1)+cdf(i);
end
norm=zeros(1,256);
for i=1:1:256
    norm(i)=uint8(255*cdf(i));
end
equl_img=img;
for i=1:1:m
    for j=1:1:n
        equl_img(i,j)=norm(equl_img(i,j)+1);
    end
end
x1=zeros(1,256);
for i=1:1:m
    for j=1:1:n
        x1(equl_img(i,j)+1)=x1(equl_img(i,j)+1)+1;
    end
end
figure;
subplot(2,2,1)
imhist(img)
subplot(2,2,2)
imhist(equl_img)
subplot(2,2,3)
imshow(equl_img)
subplot(2,2,4)
imshow(img)
