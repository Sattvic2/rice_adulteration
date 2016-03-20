clc
clear all
RGB = imread('raw_rice.jpg');
imshow(RGB)

%I = rgb2gray(RGB)
%figure, imshow(I)

BW = im2bw(RGB, 0.4)
figure, imshow(BW)

B = medfilt2(BW)
figure, imshow(B)

BW2 = edge(B,'canny');
figure, imshow(BW2)

BW1 = edge(B,'sobel');
figure, imshow(BW1)

s = regionprops(BW2,'Area');
disp(s)

s2 = regionprops(BW2, 'BoundingBox' );

imhist(BW1)