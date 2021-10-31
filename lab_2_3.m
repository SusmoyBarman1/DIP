clc;
close all;
clear all;

img = imread('gry.jpg');
img = imresize(img, [512 512]);

[rows, columns] = size(img);

mask = 224; %3bit mask

%imhist(img);

three_msb_img = img;

three_msb_img(:,:) = bitand(img(:, :), mask);

%imhist(output_img)

difference_image = imabsdiff(img, three_msb_img);


figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(three_msb_img);
title('Three MSB image');

subplot(2,2,3);
imshow(difference_image);
title('Difference Image');

