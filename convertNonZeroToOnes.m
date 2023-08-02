function resultMatrix = convertNonZeroToOnes(inputMatrix)
    % Get the size of the input matrix
    [rows, cols] = size(inputMatrix);

    % Initialize the result matrix with zeros
    resultMatrix = zeros(rows, cols);

    % Iterate through the input matrix and set non-zero values to 1 in the result matrix
    for row = 1:rows
        for col = 1:cols
            if inputMatrix(row, col) ~= 0
                resultMatrix(row, col) = 1;
            end
        end
    end
end


