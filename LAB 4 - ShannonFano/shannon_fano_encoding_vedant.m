% Shannon Fano Encoding
% This program implements the Shannon-Fano coding algorithm for data compression 
% by assigning variable-length binary codes based on symbol probabilities. 
% It efficiently creates prefix codes by recursively dividing 
% symbols into groups with similar cumulative probabilities.
% Author :- Vedant Shrivastava

clc;
clear all;
close all;

% Get user input for symbols and probabilities
symbols = input('Enter symbols as a cell array (e.g., {''a'', ''b'', ''c''}): ');
probabilities = input('Enter probabilities as an array (e.g., [0.5, 0.3, 0.2]): ');

% Run Shannon-Fano algorithm
[codes, avgLength] = shannonFano(symbols, probabilities);

% Display results
disp('Shannon-Fano Codes:');
for i = 1:length(symbols)
    fprintf('Symbol: %s, Probability: %.3f, Code: %s\n', ...
        symbols{i}, probabilities(i), codes{i});
end
fprintf('Average Code Length: %.3f bits\n', avgLength);