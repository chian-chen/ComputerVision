% follow page 17's example

delta_t = 0.1;
T = 2;
fs = 1/delta_t;
N = T/delta_t + 1;
N1 = (N-1)/2;

n_f = 0 : delta_t : T/2;
y_f = (2 .* n_f).^2;

n_b = T/2+delta_t : delta_t : T;
y_b = (4 - 2 .* n_b).^2;

n = 0:1:(N-1);
x = [y_f y_b];

figure;
stem(n, x);
title('Plot x[n] vs n');
ylabel('x [ n ]');
xlabel('n');

DFT_x = abs(fft(x));
figure;
stem(n, DFT_x);
title('Plot DFT(x[n]) vs n');
ylabel('DFT(x [ n ])');
xlabel('n');

y = fftshift(DFT_x);
n = -N1:1:N1;
f = fs/N .* (n);
figure;
stem(f, y);
title('Plot y[f] vs f');
ylabel('y [ f ]');
xlabel('f');



