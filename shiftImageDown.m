function shiftedMatrix = shiftImageDown(imageMatrix, pixelsShifted)
    shiftAmount = pixelsShifted;  % Number of indices to shift
    
    % Shift the matrix down by the specified amount
    shiftedMatrix = circshift(imageMatrix, [shiftAmount, 0]);
    
    % Fill the leftover space with zeros
    shiftedMatrix(1:shiftAmount, :) = 0;
end

