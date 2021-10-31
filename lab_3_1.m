close all;
clear all;
clc

grayImage = imread('gry.jpg');
grayImage = imresize(grayImage, [512, 512]);
shape = size(grayImage);
[x, y] = size(grayImage);

%% adding noise to the image
noisy_img = imnoise(grayImage,'salt & pepper',0.02);

%average filtering
n=input('Give the mask size for averaging filter\n:-- ');
nn= n*n;
averageFilterImage = imfilter(noisy_img, ones(n)/nn, 'symmetric');

peak_psnrs = psnr(averageFilterImage, grayImage);
average_psnr = squeeze(peak_psnrs);
disp('Average PSNR');
disp(average_psnr);

% median spatial filter
medianImage = medfilt2(noisy_img);

peak_psnrs = psnr(medianImage, grayImage);
median_psnr = squeeze(peak_psnrs);
disp('Median PSNR');
disp(median_psnr);

%% Plot images
figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(221), imshow(grayImage), title('Original Image', 'FontSize', 15);
subplot(222), imshow(noisy_img), title('Salt-Paper Noisy Image', 'FontSize', 15);
subplot(223), imshow(averageFilterImage), title('Average Filtered!', 'FontSize', 15);
subplot(224), imshow(medianImage), title('Median Filtered!', 'FontSize', 15);




