% Gram-Schmidt method 
% convert  1, n, n^2, n^3, n^4 into an orthonormal vector set where n is in [0, 10].

% size
n = 11;
c = 5;

one  = ones(1, n);
a = 0 : n - 1;
V = zeros(n, c);

V(:, 1) = ones;
for i = 2:c
    V(:, i) = a.^(i - 1);
end


% Gram-Schmidt Process


for i = 1:c
    s = zeros(n, 1);
    for j = 1:i - 1
        s = s + sum(V(:, i) .* V(:, j)) .* V(:, j);
    end
    g = V(:, i) - s;
    V(:, i) = g ./ sqrt(sum(g .* g));
end

V(abs(V) < 1e-10) = 0;

% check

Check = zeros(c, c);
for i = 1 : c
    for j = 1: c
        Check(i, j) = sum(V(:, i) .* V(:, j));
    end
end

Check(abs(Check) < 1e-10) = 0;














