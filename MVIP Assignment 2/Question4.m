%Qestion 4 - DFT
clear all;
clc;

im1=zeros(512);
im1(240:272,240:272)=255;
figure(1)
imshow(uint8(im1));

im_ff=abs(fft2(im1));
figure(2)
imshow(uint8(im_ff));
figure(3)
im_fft_shift=fftshift(im_ff);
imshow(uint8(im_fft_shift));

%Similar code for other images