RGB = imread('rice.jpg');
I = rgb2gray(RGB)
BW = im2bw(I, 0.6)
B = medfilt2(BW)

RGB1 = imread('brown_rice.jpg');
I1 = rgb2gray(RGB1)
BW1 = im2bw(I1, 0.6)
B1 = medfilt2(BW1)

points1 = detectSURFFeatures(B);
points2 = detectSURFFeatures(B1);


[f1,vpts1] = extractFeatures(B,points1);
[f2,vpts2] = extractFeatures(B1,points2);


indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));


figure; showMatchedFeatures(B,B1,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');