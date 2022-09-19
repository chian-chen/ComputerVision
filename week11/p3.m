% x[n] and some parameters

k1 = 0.1;
k2 = 5;
L = 15;

one = ones(1, 50);
zero = zeros(1, 50);

x = [one zero];
Length = length(x);
n = 1:Length;

% noise[n]

noise = (rand(1, Length) - 0.5)./8;

% y[n]

y = x + noise;

% fliter[n]

filter = y;


for i = 1 + L:Length - L
    c = 0;
    filter(i) = 0;
    for j = i - L: i + L 
        filter(i) = filter(i) + y(j) * exp(-k1 * (i - j)^2) * exp(-k2 * (y(i) - y(j))^2);
        c = c + exp(-k1 * (i - j)^2) * exp(-k2 * (y(i) - y(j))^2);
    end
    filter(i) = filter(i) / c;
end

for i = 1:L
    c = 0;
    filter(i) = 0;
    for j = 1: i + L 
        filter(i) = filter(i) + y(j) * exp(-k1 * (i - j)^2) * exp(-k2 * (y(i) - y(j))^2);
        c = c + exp(-k1 * (i - j)^2) * exp(-k2 * (y(i) - y(j))^2);
    end
    filter(i) = filter(i) / c;
end

for i = Length - L + 1:Length
    c = 0;
    filter(i) = 0;
    for j = i - L: Length
        filter(i) = filter(i) + y(j) * exp(-k1 * (i - j)^2) * exp(-k2 * (y(i) - y(j))^2);
        c = c + exp(-k1 * (i - j)^2) * exp(-k2 * (y(i) - y(j))^2);
    end
    filter(i) = filter(i) / c;
end


figure;
subplot(3,1,1);  plot(n, x);  xlim([n(1),n(end)]);
subplot(3,1,2);  plot(n, y);  xlim([n(1),n(end)]);
subplot(3,1,3);  plot(n, filter);  xlim([n(1),n(end)]);



