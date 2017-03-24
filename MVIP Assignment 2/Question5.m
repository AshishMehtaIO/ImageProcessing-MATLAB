clear;
clc;
A = imread('Images/icextl.tif');
[m, n] = size(A);
Num_pix = m * n;

figure(1)
histogram(A)
figure(2)
A_eq=histeq(A);
histogram(A_eq)
imshow(A_eq)

filter=[1 1 1; 1 -16 1; 1 1 1];

Yr = [zeros(1,n);A;zeros(1,n)];
Y = [zeros(m+2,1),Yr,zeros(m+2,1)];

for p = 2: m+1
    for q = 2: n+1
        mask= Y(p-1:p+1,q-1:q+1);
        temp= filter .* double(mask);
        Result(p-1,q-1) = sum(temp(:));
    end
end
    Result = uint8(Result);
    figure(3)
    imshow(Result);
    Combined = Result + A_eq;
    figure(4)
imshow(Combined);
