function shiftedMatrix = shiftImageRight(imageMatrix, pixelsShifted)
    shiftAmount = pixelsShifted;  % Number of indices to shift
    
    % Shift the matrix to the right by the specified amount
    shiftedMatrix = circshift(imageMatrix, [0, shiftAmount]);
    
    % Fill the leftover space with zeros
    shiftedMatrix(:, 1:shiftAmount) = 0;
end

