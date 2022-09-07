% im1
im1 = double(imread('./cat1.jpg'));
Im1 = rgb2gray(im1/255);

figure, imshow(Im1);
colormap(gray(256))

% try Erosion 
E = Erosion(Im1);

figure, imshow(E);
colormap(gray(256))

for i=1:8
    E = Erosion(E);
end

figure, imshow(E);
colormap(gray(256))

% try Dilation
D = Dilation(Im1);

figure, imshow(D);
colormap(gray(256))

for i=1:8
    D = Dilation(D);
end

figure, imshow(D);
colormap(gray(256))

% try Opening
Open = Im1;

for i=1:4
    Open = Erosion(Open);
end
for i=1:4
    Open = Dilation(Open);
end

figure, imshow(Open);
colormap(gray(256))

% try Closing
Close = Im1;

for i=1:4
    Close = Dilation(Close);
end
for i=1:4
    Close = Erosion(Close);
end

figure, imshow(Close);
colormap(gray(256))



% Assume the imput M is a 2-D matrix
% ignore the edge case

function A = Erosion(M)
    M_new = M;
    [row,col] = size(M);
    for i = 2:row - 1
        for j =2:col - 1
            M_new(i, j) = min([M(i, j), M(i + 1, j), M(i - 1, j), M(i, j + 1), M(i, j - 1)]);
        end
    end
    A = M_new;
end

function B = Dilation(M)
    M_new = M;
    [row,col] = size(M);
    for i = 2:row - 1
        for j =2:col - 1
            M_new(i, j) = max([M(i, j), M(i + 1, j), M(i - 1, j), M(i, j + 1), M(i, j - 1)]);
        end
    end
    B = M_new;
end