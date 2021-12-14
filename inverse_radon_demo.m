clear;
close all

% Create phantom image:
P = phantom('Modified Shepp-Logan',500);
figure
imshow(P)
title('Original')
pause(0.1)

% Create sinogram:
theta = 0:0.4:180;
sinogram = radon(P,theta);

figure
imshow(sinogram/max(abs(sinogram(:))));
title('Sinogram')
pause(0.1)

% Apply inverse transform:
reconstruction = inverse_radon_transform(sinogram,'plotting',true);