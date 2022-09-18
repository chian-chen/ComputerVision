% original sampling points
x = [0, 0.9, 2.1, 3.3, 4.1, 5.4, 6.5, 7.4, 8.5, 10];
y = sin(x);

% new sampling points
xx = 0:0.1:10;
yy = spline(x,y,xx);

figure;
plot(x,y,'o',xx,yy);

figure;
plot(x, y, 'o');

figure;
plot(xx, yy);
