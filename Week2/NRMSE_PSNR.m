% NRMSE and PSNR

x = double(imread('./meow.jpg'));
y = double(imread('./meowmeow.jpg'));


NRMSE = CalNRMSE(x, y);
PSNR = CalPSNR(x, y);

% Assume x and y are color images, and x and y have the same size
function A = CalNRMSE(x,y)
    shape = size(x);
    up = 0;
    down = 0;
    
    for m = 1 : shape(1)
        for n = 1 : shape(2)
            for c = 1 : shape(3)
                up = up + (x(m,n,c) - y(m,n,c))^2;
                down = down + x(m,n,c)^2;
            end
        end
    end
    
    A = sqrt(up/down);
end

function B = CalPSNR(x,y)
    shape = size(x);
    down = 0;
    
    for m = 1 : shape(1)
        for n = 1 : shape(2)
            for c = 1 : shape(3)
                down = down + (x(m,n,c) - y(m,n,c))^2;
            end
        end
    end
    down = down / shape(1)/ shape(2) / 3;
    B = 10* log10(255*255/down);
end