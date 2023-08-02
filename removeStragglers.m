% function resultMatrix = removeStragglers(inputMatrix)
%     [numRows, numCols] = size(inputMatrix);
%     resultMatrix = inputMatrix;
%     
%     for i = 1:numRows
%         row = inputMatrix(i,:);
%         if any(row == 255)
%             numOnes = sum(row == 255);
% %             if numOnes >= numCols / 2 || any(abs(i - find(row == 255)) <= 10)
%             if numOnes >= numCols / 2
%                 continue;
%             end
%         elseif sum(row == 0) > numCols / 2
%             resultMatrix(i, :) = 0;
%         end
%     end
% end

% function modifiedMatrix = removeStragglers(matrix)
%     [numRows, numCols] = size(matrix);
%     modifiedMatrix = matrix;
% 
%     for i = 1:numRows
%         row = matrix(i, :);
%         numZeros = sum(row == 0);
%         numOnes = sum(row == 255);
%         
%         % Check if the current row is within 10 rows of another row with >= half 255 values
%         nearbyRowFound = false;
%         for j = max(1, i - 10):min(numRows, i + 10)
%             if j ~= i
%                 nearbyRow = matrix(j, :);
%                 numNearbyOnes = sum(nearbyRow == 255);
%                 if numNearbyOnes >= numCols / 2
%                     nearbyRowFound = true;
%                     break;
%                 end
%             end
%         end
% 
%         if numOnes >= numZeros && (numOnes >= numCols / 2 || nearbyRowFound)
%             % Row contains at least half 255 values or is nearby such a row, leave it unchanged
%         elseif numZeros > numCols / 2
%             % More than half the row is zeros, set all values to 0
%             modifiedMatrix(i, :) = 0;
%         end
%     end
% end

function modifiedMatrix = removeStragglers(matrix)
    [numRows, numCols] = size(matrix);
    modifiedMatrix = matrix;
    atleastHalf = zeros(1,numRows);

    for i = 1:numRows
        row = matrix(i, :);
        numZeros = sum(row == 0);
        numOnes = sum(row == 255);

        if numOnes >= numZeros && numOnes >= numCols / 2
            atleastHalf(1,i) = 1;
        end
    end

    for i = 1:numRows
        row = matrix(i, :);
        numZeros = sum(row == 0);
        if numZeros > numCols / 2
            x = isWithin(find(atleastHalf == 1), i);
            if x == true
                continue
            end

        % More than half the row is zeros, set all values to 0
            modifiedMatrix(i, :) = 0;
        end
    end

end

% JUST IN CASE
% function modifiedMatrix = removeStragglers(matrix)
%     [numRows, numCols] = size(matrix);
%     modifiedMatrix = matrix;
% 
%     for i = 1:numRows
%         row = matrix(i, :);
%         numZeros = sum(row == 0);
%         numOnes = sum(row == 255);
% 
%         if numOnes >= numZeros && numOnes >= numCols / 2
%             % Row contains at least half 255 values, leave it unchanged
%         elseif numZeros > numCols / 2
%             % More than half the row is zeros, set all values to 0
%             modifiedMatrix(i, :) = 0;
%         end
%     end
% end

