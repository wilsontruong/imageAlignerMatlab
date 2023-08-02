function shiftedMatrix = shiftImageUp(imageMatrix, pixelsShifted)
    shiftAmount = pixelsShifted;  % Number of indices to shift (negative for upward shift)
    
    % Shift the matrix up by the specified amount
    shiftedMatrix = circshift(imageMatrix, [-shiftAmount, 0]);
    
    % Fill the leftover space with zeros
    shiftedMatrix(end-shiftAmount+1:end, :) = 0;
end

