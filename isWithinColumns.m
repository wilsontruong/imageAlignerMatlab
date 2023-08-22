function result = isWithinColumns(matrix, number)
    % Iterate through each element in the matrix
    for col = 1:size(matrix, 2)
        for row = 1:size(matrix, 1)
            % Check if the absolute difference between the current element
            % and the target number is <= tolerance
            
            tolerance = 5; % CHANGE THIS VALUE!!!!!: Number of columns tolerance.

            if abs(matrix(row, col) - number) <= tolerance
                result = true;  % If within tolerance, set the result to true and exit the function
                return;
            end
        end
    end
    
    % If no element is within "tolerance" of the target "number", set the result to false
    result = false;
end
