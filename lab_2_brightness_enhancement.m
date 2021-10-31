close all;
clear all;
clc

A = input('Input>0 for brighter image and Input<0 for darker image\n');
img = imread('gry.jpg');
img = imresize(img, [512, 512]);
shape = size(img);
[x, y] = size(img);

img = double(img);

%% Replace each pixel of the image
% replace loop in single loop

bright_img(:,:) = img(:,:) + A;
new(:, :) = mod(bright_img(:, :), 255); 


%% Plot the image
figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(121), imshow(uint8(img)), title('Input Image');
subplot(122), imshow(uint8(bright_img)), title('Brightness Enhacement');
if A>0
    xlabel(sprintf('Brightness increased by %g percent', A));
else
    xlabel(sprintf('Brightness decreased by %g percent', A));
end
