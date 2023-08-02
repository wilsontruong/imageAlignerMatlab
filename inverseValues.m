function output_matrix = inverseValues(input_matrix)
    % Check if the input is a binary matrix (containing only 0s and 1s)
    if ~islogical(input_matrix) || ~all(input_matrix(:) == 0 | input_matrix(:) == 1)
        error('Input matrix must be a binary matrix (containing only 0s and 1s).');
    end

    % Swap 1s with 0s and 0s with 1s
    output_matrix = ~input_matrix;
end


