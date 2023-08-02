clear;
clc;

% Replace 'path/to/images/' with the actual path to your images.
imagePath = uigetdir('', 'Select the folder containing the images being aligned: ');
imageType = 'tif'; % Replace with the actual image type.

% Get the list of image files in the folder.
imageFiles = dir(fullfile(imagePath, ['*.' imageType]));

% Initialize a cell array to store the images.
numImages = length(imageFiles);
imagesCell = cell(1, numImages);

% Load each image and store it in the cell array.
for i = 1:numImages
    imagesCell{i} = imread(fullfile(imagePath, imageFiles(i).name));
end

outputGIFPath = 'C:\Users\wlsn1\SMARTLabProjects\ImageAlignerMatlab\gif\banana.gif'; % Replace with the desired output path and filename.
delayTime = 0.1; % Time delay (in seconds) between frames in the GIF.
loopCount = Inf; % Number of times the GIF should loop (Inf for infinite loop).

% Create the GIF using the images in the cell array.
for i = 1:numImages
    if i == 1
        imwrite(imagesCell{i}, outputGIFPath, 'gif', 'LoopCount', loopCount, 'DelayTime', delayTime);
    else
        imwrite(imagesCell{i}, outputGIFPath, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end
end

