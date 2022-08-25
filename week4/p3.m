% x

x = (-50:100) * 0.1;
n = -50:100;

figure;
stem(n, x);
xlim([n(1),n(end)]);
title('Plot x[n] vs n');
ylabel('x [ n ]');
xlabel('n');

% parameters for h[n] and noise

L = 20;
an = 0.5;
sigma = 0.5;

% noise

noise = an * (rand(1,151) - 0.5);

% h[n]

h_1 = 1:L;
C = 0;

for i = 1:L
    C = C + exp(-sigma * h_1(i));
    h_1(i) = exp(-sigma * h_1(i));
end

C = 1/ (2 * C + 1);
h_1 = C * h_1;
h_2 = fliplr(h_1);

h = [h_2 C h_1];

% x1[n] = x[n] + noise

x1 = x + noise;

figure;
stem(n, x1);
xlim([n(1),n(end)]);
title('Plot x1[n] vs n');
ylabel('x1 [ n ]');
xlabel('n');

% smoother

smoother = conv(x1, h, 'same');


figure;
stem(n, smoother);
xlim([n(1),n(end)]);
title('Plot smoother vs n');
ylabel('smoother [ n ]');
xlabel('n');
