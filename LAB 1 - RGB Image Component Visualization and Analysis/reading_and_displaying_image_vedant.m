% Reading and Displaying Image with Multiple Grayscale Methods
% This code reads a color image and displays it in different forms:
% original, RGB components, and multiple grayscale conversions
% Owner :- Vedant

clc
clear all
close all

% Read the image
Ic = imread('image.jpg');

% Create first figure for RGB components
figure('Name', 'RGB Components', 'Position', [100 100 800 600]);

% Original image
subplot(2,3,1);
imshow(Ic);
title('Original Image');

% Red component
I_r = Ic;
I_r(:,:,[2 3]) = 0;  % Set green and blue channels to zero
subplot(2,3,2);
imshow(I_r);
title('Red Component');

% Green component
I_g = Ic;
I_g(:,:,[1 3]) = 0;  % Set red and blue channels to zero
subplot(2,3,3);
imshow(I_g);
title('Green Component');

% Blue component
I_b = Ic;
I_b(:,:,[1 2]) = 0;  % Set red and green channels to zero
subplot(2,3,4);
imshow(I_b);
title('Blue Component');

% Red to Grayscale
I_gr = I_r(:,:,1);
subplot(2,3,5);
imshow(I_gr);
title('Red Channel Grayscale');

% Display pixel value
pixel_value = Ic(1, 3, :);
subplot(2,3,6);
text(0.1, 0.5, sprintf('Pixel value at (1,3):\nR: %d\nG: %d\nB: %d', ...
    pixel_value(1), pixel_value(2), pixel_value(3)), 'FontSize', 10);
axis off;
title('Pixel Information');

% Create second figure for different grayscale methods
figure('Name', 'Grayscale Conversions', 'Position', [150 150 800 600]);

% Method 1: Average method
I_gray_avg = uint8(mean(Ic, 3));
subplot(2,3,1);
imshow(I_gray_avg);
title('Average Method');

% Method 2: Weighted average (Luminance) method
I_gray_weighted = uint8(0.299 * double(Ic(:,:,1)) + ...
                       0.587 * double(Ic(:,:,2)) + ...
                       0.114 * double(Ic(:,:,3)));
subplot(2,3,2);
imshow(I_gray_weighted);
title('Luminance Method');

% Method 3: MATLAB's built-in rgb2gray
I_gray_builtin = rgb2gray(Ic);
subplot(2,3,3);
imshow(I_gray_builtin);
title('Built-in rgb2gray');

% Method 4: Maximum method
I_gray_max = uint8(max(Ic, [], 3));
subplot(2,3,4);
imshow(I_gray_max);
title('Maximum Method');

% Method 5: Minimum method
I_gray_min = uint8(min(Ic, [], 3));
subplot(2,3,5);
imshow(I_gray_min);
title('Minimum Method');


% Display additional information in command window
fprintf('\nImage Properties:\n');
fprintf('Size: %d x %d x %d\n', size(Ic));
fprintf('Class: %s\n', class(Ic));
fprintf('Maximum value in weighted grayscale: %d\n', max(I_gray_weighted(:)));
fprintf('Minimum value in weighted grayscale: %d\n', min(I_gray_weighted(:)));