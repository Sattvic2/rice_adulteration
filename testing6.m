RGB = imread('rice.jpg');
I = rgb2gray(RGB)
BW = im2bw(I, 0.4)
B = medfilt2(BW)
BW2 = edge(B,'canny');
figure, imshow(BW2)




RGB1 = imread('brown_rice.jpg');
I1 = rgb2gray(RGB1)
BW1 = im2bw(I1, 0.4)
B1 = medfilt2(BW1)
BW21 = edge(B1, 'canny');
figure, imshow(BW21)


points1 = detectSURFFeatures(BW2);
points2 = detectSURFFeatures(BW21);


[f1,vpts1] = extractFeatures(BW1,points1);
[f2,vpts2] = extractFeatures(BW21,points2);


indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));


figure; showMatchedFeatures(BW1,BW21,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');
