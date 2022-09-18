% image x and size m x n

x = double(imread('./Lenna.jpg'));
x = rgb2gray(x/255);

[m, n] = size(x);

figure; imshow(x);

% set new size M = vertical * m, N = horizontal * n

vertical = 1.5;
horizontal = 1.6;

M = round(m * vertical);
N = round(n * horizontal);

% new image y[m, n] = x[m/1.5, n/1.6]

y = zeros(M, N);

for i = 1 : M
    for j = 1 : N
        m1 = i / vertical;
        n1 = j / horizontal;
        m0 = floor(m1);
        n0 = floor(n1);
        
        % handle edge case
        if m0 <= 0 || n0 <= 0 || m0 >= m || n0 >= n
            y(i, j) = 0;
            continue;
        end
        
        a = m1 - m0;
        b = n1 - n0;
        
        y(i, j) = (1-a) * (1-b) * x(m0, n0) + a * (1-b) * x(m0 + 1, n0) + (1-a) * b * x(m0, n0 + 1) + a * b * x(m0 + 1, n0 + 1);
    end
end

% show result

figure; imshow(y);
