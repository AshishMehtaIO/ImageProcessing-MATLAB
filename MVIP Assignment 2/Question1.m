%Qestion 1 - Salt Pepper noise removal using Median Filter
clear all;
clc;

im=imread('Images/barbara_gray.bmp');
[m,n]=size(im);

for i=(1:400)
row=round((m-1).*rand() + 1);
column=round((n-1).*rand() + 1);

if(im(row,column)>127)
    im(row,column)=0;
else
    im(row,column)=255;
end
end
figure(1)
imshow(im);

%Padding with zeros for the filter convolution
im1=[zeros(1,n);im;zeros(1,n)];
im2=[zeros(m+2,1),im1,zeros(m+2,1)];
result=zeros(m,n);

for i=(2:m+1)
    for j=(2:n+1)
        filter=im2(i-1:i+1,j-1:j+1);
        result(i-1,j-1)=median(filter(:));
    end
end
result=uint8(result);       
figure(2)
imshow(result);
