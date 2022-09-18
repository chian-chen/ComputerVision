% image x and size m x n

x = double(imread('./Lenna.jpg'));
x = rgb2gray(x/255);

[m, n] = size(x);

figure; imshow(x);

% a

a = [cos(pi/6) sin(pi/6); -sin(pi/6), cos(pi/6)];

% b

a = [1 0; 0.3 1];