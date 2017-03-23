clear;
clc;
A = imread('icextl.gif');
[m, n] = size(A);
Num_pix = m * n;

figure(1)
imshow(A);
title('Original Image');

Hist = uint8(zeros(m,n));

Nk = zeros(256, 1);
Pk = zeros(256, 1);
Sk = zeros(256, 1);
Output = zeros(256, 1);

for i=1:m
    for j=1:n
        value = A(i,j);
        Nk(value + 1) = Nk(value + 1) + 1;
        Pk(value + 1) = Nk(value + 1)/Num_pix;
    end
end

Sum = 0;
Levels = 255;

for i=1:size(Pk)
    Sum = Sum + Pk(i);
    Sk(i) = Sum;
    Output(i) = round(Sk(i) * Levels);
end

for i=1:m
    for j=1:n
        Hist(i,j) = Output(A(i,j)+1);
    end
end

Z=Hist;
figure(2)
imshow(Z);

Yr = [zeros(1,n);Z;zeros(1,n)];
Y = [zeros(m+2,1),Yr,zeros(m+2,1)];
Y = double(Y);
filter=[1 1 1; 1 -8 1; 1 1 1];
temp = zeros(3,3);
for p = 2: m+1
    for q = 2: n+1
        mask= Y(p-1:p+1,q-1:q+1);
        temp= filter .* mask;
        Result(p-1,q-1) = sum(temp(:));
    end
end
    Result = uint8(Result);
    figure(3)
    imshow(Result);
    Combined = Result + Z;
    figure(4)
    imshow(Combined);

        