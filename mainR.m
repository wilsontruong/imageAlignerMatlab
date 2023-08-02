clear;clc;
close all;

% Exports the new shifted images and places them in the new designated folder path.

% Prompt the user to select a folder that contains the images being analyzed.
inputFolderPath = uigetdir('', 'Select the folder containing the images being aligned: ');
disp(['Selected folder path: ' inputFolderPath]);

% Ask user what they would like to name the output folder that the new
% images will be exported to. It also gets the new folder path name while
% at it.
outputFolderName = input('What would you like to name the output folder?: ', 's');
newFolderPath = createNewDirectory(inputFolderPath, outputFolderName); 

% Store the images in an array.
imageType = input('What is the image type of of the pictures you are using? \nEx. tif, png, jpeg, etc...: (Write down the ending, do not write the "."): ', 's');
imagesStructRGB = loadImagesFromFolder(inputFolderPath, imageType);
imagesStructRed = struct(imagesStructRGB);

for i = 1:size(imagesStructRed,2)
    imagesStructRed(i).image = (imagesStructRed(i).image(:,:,1));
end

for i = 1:size(imagesStructRed,2)-1
    
    image1 = imagesStructRed(i).image;
    image2 = imagesStructRed(i+1).image;

    % Calculate the cross correlation of the matrixes.
    C = normxcorr2(image1, image2);
    % Find the location of the higest cross correlation value. The positon of the highest
    % number in the cross correlation output is the amount of pixels that
    % need tp be shifted.
    [yPeak, xPeak] = find(C == max(C(:)));

    % Calculate the offset of the image.
    yOffset = yPeak - size(imagesStructRed(1).image, 1);
    xOffset = xPeak - size(imagesStructRed(1).image, 2);

    disp("x Offset: " + xOffset)
    disp("y Offset: " + yOffset)
%     disp([num2str(i), "/", num2str(size(imagesStructGray,2))])
    
    for j = 1:size(imagesStructRGB(1).image,3)
        % The xOffset is currently equal to 0 because its giving me this
        % weird issue with the last few pictures.
        imagesStructRGB(i+1).image(:,:,j) = circshift(imagesStructRGB(i+1).image(:,:,j), [-yOffset, 0]);
    end

    % Shift the coloured images.
    % alignedImage = circshift(image2, [-yOffset, -xOffset]);
end

% Export the shifted images into the folder that was created. Save them
% asthe file typethat they originally were. This program can easily be
% altered though to export them as any file type that is inputed by the
% user.
for i = 1:size(imagesStructRed,2)
    imwrite(imagesStructRGB(i).image, newFolderPath + "\" + num2str(i) +  '.' + imageType);
end
