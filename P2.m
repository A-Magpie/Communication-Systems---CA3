%%
clc;
close all;
clear;

%%   Part 2
fs = 100;
t = -0.5:1 / fs:0.5;
N = 1e4;

A = 10;
w = 5 * pi;
teta = 2 * pi * rand(1, N);
Xt = @(t, teta) A * cos(w * t + teta);

x1 = zeros(length(t), N);

for i = 1:length(t)

    for j = 1:N
        x1(i, j) = Xt(t(i), teta(j));
    end

end

Ex_practical = mean(x1');

figure
plot(t, Ex_practical);
title('E(X_t)');
xlabel('t');
ylim([-5 5]);

%%  Part 3

X_t_plus_tau = @(t, tau, teta) A * cos(w * (t + tau) + teta);

tau = t;

x2 = zeros(length(t), N, length(tau));

for i = 1:length(t)

    for k = 1:N

        for j = 1:length(tau)
            x2(i, k, j) = X_t_plus_tau(t(i), tau(j), teta(k));
        end

    end

end

x3 = repmat(x1, 1, 1, length(tau));
pro = x2 .* x3;
Rx = squeeze(mean(pro, 2));

figure;
mesh(tau, t, Rx);
title("R_X(\tau)")
ylabel("t");
xlabel("\tau");

%%  Part 4
Ex_theory = zeros(1, length(t));
Rx_theory = (A ^ 2) / 2 * cos(w * tau);

figure;
subplot(2, 1, 1);
plot(tau, Ex_theory);
title("E_{X,theory}(\tau)");
xlabel('\tau');
ylim([-5 5]);

subplot(2, 1, 2);
plot(tau, Ex_practical);
title("E_{X,practical}(\tau)");
xlabel('\tau');
ylim([-5 5]);

Rx_practical = mean(Rx, 1);

figure;
subplot(2, 1, 1);
plot(tau, Rx_theory);
title("R_{X,theory}(\tau)");
xlabel('\tau');

subplot(2, 1, 2);
plot(tau, Rx_practical);
title("R_{X,practical}(\tau)");
xlabel('\tau');
