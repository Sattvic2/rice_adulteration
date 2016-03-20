RGB = imread('rice.jpg');
I = rgb2gray(RGB)
BW = im2bw(I, 0.6)
B = medfilt2(BW)
BW2 = edge(B,'canny');
s = regionprops(BW2,'centroid');
centroids = cat(1, s.Centroid);
imshow(BW2)
hold on
plot(centroids(:,1),centroids(:,2), 'b*')
hold off