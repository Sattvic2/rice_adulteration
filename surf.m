I = imread('rice.jpg');
imshow(I)
I2 = rgb2gray(I)
I3 = im2bw(I2, 0.6)
points = detectSURFFeatures(I3);
figure, imshow(I3); hold on;
plot(points.selectStrongest(10));