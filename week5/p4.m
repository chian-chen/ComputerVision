% x

x_0 = zeros(1, 200);
x_1 = ones(1, 150);
x_2 = -1:0.01:1;
x_3 = -1 * x_2;

x_n = 0:0.05:2*pi;
x_4 = sin(x_n);

x = [x_0 x_1 x_0 x_2 x_0 x_3 x_0 x_4 x_0];
n = 1:length(x);


% h[n]

h = x_2;

% page 34, x * h[-n]

y = conv(x, h * -1, 'same');

figure;
subplot(3,1,1);  plot(n, x);  xlim([n(1),n(end)]);

h_plot = [h zeros(1, length(x) - length(h))];   % make it look clear

subplot(3,1,2);  plot(n, h_plot);  xlim([n(1),n(end)]);
subplot(3,1,3);  plot(n, y);  xlim([n(1),n(end)]);

% page 36

h_sum = sum(h.^2);
tau = (length(h) - 1)/2;
denominator = zeros(1, length(x));

for i = tau + 1: length(x) - tau
    denominator(i) = sum(x(i - tau : i + tau).^2);
end
denominator = denominator * h_sum;

y_36 = y;

for i = 1:length(y_36)
    if denominator(i) == 0
        y_36(i) = 0;
    else 
        y_36(i) = y_36(i) / sqrt(denominator(i));
    end
end

figure;
subplot(4,1,1);  plot(n, x);  xlim([n(1),n(end)]);
subplot(4,1,2);  plot(n, h_plot);  xlim([n(1),n(end)]);
subplot(4,1,3);  plot(n, y_36);  xlim([n(1),n(end)]);
subplot(4,1,4);  plot(n, y_36);  xlim([n(1),n(end)]); ylim([0.8, 1]);


% page 39

h_mean = sum(h) / length(h);
h1 = h - h_mean;
y_39 = conv(x, h1 * -1, 'same');

h1_sum = sum(h1.^2);
tau1 = (length(h1) - 1)/2;
denominator1 = zeros(1, length(x));

for i = tau1 + 1: length(x) - tau1
    x0 = sum(x(i - tau1 : i + tau1)) / (2 * tau + 1);
    denominator1(i) = sum( (x(i - tau1 : i + tau1) - x0 ).^2 );
end
denominator1 = denominator1 * h1_sum;

for i = 1:length(y_39)
    if denominator1(i) == 0
        y_39(i) = 0;
    else 
        y_39(i) = y_39(i) / sqrt(denominator1(i));
    end
end


figure;
subplot(4,1,1);  plot(n, x);  xlim([n(1),n(end)]);

h1_plot = [h1 zeros(1, length(x) - length(h1))];

subplot(4,1,2);  plot(n, h1_plot);  xlim([n(1),n(end)]);
subplot(4,1,3);  plot(n, y_39);  xlim([n(1),n(end)]);
subplot(4,1,4);  plot(n, y_39);  xlim([n(1),n(end)]); ylim([0, 1]);





