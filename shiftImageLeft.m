function shiftedMatrix = shiftImageLeft(imageMatrix, pixelsShifted)
    shiftAmount = -pixelsShifted;  % Negative number of indices to shift for left shift
    
    % Shift the matrix to the left by the specified amount
    shiftedMatrix = circshift(imageMatrix, [0, shiftAmount]);
    
    % Fill the leftover space with zeros
    shiftedMatrix(:, end-pixelsShifted+1:end) = 0;

end
