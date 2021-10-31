close all;
clear all;
clc

img = imread('gry.jpg');
img = imresize(img, [512, 512]);
shape = size(img);
[x, y] = size(img);

%% adding noise to the image
SI_img = imnoise(img,'salt & pepper'); 
GI_img = imnoise(img,'gaussian');

%% Harmonic mean filter
Kr = 3; % window size
Kc = 3;

Sg = im2double(SI_img);
Gg = im2double(GI_img);

SF = (Kr*Kc)./imfilter(1./(Sg+eps), ones(Kr, Kc), 'replicate');
GF = (Kr*Kc)./imfilter(1./(Gg+eps), ones(Kr, Kc), 'replicate');

peak_psnrs = psnr(uint8(SF), SI_img);
SF_psnr = squeeze(peak_psnrs);
disp('Harmonic Filter PSNR on Salt-paper image:');
disp(SF_psnr);

peak_psnrs = psnr(uint8(GF), GI_img);
GI_psnr = squeeze(peak_psnrs);
disp('Harmonic Filter PSNR on Gaussian noise image:');
disp(GI_psnr);



%% Plot images
figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(221), imshow(SI_img), title('Salt-Paper Noisy Image', 'FontSize', 15);
subplot(222), imshow(SF), title('Gaussian Noise Image', 'FontSize', 15);
subplot(223), imshow(GI_img), title('Harmonic Mean Filtered Image', 'FontSize', 15);
subplot(224), imshow(GF), title('Harmonic Mean Filtered Image', 'FontSize', 15);




