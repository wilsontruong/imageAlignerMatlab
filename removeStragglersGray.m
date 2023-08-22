function modifiedMatrix = removeStragglersGray(matrix)
    [numRows, numCols] = size(matrix);
    modifiedMatrix = matrix;
    atleastHalf = zeros(1, numRows);

    for i = 1:numRows
        row = matrix(i, :);
        numZeros = sum(row == 0);
        numNonZeros = sum(row ~= 0); % Count non-zero elements

        if numNonZeros >= numZeros && numNonZeros >= numCols / 2
            atleastHalf(1, i) = 1;
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

