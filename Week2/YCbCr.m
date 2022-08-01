% trans to YCbCr and lighten/darken img

im = double(imread('./Lenna.jpg'));
im_R = im(:, :, 1);
im_G = im(:, :, 2);
im_B = im(:, :, 3);

% Trans RGB to YCbCr
T = [0.299 0.587 0.114; 
    -0.169 -0.331 0.500;
     0.500 -0.419 -0.081];
T_in = inv(T);

Y = T(1,1)*im_R + T(1,2)*im_G + T(1,3)*im_B;
Cb = T(2,1)*im_R + T(2,2)*im_G + T(2,3)*im_B;
Cr = T(3,1)*im_R + T(3,2)*im_G + T(3,3)*im_B;


% original img
figure, image(im/255), title('Alpha = 1 (original)');

% alpha = 0.5
Y_50 = ColorIntensity(0.5, Y);
im_50 = YCbCrtoRGB(T_in, Y_50, Cb, Cr);
figure, image(im_50/255), title('Alpha = 0.5 (lighten)');

% alpha = 0.75
Y_75 = ColorIntensity(0.75, Y);
im_75 = YCbCrtoRGB(T_in, Y_75, Cb, Cr);
figure, image(im_75/255), title('Alpha = 0.75 (lighten)');

% alpha = 1.25
Y_125 = ColorIntensity(1.25, Y);
im_125 = YCbCrtoRGB(T_in, Y_125, Cb, Cr);
figure, image(im_125/255), title('Alpha = 1.25 (darken)');

% alpha = 1.5
Y_150 = ColorIntensity(1.5, Y);
im_150 = YCbCrtoRGB(T_in, Y_150, Cb, Cr);
figure, image(im_150/255), title('Alpha = 1.5 (darken)');


function img = YCbCrtoRGB(T_in, Y, Cb, Cr)
    R = T_in(1,1)*Y + T_in(1,2)*Cb + T_in(1,3)*Cr;
    G = T_in(2,1)*Y + T_in(2,2)*Cb + T_in(2,3)*Cr;
    B = T_in(3,1)*Y + T_in(3,2)*Cb + T_in(3,3)*Cr;
    img = cat(3,R,G,B);
end
function Y = ColorIntensity(alpha, Y)
    Y = 255 * (Y/255).^alpha;
end
