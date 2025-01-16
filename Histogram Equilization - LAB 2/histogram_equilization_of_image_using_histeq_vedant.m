% Histogram Equalization Implementation for Grayscale Images using histeq
% Enhances image contrast by equalizing the probability distribution of intensity values
% Author: Vedant Shrivastava

clear all
close all
clc

% Read and convert image to grayscale
img = imread('image.jpg');
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Calculate histogram
[counts, bins] = histcounts(gray_img(:), 256);

% Calculate CDF
cdf = cumsum(counts) / numel(gray_img);

% Perform histogram equalization
equalized_img = histeq(gray_img);

% Create subplots for visualization
figure('Position', [100 100 1200 600]);

% Original image
subplot(2, 3, 1);
imshow(gray_img);
title('Original Grayscale Image');

% Original histogram
subplot(2, 3, 2);
bar(bins(1:end-1), counts);
title('Original Histogram');
xlabel('Intensity Value');
ylabel('Frequency');
grid on;

% Original CDF
subplot(2, 3, 3);
plot(bins(1:end-1), cdf);
title('Original CDF');
xlabel('Intensity Value');
ylabel('Cumulative Probability');
grid on;

% Equalized image
subplot(2, 3, 4);
imshow(equalized_img);
title('Equalized Image');

% Equalized histogram
[eq_counts, eq_bins] = histcounts(equalized_img(:), 256);
subplot(2, 3, 5);
bar(eq_bins(1:end-1), eq_counts);
title('Equalized Histogram');
xlabel('Intensity Value');
ylabel('Frequency');
grid on;

% Equalized CDF
eq_cdf = cumsum(eq_counts) / numel(equalized_img);
subplot(2, 3, 6);
plot(eq_bins(1:end-1), eq_cdf);
title('Equalized CDF');
xlabel('Intensity Value');
ylabel('Cumulative Probability');
grid on;

% Adjust subplot spacing
sgtitle('Image Histogram Equalization Analysis');