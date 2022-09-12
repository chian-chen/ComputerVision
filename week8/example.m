% input data

a = [7 8];
b = [9 8];
c = [10 10];
d = [11 12];
e = [13 12];

A = [a; b; c; d; e];

% A = A - mean

mean = sum(A) / size(A, 1);
A = A - mean;

% SVD step by step

B = A' * A;
C = A * A';

[V,D] = eig(B);
[U,O] = eig(C);

U(abs(U) < 1e-10) = 0;
V(abs(V) < 1e-10) = 0;

I = V * V';

B_check = V * D * V';
C_check = U * O * U';
B_check(abs(B_check) < 1e-10) = 0;
C_check(abs(C_check) < 1e-10) = 0;

% eigenvalue from big to small

V = flip(V, 2);
U = flip(U, 2);

S1 = U' * A * V;
S = abs(S1);
S(abs(S) < 1e-10) = 0;


for i = 1:size(S1, 2)
    if(S1(i, i) < 0)
        U(:, i) = U(:, i) .* -1;
    end
end

A_check = U * S * V';



% call bulit-in library to check

[U_check, S_check, V_check] = svd(A);


