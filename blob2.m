clc
clear all
sigma = 3;

% Filter image with LoG
I = double(rgb2gray(imread('rice.jpg')));
h = fspecial('log', sigma*6, sigma);
B = -imfilter(I,h);
imagesc(B); pause;

% Threshold
B(B < 5) = 0;
imagesc(B); pause;

% Dilate then compare to get all 
% local maximum in 3 pixel radius
Bd = imdilate(B,strel('disk',3));
imagesc(Bd); pause;
P = (B == Bd) .* B;
imagesc(P);

% Get point locations
loc = find(P > 0);
fprintf('There are %d blobs\n',numel(loc));