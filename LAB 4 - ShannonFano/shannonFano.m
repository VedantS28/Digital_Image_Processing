function [codes, avgLength] = shannonFano(symbols, probabilities)
    % Validate input
    if length(symbols) ~= length(probabilities) || abs(sum(probabilities) - 1) > 1e-10
        error('Invalid input: Number of symbols must match probabilities, and probabilities must sum to 1');
    end
    
    % Sort probabilities in descending order and keep track of symbols
    [sortedProb, indices] = sort(probabilities, 'descend');
    sortedSymbols = symbols(indices);
    
    % Initialize codes cell array
    codes = cell(size(symbols));
    
    % Generate codes using Shannon-Fano algorithm
    generateCodes(1, length(sortedProb), '');
    
    % Calculate average code length
    avgLength = sum(cellfun(@length, codes) .* probabilities);
    
    % Nested function to generate codes recursively
    function generateCodes(start, end_idx, currentCode)
        if start == end_idx
            % Assign code to symbol
            codes{indices(start)} = currentCode;
            return;
        end
        
        % Find partition point
        total = sum(sortedProb(start:end_idx));
        partial_sum = 0;
        partition = start;
        
        while partition <= end_idx && partial_sum <= total/2
            partial_sum = partial_sum + sortedProb(partition);
            partition = partition + 1;
        end
        partition = partition - 1;
        
        % Recursively assign codes to each partition
        if start <= partition
            generateCodes(start, partition, [currentCode '0']);
        end
        if partition + 1 <= end_idx
            generateCodes(partition + 1, end_idx, [currentCode '1']);
        end
    end
end