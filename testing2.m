RGB = imread('rice.jpg');
imshow(RGB)

I = rgb2gray(RGB)
figure, imshow(I)

BW = im2bw(I, 0.4)
figure, imshow(BW)

B = medfilt2(BW)
figure, imshow(B)

BW2 = edge(B,'canny');
figure, imshow(BW2)

BW1 = edge(B,'sobel');
figure, imshow(BW1)

BW1(BW1< 5) = 0;
imagesc(B); pause;