%Qestion 2 - Horizontal & Vertical Edge Detection Using Prewitt (Concise)
clear;
clc;
I= imread('Images/Bikesgray.jpg');
figure(1)
imshow(I);
[m, n]= size(I);
Z=I;
%Padding with zeros
Yr = [zeros(1,n);Z;zeros(1,n)];
Y = [zeros(m+2,1),Yr,zeros(m+2,1)];
Y = double(Y);
%Filter Definition
filter1=[1 1 1; 0 0 0; -1 -1 -1];
filter2=[-1 0 1; -1 0 1; -1 0 1];
% Temporary matrix for storing the convoluted values
temp1= zeros(3,3);
temp2= zeros(3,3);

for p = 2: m+1
    for q = 2: n+1
        mask= Y(p-1:p+1,q-1:q+1);
        temp1= filter1 .* mask;
        temp2 = filter2 .*mask;
        Result1(p-1,q-1) = sum(temp1(:));
        Result2(p-1,q-1) = sum(temp2(:));
    end
end
    Result1 = uint8(Result1);
    Result2 = uint8(Result2);
    figure(2)
    imshow(Result1);
    figure(3)
    imshow(Result2);
    Result =Result1 + Result2;
    figure(4)
    imshow(Result);
    
    
