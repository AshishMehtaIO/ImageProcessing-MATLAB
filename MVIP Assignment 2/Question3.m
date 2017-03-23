clear;
clc;
I= imread('barbara_gray.bmp');
figure(1)
imshow(I);
[m, n]= size(I);
Z=I;
Yr = [zeros(1,n);Z;zeros(1,n)];
Y = [zeros(m+2,1),Yr,zeros(m+2,1)];
Y = double(Y);
filter=[1 1 1; 1 -8 1; 1 1 1];
temp = zeros(3,3);
for p = 2:513
    for q = 2: 513
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
    
    
