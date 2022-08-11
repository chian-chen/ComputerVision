%hw2 
clc;

%Part#1 (a)

N = 1001;
T = 100;
N1 = (N-1)/2;

n = -N1:1:N1;
Ts = T/N1;

x = sin(2*pi*Ts*n) ./ (2*pi*Ts*n);
% sin(2pit)/2pit = 1 when t->0
x(N1+1) = 1;

figure;
 plot(n, x);
 title('Plot x[n] vs n');
 ylabel('x [ n ]');
 xlabel('n');

%Part#1 (b)

X_fft = abs(fft(x));
X_fft = fftshift(X_fft);
omega = 2*pi/N .* (n-1)

figure;
 plot(omega, X_fft);
 title('Plot X_{fft} vs w');
 ylabel('X_{fft} [ w ]');
 xlabel('w');

%Part#1 (c)

X_Myfft = abs(my_fft(x, N));
X_Myfft = fftshift(X_Myfft);

figure;
 plot(omega, X_Myfft);
 title('Plot X_{Myfft} vs w');
 ylabel('X_{Myfft} [ w ]');
 xlabel('w');

%Part#2 (d)

Tw = T/2;
w = zeros(1,2*N1+1);
for i = -N1:N1
    if abs(i*Ts)<=Tw/2
        w(i+N1+1) = 0.5*(1+cos(2*pi*abs(i*Ts)/Tw));
    end
end

figure;
 plot(n, w);
 title('Plot w[n] vs n');
 ylabel('w [ n ]');
 xlabel('n');
 axis([-500 500 0 1]);

%Part#2 (e)
y = x .* w;
figure;
 plot(n, y);
 title('Plot y[n] vs n');
 ylabel('y [ n ]');
 xlabel('n');
 
%Part#2 (f)
Y_fft = abs(fft(y));
Y_fft = fftshift(Y_fft);
figure;
 plot(omega, Y_fft);
 title('Plot Y_{fft} vs w');
 ylabel('Y_{fft} [ w ]');
 xlabel('w');

function y = my_fft(x, N)
    X = zeros(1,N);
    for i = 1:N
        for k = 1:N
            X(i) = X(i) + x(k)*exp(-1i*(2*pi/N)*(i-1)*(k-1)); 
        end
    end
    y = X;
end
