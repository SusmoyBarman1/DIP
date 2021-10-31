% Erosion and Dilation
close all;
clear all;
clc

% Reading input image
input_image = imread('bin_img.png');
input_image = imresize(input_image, [512, 512]);
shape = size(input_image);
[x, y] = size(input_image);

% structuring element
% Create a disk-shaped structuring element with a radius of 11 pixels.
se1 = strel('disk', 11);
erosion_image = imerode(input_image, se1);

% Create a disk-shaped structuring element with a radius of 5 pixels.
se = strel('disk',5);
dilated_image = imdilate(input_image, se);

figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(131), imshow(input_image), title('Original Image', 'FontSize', 15);
subplot(132), imshow(erosion_image), title('Image after Erosion', 'FontSize', 15);
subplot(133), imshow(dilated_image), title('Image after Dilation', 'FontSize', 15);
