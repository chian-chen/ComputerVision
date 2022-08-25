% x

x_1 = zeros(1, 20);
x_2 = ones(1, 31);
x_3 = zeros(1, 29);
x_4 = ones(1,31);
x_5 = zeros(1, 20);

x = [x_1  x_2  x_3  x_4  x_5];
n = -30:100;

figure;
stem(n, x);
xlim([n(1),n(end)]);
title('Plot x[n] vs n');
ylabel('x [ n ]');
xlabel('n');

% parameters for h[n] and noise

L = 10;
an = 0.05;
sigma = 1;

% h[n]

h_1 = 1:L;
C = 0;
for i = 1:L
    C = C + exp(-sigma * h_1(i));
    h_1(i) = exp(-sigma * h_1(i));
end
C = 1/C;
h_1 = h_1 * C;
h_2 = fliplr(h_1) * -1;

h = [h_2 0 h_1];

% noise

noise = an * (rand(1,131) - 0.5);

% x1[n] = x[n] + noise

x1 = x + noise;

figure;
stem(n, x1);
xlim([n(1),n(end)]);
title('Plot x1[n] vs n');
ylabel('x1 [ n ]');
xlabel('n');

% conv to find edge

edge = conv(x, h, 'same');
edge1 = conv(x1, h, 'same');

figure;
stem(n, edge);
xlim([n(1),n(end)]);
title('Plot edge vs n');
ylabel('edge [ n ]');
xlabel('n');

figure;
stem(n, edge1);
xlim([n(1),n(end)]);
title('Plot edge1 vs n');
ylabel('edge1 [ n ]');
xlabel('n');

