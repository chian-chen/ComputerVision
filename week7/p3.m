% img x

im = double(imread('./a.jpg'));
% figure, imshow(im/255);
x = rgb2gray(im/255);

figure, imshow(x);
colormap(gray(256))

% m, n, d

[m, n] = size(x);

% generate k

k = zeros(21, 21);

for i = 1:21
    for j = 1:21
        k(i, j) = exp(-0.1 * ((i - 11)^2 + (j - 11)^2));
    end
end

s = sum(sum(k));
k = k/s;

% noise

noise = (rand(m, n) - 0.5) * 0.25;

% y

y = conv2(x, k, 'same') + noise;

figure, imshow(y);
colormap(gray(256))

% k1

k1 = zeros(m, n);

k1(1:11, 1:11) = k(11:21, 11:21);
k1(1:11, n - 9 : n) = k(11:21, 1:10);
k1(m - 9 : m, 1:11) = k(1:10, 11:21);
k1(m - 9 : m, n - 9 : n) = k(1:10, 1:10);

K = fft2(k1);

% generate H from K

c = 0.01;
H = 1 ./ (c./conj(K) + K);

% recovery

x_new = ifft2(fft2(y) .* H);

figure, imshow(x_new);
colormap(gray(256))



