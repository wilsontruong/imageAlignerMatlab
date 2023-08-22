function [yPeak, xPeak] = customCorrelation(m1, m2)
    corMatrix = conv2(m1, rot90(m2, 2), 'valid');
    [yPeak, xPeak] = find(corMatrix == max(corMatrix(:)));
end


% function [yPeak, xPeak] = customCorrelation(m1, m2)
%     [row, col] = size(m1);
%     corMatrix = zeros(row, col);
% 
%     for i = 1:row
%         for j = 1:col
%             shifted_m1 = circshift(m1, [i-1, j-1]);
%             result = shifted_m1 .* m2;
%             corMatrix(i, j) = sum(result(:));
%         end
%     end
% 
%     [yPeak, xPeak] = find(corMatrix == max(corMatrix(:)));
% end


% function [yPeak, xPeak] = customCorrelation(m1,m2)
%     [row, col]= size(m1);
%     corMatrix = zeros(row, col);
%     % POSITIVE FOR CIRCSHIFT MEANS RIGHT AND DOWN.
%    
%     for i = 1:row
%         m1 = circshift(m1,[i-1,0]);
%         for j = 1:col
%             m2 = circshift(m2,[0,j-1]);
%             result = m1.*m2;
%             corMatrix(i,j) = sum(result(:));
%         end
%     end
% 
%     [yPeak, xPeak] = find(corMatrix == max(corMatrix(:)));
% end

