close all;
clear all;

img = imread('gry.jpg');

[r, c, s] = size(img);
m = max(max(max(img)));
b = [ 1 2 3 4 5 6 7 8];

figure(1);
set(gcf, 'Position', get(0, 'Screensize'));
for dd = 1: length(b)
    d = 2^dd;
    z = round(img/d);
    subplot(2, 4, dd);
    title(['bit ', num2str(abs(dd-9))]);
    hold on
    imshow(z * d);
end
            
            
            