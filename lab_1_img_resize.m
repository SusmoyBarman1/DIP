close all;
clear all;

img = imread('gry.jpg');

new_img = imresize(img, [512, 512]);
shape = size(new_img);

half_1 = imresize(new_img, 0.5, 'nearest');
shape = size(half_1);


half_2 = imresize(half_1, 0.5, 'nearest');
shape = size(half_2);

subplot(2, 1, 1)


