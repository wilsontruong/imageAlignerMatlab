function result = isWithin(matrix, number)
    % Iterate through each element in the matrix
    for row = 1:size(matrix, 1)
        for col = 1:size(matrix, 2)
            % Check if the absolute difference between the current element and the target number is <= 10
            tolerance = 10; % Number of rows tolerance.
            if abs(matrix(row, col) - number) <= tolerance
                result = true;  % If within 10, set the result to true and exit the function
                return;
            end
        end
    end
    
    % If no element is within 10 of the target number, set the result to false
    result = false;
end


