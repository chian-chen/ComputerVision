% im1, im2 
im1 = double(imread('./cat1.jpg'));
im2 = double(imread('./cat2.jpg'));

% 0.299 * R + 0.587 * G + 0.114 * B
Im1 = rgb2gray(im1/255);
Im2 = rgb2gray(im2/255);

figure, imshow(Im1);
colormap(gray(256))

figure, imshow(Im2);
colormap(gray(256))

% 2D FFT

IM1 = fft2(Im1);
IM2 = fft2(Im2);

% lowpass mask L and highpass mask L2

M = size(im1, 1);
N = size(im1, 2);
th = N / 30;
L = zeros(size(Im1));

for i = 1 : M
    for j = 1 : N
        if (i + j - 2 <= th) || (M - i + j - 1 <= th) || (N - j + i - 1 <= th) || (N - j + M - i <= th)
            L(i, j) = 1;
        end
    end
end

L2 = 1 - L;

% combine and show result

IM1 = IM1 .* L;
IM2 = IM2 .* L2;

IM_result = IM1 + IM2;
im_result = ifft2(IM_result);

figure, imshow(im_result);
colormap(gray(256))




