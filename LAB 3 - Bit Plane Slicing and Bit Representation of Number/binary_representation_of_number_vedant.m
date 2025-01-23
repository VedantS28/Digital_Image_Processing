% Binary Representation and Bit Counting in MATLAB
% A MATLAB script to compute and display the binary representation of a decimal number,
% along with determining the number of bits required to represent the number. 
% Author: Vedamt Shrivastava

clc; 
clear all; 
close all;

a = 10;
binaryString = '';  

while a > 0
    remainder = mod(a, 2); % Get remainder (0 or 1)
    binaryString = [num2str(remainder) binaryString]; 
    a = floor(a / 2); 
end

disp(['Binary representation: ', binaryString]);
numBits = length(binaryString);
disp(['Number of bits: ', num2str(numBits)]);

