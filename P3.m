%%
clc;
close all;
clear;

%%  Part 1 & 2
N = 50000;
fs = 500;
Tend = 3;
t = 0:Tend / N:Tend;
m = @(t) 10 + 5 * sin(3 * pi * t) + 3 * (cos(pi * t)) .^ 3 + sin(pi * t / 4);
m = m(t);

md = m(1:fs:end);
td = 0:Tend / (N / fs):Tend;

figure;
subplot(2, 1, 1);
plot(t, m);
title("m_{Analog}(t)");
xlabel("t");

subplot(2, 1, 2);
plot(td, md);
title("m_{Sampled}(t)");
xlabel("t");

%%  Part 3
num_levels = 32;
e = 0.5;
m_range = e + max(md) - (min(md) + e);
Q_step = m_range / (num_levels - 1);
Q_levels = min(md) - e:Q_step:max(md) + e;

mq = zeros(size(md));

for i = 1:length(mq)
    [~, index] = min(abs(md(i) - Q_levels));
    mq(i) = Q_levels(index);
end

figure;
subplot(2, 1, 1);
plot(td, mq);
title("m_{Quantized}(t)");
subplot(2, 1, 2);
stairs(td, mq);
title("m_{Quantized}(t)");

%%  Part 4

% Convert quantized signal to Gray code

G_code = [[0 0 0 0 0];
            [0 0 0 0 1];
            [0 0 0 1 1];
            [0 0 0 1 0];
            [0 0 1 1 0];
            [0 0 1 1 1];
            [0 0 1 0 1];
            [0 0 1 0 0];
            [0 1 1 0 0];
            [0 1 1 0 1];
            [0 1 1 1 1];
            [0 1 1 1 0];
            [0 1 0 1 0];
            [0 1 0 1 1];
            [0 1 0 0 1];
            [0 1 0 0 0];
            [1 1 0 0 0];
            [1 1 0 0 1];
            [1 1 0 1 1];
            [1 1 0 1 0];
            [1 1 1 1 0];
            [1 1 1 1 1];
            [1 1 1 0 1];
            [1 1 1 0 0];
            [1 0 1 0 0];
            [1 0 1 0 1];
            [1 0 1 1 1];
            [1 0 1 1 0];
            [1 0 0 1 0];
            [1 0 0 1 1];
            [1 0 0 0 1];
            [1 0 0 0 0]];

mg = zeros(size(mq));
