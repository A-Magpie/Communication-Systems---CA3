%%
clc;
close all;
clear;

%%
%   Part 1

%%
%   Part 2
N = 100000;
X = randn([1 N]);
Y = randn([1 N]);

% X = X ./ sum(X);
% Y = Y ./ sum(Y);

figure;
subplot(2, 1, 1);
histogram(X, N);
title('X | N = 1000');

subplot(2, 1, 2);
histogram(Y, N);
title('Y | N = 1000');

%%
%   Part 3
Z = sqrt(X .^ 2 + Y .^ 2);
% Z = Z ./ sum(Z);

figure;
histogram(Z, N);

E_z = mean(Z);
Var_z = E_z - mean(Z .* Z - E_z);

fprintf("E[Z] = %f\n" , E_z);
fprintf("Var[Z] = %f\n" , Var_z);
