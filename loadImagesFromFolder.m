function imageMatrices = loadImagesFromFolder(folderPath, imageType)
    % Get a list of all files in the specified folder
    files = dir(fullfile(folderPath, ['*.' imageType]));
    numImages = numel(files);
    
    % Extract file names
    fileNames = {files.name};
    
    % Sort file names in natural order
    [~, sortedIndices] = sort_nat(fileNames);
    sortedFileNames = fileNames(sortedIndices);
    
    % Initialize the array to store the image matrices and file names
    imageMatrices = repmat(struct('image', [], 'name', ''), 1, numImages);
    
    % Read and store each image matrix and file name
    for i = 1:numImages
        fileName = sortedFileNames{i};
        imagePath = fullfile(folderPath, fileName);
        imageMatrices(i).image = imread(imagePath); % Store image matrix
        imageMatrices(i).name = fileName; % Store file name
    end
end


% % SORTED WITH FILE NAMES
% function imageMatrices = loadImagesFromFolder(folderPath, imageType)
%     % Get a list of all files in the specified folder
%     files = dir(fullfile(folderPath, ['*.' imageType]));
%     numImages = numel(files);
%     
%     % Extract file names
%     fileNames = {files.name};
%     
%     % Sort file names in natural order
%     sortedFileNames = sort_nat(fileNames);
%     
%     % Initialize the array to store the image matrices and file names
%     imageMatrices = cell(1, numImages);
%     
%     % Read and store each image matrix and file name
%     for i = 1:numImages
%         fileName = sortedFileNames{i};
%         imagePath = fullfile(folderPath, fileName);
%         imageMatrices{i} = imread(imagePath); % Store image matrix
%     end
% end

% % SORTED WITH FILE NAMES
% function imageMatrices = loadImagesFromFolder(folderPath, imageType)
%     % Get a list of all files in the specified folder
%     files = dir(fullfile(folderPath, ['*.' imageType]));
%     numImages = numel(files);
%     
%     % Extract file names
%     fileNames = {files.name};
%     
%     % Sort file names in natural order
%     sortedFileNames = sort_nat(fileNames);
%     
%     % Initialize the array to store the image matrices and file names
%     % imageMatrices = cell(1, 2*numImages);
%     imageMatrices = cell(1, numImages);
%     
%     % Read and store each image matrix and file name
%     for i = 1:numImages
%         fileName = sortedFileNames{i};
%         imagePath = fullfile(folderPath, fileName);
%         % imageMatrices{2*i - 1} = fileName; % Store file name
%         % imageMatrices{2*i} = imread(imagePath); % Store image matrix
%         imageMatrices{i} = imread(imagePath); % Store image matrix
%     end
% end
% 
% % REGULAR
% function imageMatrices = loadImagesFromFolder(folderPath, imageType)
%     % Get a list of all files in the specified folder
%     files = dir(fullfile(folderPath, ['*.' imageType]));
%     numImages = numel(files);
%     
%     % Initialize the array to store the image matrices
%     imageMatrices = cell(1, numImages);
%     
%     % Read and store each image matrix
%     for i = 1:numImages
%         imagePath = fullfile(folderPath, files(i).name);
%         imageMatrices{i} = imread(imagePath);
%     end
% end