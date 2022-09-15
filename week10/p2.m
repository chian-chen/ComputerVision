% construct a ellipse image x

im = double(imread('./Lenna.jpg'));
im = rgb2gray(im/255);
[m, n] = size(im);

rx = n / 4; ry = m / 3; x0 = n / 2; y0 = m / 2;

E = zeros(m, n);

for i= 1:m
    for j = 1:n
        if (i - x0)^2 / rx^2 + (j - y0) ^ 2/ ry^2 <= 1
            E(i, j) = 1;
        end
    end
end

x = E .* im;

figure;
imshow(x);

% L_0

L_0 = sum(sum(x>0));

% L_1

L_1 = sum(sum(abs(x)));

% L_2

L_2 = sum(sum(x.^2));

% L_inf

L_inf = max(max(x));



% Central Moment

sumX = sum(sum(x));

n_x = 0 : m - 1;
N_x = sum(sum(x, 2).' .* n_x) / sumX;

n_y = 0 : n - 1;
N_y = sum(sum(x) .* n_y) / sumX;

% m ^ (2,0)

m_20 = sum(sum(x,2).' .* (n_x - N_x).^2);


% m ^ (1,1)

m_11 = 0;
for i = 0 : m-1
    for j = 0 : n - 1
        m_11 = (i - N_x) * (j - N_y) * x(i+1, j+1) + m_11;
    end
end

% m ^ (0,2)

m_02 = sum(sum(x) .* (n_y - N_y).^2);




