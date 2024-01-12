%%
clc;
close all;
clear;

%%  Part 1

%%  Part 2
N1 = 1000;
X1 = randn([1 N1]);
Y1 = randn([1 N1]);

figure;
subplot(2, 1, 1);
histogram(X1, N);
title('X | N = 1000');

subplot(2, 1, 2);
histogram(Y1, N);
title('Y | N = 1000');

%%   Part 3
Z1 = sqrt(X1 .^ 2 + Y1 .^ 2);

figure;
histogram(Z1, N);

E_z = mean(Z1);
Var_z = E_z - mean(Z1 .* Z1 - E_z);

fprintf("E[Z] = %f\n", E_z);
fprintf("Var[Z] = %f\n", Var_z);

%%  Part 4
N2 = 100000;
X2 = randn([1 N2]);
Y1 = randn([1 N2]);

figure;
subplot(2, 1, 1);
histogram(X2, N2);
title('X | N = 100000');

subplot(2, 1, 2);
histogram(Y2, N2);
title('Y | N = 100000');

Z2 = sqrt(X2 .^ 2 + Y2 .^ 2);

figure;
histogram(Z2, N);

E_z = mean(Z2);
Var_z = E_z - mean(Z2 .* Z2 - E_z);

fprintf("E[Z] = %f\n", E_z);
fprintf("Var[Z] = %f\n", Var_z);
