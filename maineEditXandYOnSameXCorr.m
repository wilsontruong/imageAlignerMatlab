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
imagesStructGray = struct(imagesStructRGB);

% [firstDimension, secondDimension] = size(imagesStructGray);
for i = 1:size(imagesStructGray,2)
    imagesStructGray(i).image = rgb2gray(imagesStructGray(i).image);
end    

% for i = 1:size(imagesStructGray,2)
%     disp(imagesStructGray(i));
% end

% Turn the matrix into 1's and 0's. This makes it so that if a value is 0
% in the matrix, nothing changes, but if the value is anything other than
% 0, it is changed to black.
% for i = 1:size(imagesStructGray,2)
%     imagesStructGray(i).image = convertNonZeroToOnes(imagesStructGray(i).image);
% end

disp("The new images are currently being aligned, please wait...");

% len = 9;    % Adjust the length of motion (e.g., 9 pixels)
% theta = 0;  % Set theta to 0 for horizontal motion
% h_motion = fspecial('motion', len, theta);
[height, width] = size(imagesStructGray(1).image);

for i = 1:size(imagesStructGray,2)-1

    image1 = removeStragglers(findLargestSection(imagesStructGray(i).image));
    image2 = removeStragglers(findLargestSection(imagesStructGray(i+1).image));
    if i == 1
    else
        %  Shift the gray image and fill the shifted area with 255
%         if yOffset > 0
%             image1(height-yOffset:height, :) = 255;
%         elseif yOffset < 0
%             image1(1:abs(yOffset), :) = 255;
%         end
        if xOffset > 0
            image1(:, end-xOffset+1:end) = 0;
            %Display the images currently being shifted and compared to.
            close all;
            figure;
            subplot(1, 2, 1);
            imshow(image1);
            title("Image 1");
            
            subplot(1, 2, 2);
            imshow(image2);
            title("Image 2");
        elseif xOffset < 0
            image1(:, 1:abs(xOffset)) = 0;
            %Display the images currently being shifted and compared to.
            close all;
            figure;
            subplot(1, 2, 1);
            imshow(image1);
            title("Image 1");
            
            subplot(1, 2, 2);
            imshow(image2);
            title("Image 2");
        end

    end

%     Calculate the cross correlation of the matrixes.
    C = normxcorr2(image1, image2);
%     Find the location of the higest cross correlation value. The positon of the highest
%     number in the cross correlation output is the amount of pixels that
%     need tp be shifted.
    [yPeak, xPeak] = find(C == max(C(:)));
%     [yPeak, xPeak] = customCorrelation(image1,image2);

    % Calculate the offset of the image.
    yOffset = yPeak - size(imagesStructGray(1).image, 1);
    xOffset = xPeak - size(imagesStructGray(1).image, 2);

    disp(num2str(i+1) + " x Offset: " + xOffset)
    disp(num2str(i+1) + " y Offset: " + yOffset)
%     disp([num2str(i), "/", num2str(size(imagesStructGray,2))])

    for j = 1:size(imagesStructRGB(1).image,3)
%         The xOffset is currently equal to 0 because its giving me this
%         weird issue with the last few pictures.
%         imagesStructRGB(i+1).image(:,:,j) = circshift(imagesStructRGB(i+1).image(:,:,j), [-yOffset, 0]);
        imagesStructRGB(i+1).image(:,:,j) = circshift(imagesStructRGB(i+1).image(:,:,j), [-yOffset, -xOffset]);
    end

%     Shift the gray image as well
%     imagesStructGray(i+1).image = circshift(imagesStructGray(i+1).image, [-yOffset, 0]);
    imagesStructGray(i+1).image = circshift(imagesStructGray(i+1).image, [-yOffset, -xOffset]);
end

% Export the shifted images into the folder that was created. Save them
% asthe file typethat they originally were. This program can easily be
% altered though to export them as any file type that is inputed by the
% user.
for i = 1:size(imagesStructGray,2)
    imwrite(imagesStructRGB(i).image, newFolderPath + "\" + num2str(i) +  '.' + imageType);
end

% % BACKUP
% for i = 1:size(imagesStructGray,2)-1
%     image1 = imagesStructGray(1).image;
%     image2 = imagesStructGray(i+1).image;
% 
%     % Calculate the cross correlation of the matrixes.
%     C = normxcorr2(image1, image2);
%     % Find the location of the higest cross correlation value. The positon of the highest
%     % number in the cross correlation output is the amount of pixels that
%     % need tp be shifted.
%     [yPeak, xPeak] = find(C == max(C(:)));
% 
%     % Calculate the offset of the image.
%     yOffset = yPeak - size(imagesStructGray(1).image, 1);
%     xOffset = xPeak - size(imagesStructGray(1).image, 2);
%     disp("x Offset: " + xOffset)
%     disp("y Offset: " + yOffset)
% 
%     % Shift the image.
%     alignedImage = circshift(image2, [-yOffset, -xOffset]);
%     imwrite(alignedImage, [newFolderPath, num2str(i), '.', imageType]);
% end