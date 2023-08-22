% Load data
grayImage = removeStragglersGray(findLargestSectionGray(rgb2gray(imread('1.tif'))));
im2 = removeStragglersGray(findLargestSectionGray(rgb2gray(imread('2.tif'))));

% Apply Gaussian filtering for denoising
% filteredImage = imgaussfilt(grayImage, 1.5); % Adjust the standard deviation as needed
filteredImage = medfilt2(grayImage, [10, 10]); % This method is apparently good for salt and pepper noise

% Apply contrast stretching to enhance image contrast
minValue = min(filteredImage(:));
maxValue = max(filteredImage(:));
enhancedImage = (filteredImage - minValue) / (maxValue - minValue);

% Scale the contrast-stretched image to the full intensity range [0, 1]
enhancedImage = mat2gray(enhancedImage);

% Display the original, denoised, and contrast-enhanced images
subplot(1, 3, 1);
imshow(grayImage);
title('Original Noisy Image');

subplot(1, 3, 2);
imshow(filteredImage);
title('Denoised Image (Gaussian Filter)');

subplot(1, 3, 3);
imshow(enhancedImage);
title('Contrast-Enhanced Image');

% ... (The rest of the code remains unchanged)


% % Load data
% grayImage = removeStragglersGray(findLargestSectionGray(rgb2gray(imread('1.tif'))));
% im2 = removeStragglersGray(findLargestSectionGray(rgb2gray(imread('2.tif'))));
% 
% % Apply Gaussian filtering for denoising
% % filteredImage = imgaussfilt(grayImage, 1.5); % Adjust the standard deviation as needed
% filteredImage = medfilt2(grayImage, [10, 10]); %This method is apparently good for salt and pepper noise
% 
% 
% % Display the original and denoised images
% subplot(1, 2, 1);
% imshow(grayImage);
% title('Original Noisy Image');
% 
% subplot(1, 2, 2);
% imshow(filteredImage);
% title('Denoised Image (Gaussian Filter)');


% % Calculate gradients
% im1 = imgradient(im1Orig);
% im2 = imgradient(im2Orig);
% 
% % Get registration values
% [output, Greg] = dftregistration(fft2(im1), fft2(im2), 50);
% 
% % Calculate translation offsets
% translationX = output(4);  % Horizontal translation
% translationY = output(3);  % Vertical translation
% 
% % Translate image2 using imtranslate
% im2Translated = imtranslate(im2Orig, [translationX, translationY]);
% 
% disp("X: " + translationX);
% disp("Y: " + translationY);
% 
% imwrite(im1Orig, 'nonshifted.tif');
% imwrite(im2Translated, 'shifted.tif');
% 
% % Display image1
% figure;
% subplot(1, 2, 1);
% imshow(im1Orig, []);
% title('Image 1');
% 
% % Display shifted image2
% subplot(1, 2, 2);
% imshow(im2Translated, []);
% title('Shifted Image 2');
% 
% % Adjust figure layout
% sgtitle('Image Alignment and Translation');

% x = [1 2 3; 4 5 6; 7 8 9];
% y = [4 5 6; 7 8 9; 1 2 3];
% 
% output = customCorrelation(x,y);


% clear; clc; close all;
% 
% % Step 1: Read the image
% image = imread('1.tif'); % Replace 'your_image_path.png' with the actual image path
% 
% % Step 2: Preprocess the image to enhance the main line and suppress the straggler lines (You may need to adjust the threshold based on your image)
% binary_image = rgb2gray(image) > 100;
% 
% % Step 3: Use Hough transform to detect the main line
% [H, theta, rho] = hough(binary_image);
% peaks = houghpeaks(H, 1); % Find the strongest peak
% theta_degrees = theta(peaks(1, 2)); % Angle in degrees
% 
% % Step 4: Rotate the image to align the main line with the horizontal axis
% center = [size(image, 2) / 2, size(image, 1) / 2]; % Center of the image
% rotated_image = imrotate(image, -theta_degrees, 'bilinear', 'crop');
% 
% % Display the results
% figure;
% subplot(1, 2, 1);
% imshow(image);
% title('Original Image');
% 
% subplot(1, 2, 2);
% imshow(rotated_image);
% title(['Rotated Image: ', num2str(theta_degrees), ' degrees']);


% % Step 1: Read the image (if not already loaded)
% % Replace 'image_filename.jpg' with the path to your image file
% image_data = imread('1.tif');
% 
% % Step 2: Preprocess the image to extract the line from the background
% % Assuming the line is brighter than the background (if not, use ">" instead of "<" in im2bw function)
% threshold = graythresh(image_data);
% bw_image = im2bw(image_data, threshold);
% bw_image = inverseValues(bw_image);
% 
% % Step 3: Find the orientation of the line
% % You can use the Hough Transform to find the dominant orientation of the line
% [H, T, R] = hough(bw_image);
% peaks = houghpeaks(H, 1);
% theta = T(peaks(1, 2));
% 
% % Step 4: Calculate the rotation angle required to make the line horizontal
% rotation_angle = -theta; % Negative sign to rotate in the opposite direction
% 
% % Step 5: Rotate the image around its center
% rotated_image = imrotate(image_data, rotation_angle, 'bilinear', 'crop');
% 
% % Display the original and rotated images
% figure;
% subplot(1, 2, 1);
% imshow(image_data);
% title('Original Image');
% 
% subplot(1, 2, 2);
% imshow(rotated_image);
% title('Rotated Image');

% Optional: Save the rotated image
% imwrite(rotated_image, 'rotated_image.jpg');


% % Step 1: Read the image and convert it to grayscale if needed
% image = imread('1.tif');
% if size(image, 3) == 3
%     gray_image = rgb2gray(image);
% else
%     gray_image = image;
% end
% 
% % Step 2: Apply a horizontal filter (e.g., a horizontal Sobel filter) to enhance the thick horizontal line
% horizontal_filter = fspecial('sobel');
% horizontal_response = imfilter(double(gray_image), horizontal_filter, 'replicate');
% imshow(horizontal_response);
% 
% % Step 3: Apply a vertical filter (e.g., a vertical Sobel filter) to enhance the thinner vertical lines
% vertical_filter = horizontal_filter';
% vertical_response = imfilter(double(gray_image), vertical_filter, 'replicate');
% imshow(vertical_response);
% 
% % Step 4: Subtract the vertical response from the original image
% filtered_image = horizontal_response - vertical_response;
% 
% % Step 5: Threshold the image to remove the weaker parts of the vertical lines
% threshold = 50; % Adjust the threshold value as needed
% result_image = filtered_image > threshold;
% 
% % Display the result
% figure;
% subplot(1, 2, 1);
% imshow(gray_image);
% title('Original Image');
% subplot(1, 2, 2);
% imshow(result_image);
% title('Result - Thick Horizontal Line with No Vertical Lines');

% binary_image = imread('testlol.png');
% % imshow(findLargestSection(BW))
% vertical_strel = strel('line', 1, 90); % Adjust 'line_length' to match the length of the vertical lines
% cleaned_image = imopen(binary_image, vertical_strel);
% imshow(cleaned_image);

% JUST IN CASE
% BW = imread('testlol.png');
% % imshow(findLargestSection(BW))
% % Choose an appropriate size for the vertical line structuring element (adjust as needed)
% vertical_line_size = 5; % Change this value based on your image
% 
% % Create the structuring element
% se = strel('line', vertical_line_size, 90); % 90 degrees indicates a vertical line
% 
% % Perform the opening operation to remove the thinner vertical lines
% output_image = imopen(binary_image, se);
% imshow(output_image);

% bananas = convertNonZeroToOnes(rgb2gray(imread('1.tif')));
% imshow(findLargestSection(bananas))

% BW = imread('testlol.png');
% CC = bwconncomp(BW);
% numPixels = cellfun(@numel,CC.PixelIdxList);
% [biggest,idx] = max(numPixels);
% BW(CC.PixelIdxList{idx}) = 256;
% imshow(BW);

% BW = imread('testlol.png');
% CC = bwconncomp(BW);
% numPixels = cellfun(@numel, CC.PixelIdxList);
% [biggest, idx] = max(numPixels);
% 
% % Create a blank white image with the same size as the original image
% output_image = ones(size(BW)) * 255;
% 
% % Set the largest region (identified by 'idx') to black
% output_image(CC.PixelIdxList{idx}) = 0;
% 
% % Display the result
% imshow(output_image);