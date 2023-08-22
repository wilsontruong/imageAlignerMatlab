function modifiedMatrix = removeColumns(matrix, threshold)
    [numRows, numCols] = size(matrix);
    modifiedMatrix = matrix;
    atLeastThreshold = zeros(1, numCols);

    for j = 1:numCols
        column = matrix(:, j);
        numZeros = sum(column == 0);
        numNonZeros = sum(column ~= 0); % Count non-zero elements

        if numNonZeros >= numZeros && numNonZeros >= numRows * threshold
            atLeastThreshold(1, j) = 1;
        end
    end

    for j = 1:numCols
        column = matrix(:, j);
        numZeros = sum(column == 0);

        if numZeros < numRows * threshold
            x = isWithinColumns(find(atLeastThreshold == 1), j);
            if x == true
                continue
            end

            % Less than threshold fraction of the column is zeros, set all values to 0
            modifiedMatrix(:, j) = 0;
        end
    end
end

function result = isWithinColumns(array, element)
    result = any(array == element);
end



% function modifiedMatrix = removeColumns(matrix, threshold)
%     [numRows, numCols] = size(matrix);
%     modifiedMatrix = matrix;
%     atLeastThreshold = zeros(1, numCols);
% 
%     for j = 1:numCols
%         column = matrix(:, j);
%         numZeros = sum(column == 0);
%         numNonZeros = sum(column == 255); % Count non-zero elements
% 
%         if numNonZeros >= numZeros && numNonZeros >= numRows * threshold
%             atLeastThreshold(1, j) = 1;
%         end
%     end
% 
%     for j = 1:numCols
%         column = matrix(:, j);
%         numZeros = sum(column == 0);
% 
%         if numZeros > numRows * (1 - threshold)
%             x = isWithinColumns(find(atLeastThreshold == 1), j);
%             if x == true
%                 continue
%             end
% 
%             % More than threshold fraction of the column is zeros, set all values to 0
%             modifiedMatrix(:, j) = 0;
%         end
%     end
% end


% function modifiedMatrix = removeColumns(matrix)
%     [numRows, numCols] = size(matrix);
%     modifiedMatrix = matrix;
%     atleastHalf = zeros(1, numCols);
% 
%     for j = 1:numCols
%         column = matrix(:, j);
%         numZeros = sum(column == 0);
%         numNonZeros = sum(column ~= 0); % Count non-zero elements
% 
%         if numNonZeros >= numZeros && numNonZeros >= numRows / 2
%             atleastHalf(1, j) = 1;
%         end
%     end
% 
%     for j = 1:numCols
%         column = matrix(:, j);
%         numZeros = sum(column == 0);
% 
%         if numZeros > numRows / 2
%             x = isWithin(find(atleastHalf == 1), j);
%             if x == true
%                 continue
%             end
% 
%             % More than half the column is zeros, set all values to 0
%             modifiedMatrix(:, j) = 0;
%         end
%     end
% end
