RGB1 = imread('brown_rice.jpg');
I1 = rgb2gray(RGB1)

BW1 = im2bw(I1, 0.4)
B1 = medfilt2(BW1)
BW21 = edge(B1, 'canny');
figure, imshow(BW21)


RGB = imread('rice.jpg');
I = rgb2gray(RGB)
BW = im2bw(I, 0.4)
B = medfilt2(BW)
BW2 = edge(B,'canny');
figure, imshow(BW2)

boxPoints = detectSURFFeatures(BW21);
scenePoints = detectSURFFeatures(BW2);


figure;
imshow(BW21);
title('100 Strongest Feature Points from Box Image');
hold on;
plot(selectStrongest(boxPoints, 100));


figure;
imshow(BW2);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(scenePoints, 300));

[boxFeatures, boxPoints] = extractFeatures(BW21, boxPoints);
[sceneFeatures, scenePoints] = extractFeatures(BW2, scenePoints);

boxPairs = matchFeatures(boxFeatures, sceneFeatures);

matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
matchedScenePoints = scenePoints(boxPairs(:, 2), :);
figure;
showMatchedFeatures(BW21, BW2, matchedBoxPoints, ...
    matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');


%%[tform, inlierBoxPoints, inlierScenePoints] = ...
  %%  estimateGeometricTransform(matchedBoxPoints, matchedScenePoints, 'affine');

%figure;
%showMatchedFeatures(BW21, BW2, inlierBoxPoints, ...
 %   inlierScenePoints, 'montage');
%title('Matched Points (Inliers Only)');

%boxPolygon = [1, 1;...                           % top-left
 %       size(BW21, 2), 1;...                 % top-right
  %      size(BW21, 2), size(BW21, 1);... % bottom-right
   %     1, size(BW21, 1);...                 % bottom-left
    %    1, 1];                   % top-left again to close the polygon
    
%figure;
%imshow(BW2);
%hold on;
%line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
%title('Detected Box');

%%