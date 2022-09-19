% image x and size m x n

x = double(imread('./Lenna.jpg'));
x = rgb2gray(x/255);

[m, n] = size(x);
cm = m/2;
cn = n/2;

figure; imshow(x);

% a

Ta = [cos(pi/6) sin(pi/6); -sin(pi/6), cos(pi/6)];
Pa = zeros(m, n);

for i = 1:m
    for j = 1:n
        index = Ta\[i-cm ; j-cn];
        m1 = index(1,1) + cm;
        n1 = index(2,1) + cn;
        m0 = floor(m1);
        n0 = floor(n1);
        
        % handle edge case
        if m0 <= 0 || n0 <= 0 || m0 >= m || n0 >= n
            Pa(i, j) = 0;
            continue;
        end
        
        a = m1 - m0;
        b = n1 - n0;
        tl = (1-a) * (1-b) * x(m0, n0);
        tr = a * (1-b) * x(m0 + 1, n0);
        bl = (1-a) * b * x(m0, n0 + 1);
        br = a * b * x(m0 + 1, n0 + 1);
        Pa(i, j) = tl + tr + bl + br;
    end
end

figure; imshow(Pa);


% b

Tb = [1 0; 0.3 1];

Pb = zeros(m, n);

for i = 1:m
    for j = 1:n
        index = Tb\[i-cm ; j-cn];
        m1 = index(1,1) + cm;
        n1 = index(2,1) + cn;
        m0 = floor(m1);
        n0 = floor(n1);
        
        % handle edge case
        if m0 <= 0 || n0 <= 0 || m0 >= m || n0 >= n
            Pb(i, j) = 0;
            continue;
        end
        
        a = m1 - m0;
        b = n1 - n0;
        tl = (1-a) * (1-b) * x(m0, n0);
        tr = a * (1-b) * x(m0 + 1, n0);
        bl = (1-a) * b * x(m0, n0 + 1);
        br = a * b * x(m0 + 1, n0 + 1);
        Pb(i, j) = tl + tr + bl + br;
    end
end

figure; imshow(Pb);










