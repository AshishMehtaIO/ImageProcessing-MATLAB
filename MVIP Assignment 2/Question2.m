%Qestion 2 - Horizontal & Vertical Edge Detection Using Prewitt and Sobel 
%operators
clear all;
clc;


im=imread('Iamges/Bikesgray.jpg');
[m,n]=size(im);

%Padding with zeros
im1=[zeros(1,n);im;zeros(1,n)];
im2=[zeros(m+2,1),im1,zeros(m+2,1)];

%Outputs definition
prewitt_horizontal_result=zeros(m,n);
prewitt_vertical_result=zeros(m,n);
prewitt_combined_result=zeros(m,n);
sobel_horizontal_result=zeros(m,n);
sobel_vertical_result=zeros(m,n);
sobel_combined_result=zeros(m,n);

%Filter Definition
prewitt_horizontal_filter=[-1,-1,-1;0,0,0;1,1,1];
sobel_horizontal_filter=[-1,-2,-1;0,0,0;1,2,1];
prewitt_vertical_filter=[-1,0,1;-1,0,1;-1,0,1];
sobel_vertical_filter=[-1,0,1;-2,0,2;-1,0,1];

for i=(2:m+1)
    for j=(2:n+1)
        filter=sum(sum(double(im2(i-1:i+1,j-1:j+1)).*(prewitt_horizontal_filter)));
        if (filter>255)
            filter=255;
        elseif (filter<0)
            filter=0;
       end
       prewitt_horizontal_result(i-1,j-1)=filter;
       
       
       filter=sum(sum(double(im2(i-1:i+1,j-1:j+1)).*(prewitt_vertical_filter)));
        if (filter>255)
            filter=255;
        elseif (filter<0)
            filter=0;
       end
       prewitt_vertical_result(i-1,j-1)=mean(filter);
    end
end

prewitt_horizontal_result=uint8(prewitt_horizontal_result);
prewitt_vertical_result=uint8(prewitt_vertical_result);
prewitt_combined_result=(prewitt_horizontal_result+prewitt_vertical_result);
figure(1)
imshow(uint8(prewitt_horizontal_result))

figure(2)
imshow(uint8(prewitt_vertical_result))

figure(3)
imshow(uint8(prewitt_combined_result))

%similar code for Sobel
