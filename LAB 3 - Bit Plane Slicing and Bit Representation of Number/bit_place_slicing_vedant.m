% Bit Plane Slicing: Visualizing Image Data at the Binary Level
% A MATLAB implementation to extract, analyze, and display individual bit planes of a
% grayscale image, providing insight into the binary representation of pixel intensities.
% Author :- Vedamt Shrivastava

clc;
clear;
close all;

% Prompt user to input image file
[filename, pathname] = uigetfile({'*.*', 'All Files (*.*)'}, 'Select an Image');
if isequal(filename, 0)
    disp('User cancelled the image selection.');
    return;
end

% Read the image
filePath = fullfile(pathname, filename);
image = imread(filePath);

% Convert to grayscale if not already
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Display the original grayscale image
figure;
subplot(3, 3, 1); 
imshow(grayImage);
title('Grayscale Image');

% Separate into bit planes and display in a single window
for k = 1:8
    bitPlane = bitget(grayImage, k); % Extract bit plane
    subplot(3, 3, k + 1); % Arrange bit planes in the grid
    imshow(bitPlane, []);
    title(['Bit Plane ', num2str(k)]);
end

% Adjust figure layout
sgtitle('Grayscale Image and Bit Planes');
