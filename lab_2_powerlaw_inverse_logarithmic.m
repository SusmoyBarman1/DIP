clc;
clear all;
close all;

img = imread('gry.jpg');
img = imresize(img, [512, 512]);
shape = size(img);
imd = double(img);
[m, n] = size(imd);

% now we apply the power law transformation
% if gamma>1, brighter image become darker,
% if gamma<1, darker image become brighter

gamma = 1.7;   % value of gamma depends on whether the image is brighter or darker
power_image = abs((1*imd).^gamma);

%% now we have to normalize this output on an intensity scale of [0, 255]

maxm = max(power_image(:));
minm = min(power_image(:));

for i=1:m
    for j=1:n
        % normalizing the image
        power_image(i,j) = (255*power_image(i,j)) / (maxm-minm);
    end
end

power_image = uint8(power_image);

%% log and Inverse log transformation
L = 256;
I = img;
% log transformation
log_I = uint8(log(double(I)+1) .* ((L - 1)/log(L)));

% inverse log transformation
exp_I = uint8((exp(double(I)) .^ (log(L) / (L-1))) - 1);

%% Difference between two images
K = imabsdiff(power_image,exp_I);

%% Plot the image
figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
subplot(221), imshow(img), title('Input Image');
subplot(222), imshow(power_image), title('Output of power law transform');
subplot(223), imshow(exp_I), title('Inverse log Transformation');
subplot(224), imshow(K), title('Difference between Power law and Inverse log transformation image!');


%link: https://www.youtube.com/watch?v=s7FI9EFCWj0&ab_channel=GeekBitofEverything
