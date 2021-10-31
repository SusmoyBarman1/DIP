% Boundary Extraction using erosion
close all;
clc

% Reading input image
input_image = imread('bin_img.png');
input_image = imresize(input_image, [512, 512]);
shape = size(input_image);
[x, y] = size(input_image);

% Create a disk-shaped structuring element with a radius of 5 pixels.
se = strel('disk',5);
erotedImage = imerode(input_image, se);%Erode the image by structuring element

boundaryImage = input_image - erotedImage;

figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(131), imshow(input_image), title('Original Image', 'FontSize', 15);
subplot(132), imshow(erotedImage), title('Image after Erosion', 'FontSize', 15);
subplot(133), imshow(boundaryImage), title('Extracted Boundary', 'FontSize', 15);