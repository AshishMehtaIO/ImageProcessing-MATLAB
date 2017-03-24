% Question 3 - Image sharpening using Laplacian
clear;
clc;
I= imread('Images/barbara_gray.bmp');
figure(1)
imshow(I);
[m, n]= size(I);
Z=I;

% Pad the image with zeros
Yr = [zeros(1,n);Z;zeros(1,n)];
Y = [zeros(m+2,1),Yr,zeros(m+2,1)];
Y = double(Y);

% Filter Definition
% Center Value = -(xA - 1) where A = No of elements
filter=[1 1 1; 1 -8 1; 1 1 1]; 

% Temporary matrix for storing the convoluted values
temp = zeros(3,3);

% Application of the filter on the image
for p = 2:m+1
    for q = 2: n+1
        mask= Y(p-1:p+1,q-1:q+1);
        temp= filter .* mask;
        Result(p-1,q-1) = sum(temp(:));
    end
end
    Result = uint8(Result);
    figure(2)
    imshow(Result);
    Combined = Result + Z;
    figure(3)
    imshow(Combined);
    
    
