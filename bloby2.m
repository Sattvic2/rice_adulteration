RGB = imread('rice.jpg');
I = rgb2gray(RGB)
BW = im2bw(I, 0.6)
B = medfilt2(BW)
BW1 = edge(B,'canny');




