img=imread("img.jpg");
if size(img,3)==3
    img=rgb2gray(img);
end
[m,n]=size(img);
t=img;
img1=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img1(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img2=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img2(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img3=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img3(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img4=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img4(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img5=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img5(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img6=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img6(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img7=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img7(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
img8=zeros(m,n);
for i=1:1:m
    for j=1:1:n
        img8(i,j)=mod(t(i,j),2);
        t(i,j)=t(i,j)/2;
    end
end
figure
subplot(4,2,1)
imshow(img1)
subplot(4,2,2)
imshow(img2)
subplot(4,2,3)
imshow(img3)
subplot(4,2,4)
imshow(img4)
subplot(4,2,5)
imshow(img5)
subplot(4,2,6)
imshow(img6)
subplot(4,2,7)
imshow(img7)
subplot(4,2,8)

imshow(img8)
