% read .wav file
[x, fs] = audioread('./short_material.wav'); 
N =  size(x,1);
N1 = floor(N/2);

time = 0:N-1;
time = time/fs;

% from 聲音檔，影像檔，和 Video 檔的讀與寫 (by Matlab)
figure;
subplot(2,1,1);  plot(time, x(:,1));  xlim([time(1),time(end)]);
subplot(2,1,2);  plot(time, x(:,2));  xlim([time(1),time(end)]);

% Try different ways to sound(x)
% sound(x);
% sound(x, fs);
% soundsc(x, fs);

% fft reference: https://www.mathworks.com/help/matlab/ref/fft.html
DFT_x = abs(fft(x));
n = 0:1:N-1;
figure;
subplot(2,1,1);  plot(n, DFT_x(:,1));  xlim([n(1),n(end)]);
subplot(2,1,2);  plot(n, DFT_x(:,2));  xlim([n(1),n(end)]);

% fftshift reference: https://www.mathworks.com/help/matlab/ref/fftshift.html
y = fftshift(DFT_x);
m = n - N1;
f = m*(fs/N);
figure;
plot(f, y);
title('Plot y[f] vs f');
ylabel('y [ f ]');
xlabel('f');