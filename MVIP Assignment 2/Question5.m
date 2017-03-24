%Question 5 - Image enhancement and noise removal 
clear;
clc;
A = imread('Images/icextl.tif');
[m, n] = size(A);
Num_pix = m * n;
% plot the histogram of original image
figure(1)
histogram(A)
A_eq=histeq(A);
% plot the histogram of histogram equalized image
figure(2)
histogram(A_eq)
% display the histogram equlized image
figure(3)
imshow(A_eq)

% Filter Definition
% Center Value = -(xA - 1) where A = No of elements
filter=[1 1 1; 1 -17 1; 1 1 1];    

% Padding with zeros
Yr = [zeros(1,n);A;zeros(1,n)];
Y = [zeros(m+2,1),Yr,zeros(m+2,1)];

% Sharpening of the Image
for p = 2: m+1
    for q = 2: n+1
        mask= Y(p-1:p+1,q-1:q+1);
        temp= filter .* double(mask);
        Result(p-1,q-1) = sum(temp(:));
    end
end
    Result = uint8(Result);
    figure(4)
    imshow(Result);
    Combined = Result + A_eq;
    figure(5)
    imshow(Combined);
