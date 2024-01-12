%%
clc;
close all;
clear;

%%   Part 2
fs = 100;
t = -0.5:1 / fs:0.5;
N = 1e2;

A = 10;
w = 5 * pi;
teta = 2 * pi * rand(1, N);
X = @(t, teta) A * cos(w * t + teta);

% Generating R.P:
x = zeros(length(t), N);

for i = 1:length(t)

    for j = 1:N
        x(i, j) = X(t(i), teta(j));
    end

end

% Finding E[x]
E_x = zeros([1 length(t)]);

E_x = mean(x');
figure
plot(t, E_x);
title('E(X_t)');
xlabel('t');
ylim([-1 1]); % ???

%%  Part 3

X2 = @(t, tau, teta) A * cos(w * (t + tau) + teta);
tau = t;

Xt = zeros(length(t), N, length(tau));

for i = 1:length(t)

    for k = 1:N

        for j = 1:length(tau)
            Xt(i, k, j) = X2(t(i), tau(j), teta(k));
        end

    end

end

x3 = repmat(x, 1, 1, length(tau));
pro = Xt .* x3;
E_x = mean(pro, 2);
R_x = squeeze(E_x);

figure;
surf(tau, t, R_x);
