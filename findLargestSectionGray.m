function binaryMatrix = findLargestSectionGray(binaryMatrix)
    CC = bwconncomp(binaryMatrix);
    numPixels = cellfun(@numel, CC.PixelIdxList);
    [biggest, idx] = max(numPixels);
    
    % Create a binary mask for the largest section
    largestSectionMask = false(size(binaryMatrix));
    largestSectionMask(CC.PixelIdxList{idx}) = true;

%     % Set intensity of the largest section to 255
%     binaryMatrix(largestSectionMask) = 255;

    % Set intensity of everything outside the largest section to 0 (black)
    binaryMatrix(~largestSectionMask) = 0;

    % imshow(binaryMatrix);
end

% function binaryMatrix = findLargestSection(binaryMatrix)
%     CC = bwconncomp(binaryMatrix);
%     numPixels = cellfun(@numel,CC.PixelIdxList);
%     [biggest,idx] = max(numPixels);
%     binaryMatrix(CC.PixelIdxList{idx}) = 255;
%     imshow(binaryMatrix);
% end

