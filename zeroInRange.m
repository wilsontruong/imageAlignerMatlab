function modifiedMatrix = zeroInRange(inputMatrix, minValue, maxValue)
    % Input:
    % inputMatrix - The input matrix
    % minValue    - Minimum value to check
    % maxValue    - Maximum value to check
    %
    % Output:
    % modifiedMatrix - Matrix with values within the range [minValue, maxValue] set to zero
    
    % Create a logical mask for values within the range
    mask = (inputMatrix >= minValue) & (inputMatrix <= maxValue);
    
    % Set values within the range to zero using the mask
    modifiedMatrix = inputMatrix;
    modifiedMatrix(mask) = 0;
end