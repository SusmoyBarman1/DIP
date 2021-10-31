% Erosion and Dilation
close all;
clc

% Reading input image
input_image = imread('bin_img.png');
input_image = imresize(input_image, [512, 512]);
shape = size(input_image);
[x, y] = size(input_image);

% Create a disk-shaped structuring element with a radius of 5 pixels.
se = strel('disk',5);
afterOpening = imopen(input_image, se);

% Create a disk-shaped structuring element with a radius of 5 pixels.
se = strel('disk',5);
afterOpening = imopen(input_image, se);

% Create a disk-shaped structuring element with a radius of 5 pixels.
se = strel('disk',5);
afterClose = imclose(input_image, se);

figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(131), imshow(input_image), title('Original Image', 'FontSize', 15);
subplot(132), imshow(afterOpening), title('Image after Opening Operation', 'FontSize', 15);
subplot(133), imshow(afterClose), title('Image after closing operation', 'FontSize', 15);
