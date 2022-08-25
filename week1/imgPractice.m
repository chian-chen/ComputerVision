% Practice basic Image Read/ Write

% imread
im = double(imread('./Lenna.jpg'));
size(im)    % ans = 316 316 3


% imshow,  image,  imagesc

figure, image(im/255);      % can be stretched
figure, imagesc(im/255);     % can be stretched
figure, imshow(im/255);     % fixed 


figure, image(im(:, :, 1));     % only R value
colormap(gray(256))


% imwrite
im2 = zeros(316, 316, 3);
% change RGB value
im2(:, :, 1) = double(im(:, :, 1))*0.6 + double(im(:, :, 2))*0.4;
im2(:, :, 2) = double(im(:, :, 2))*0.6 + double(im(:, :, 3))*0.4;
im2(:, :, 3) = double(im(:, :, 3))*0.6 + double(im(:, :, 1))*0.4;
figure, imshow(im2/255);     % fixed 
imwrite(im2/255, './change_RGB.jpg')
