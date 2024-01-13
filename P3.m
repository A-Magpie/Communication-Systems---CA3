%%
clc;
close all;
clear;

%%  Part 1 & 2
N = 50000;
fs = 500;
Tend = 3;
t = linspace(0, Tend, N);
m = @(t) 10 + 5 * sin(3 * pi * t) + 3 * (cos(pi * t)) .^ 3 + sin(pi * t / 4);
m = m(t);

md = m(1:fs:end);
td = linspace(0, Tend, N / fs);

figure;
% subplot(2, 1, 1);
plot(t, m);
title("m_{Analog}(t)");
xlabel("t");

figure;
% subplot(2, 1, 2);
plot(td, md);
title("m_{Sampled}(t)");
xlabel("t");

%%  Part 3
num_levels = 32;
e = 0.5;
Q0 = min(md) - e;
Q31 = max(md) + e;
m_range = Q31 - Q0;
Q_step = m_range / num_levels;
Q_levels = Q0:Q_step:Q31 - Q_step;

mq = zeros(size(md));

for i = 1:length(mq)
    [~, index] = min(abs(md(i) - Q_levels));
    mq(i) = Q_levels(index);
end

figure;
% subplot(2, 1, 1);
hold on
plot(td, mq,'r');
ylim([0 20]);
stem(td,mq,'Color','#1a5b11','LineStyle','none','LineWidth',2);
for i=1:32
    yline(Q_levels(i), 'b', 'LineWidth', 1);
end

title("m_{Quantized}(t)");
xlabel('t');

figure;
% subplot(2, 1, 2);
hold on
stairs(td, mq,'r','LineWidth',2);
ylim([0 20]);
for i=1:32
    yline(Q_levels(i), 'b', 'LineWidth', 1);
end
title("m_{Quantized}(t)");
xlabel('t');

%%  Part 4 - 1
load p.mat;
fsp = 1000;
t2 = linspace(0, Tend, N / fs * fsp);
E_p = sum(p .^ 2);
fprintf("Energy of p (base pulse) : E_p = %f\n", E_p);

%%  Part 4 - 2
G_code = [[0 0 0 0 0]; [0 0 0 0 1]; [0 0 0 1 1]; [0 0 0 1 0]; [0 0 1 1 0]; [0 0 1 1 1]; [0 0 1 0 1]; [0 0 1 0 0]; [0 1 1 0 0]; [0 1 1 0 1]; [0 1 1 1 1]; [0 1 1 1 0]; [0 1 0 1 0]; [0 1 0 1 1]; [0 1 0 0 1]; [0 1 0 0 0]; [1 1 0 0 0]; [1 1 0 0 1]; [1 1 0 1 1]; [1 1 0 1 0]; [1 1 1 1 0]; [1 1 1 1 1]; [1 1 1 0 1]; [1 1 1 0 0]; [1 0 1 0 0]; [1 0 1 0 1]; [1 0 1 1 1]; [1 0 1 1 0]; [1 0 0 1 0]; [1 0 0 1 1]; [1 0 0 0 1]; [1 0 0 0 0]];

G_code_d = [0 1 3 2 6 7 5 4 12 13 15 14 10 11 9 8 24 25 27 26 30 31 29 28 20 21 23 22 18 19 17 16];

mg.sig = zeros([1 length(mq)]);
mg.graycode = zeros([1 length(mq)]);
mg.qlvl = zeros([1 length(mq)]);

for i = 1:length(mq)
    idx = find(Q_levels == mq(i));
    mg.sig(i) = mq(i);
    mg.graycode(i) = G_code_d(idx);
    mg.qlvl(i) = idx;
end

pulse_amp = -31:2:31;

mp = zeros([1 fs * length(mq)]);

for i = 1:length(mq)
    mp(1000 * (i - 1) + 1:1000 * i) = pulse_amp(mg.qlvl(i)) * p;
end

figure;
plot(t2, mp);
title("m_{Pulse Quantized}(t)");
xlabel('t');

%%  Part 5
S_mp = mean(mp .^ 2);
SNR_db = 2;
SNR = 10 ^ (SNR_db / 10);
N_R = S_mp / SNR;
n = sqrt(N_R) * randn(1, length(t2));

sig_r = mp + n;
figure;
plot(t2, sig_r);
title("Received Signal");
xlabel("t");

%%  Part 6

decoded_amp = zeros([1 length(mq)]);

for i = 1:length(mq)
    pro = sig_r(1000 * (i - 1) + 1:1000 * i) .* p;
    mutual_E = sum(pro);
    decoded_amp(i) = floor(mutual_E / E_p);

    if rem(decoded_amp(i), 2) == 0
        decoded_amp(i) = decoded_amp(i) + 1;
    end

end

decoded_message.sig = zeros([1 length(mq)]);
decoded_message.graycode = zeros([1 length(mq)]);
decoded_message.qlvl = zeros([1 length(mq)]);

for i = 1:length(mq)
    idx = find(pulse_amp == decoded_amp(i));
    decoded_message.qlvl(i) = idx;
    decoded_message.graycode(i) = G_code_d(idx);
    decoded_message.sig(i) = Q_levels(idx);
end

figure;
plot(td, decoded_message.sig);
title('decoded signal');
xlabel('t');

BER = 0;

for i = 1:length(decoded_message.qlvl)
    res = 0;

    if decoded_message.graycode(i) ~= mg.graycode(i)
        dmg = dec2bin(decoded_message.graycode(i), 5);
        omg = dec2bin(mg.graycode(i), 5);
        diff = (dmg ~= omg);
        res = sum(diff);
    end

    BER = BER + res;
end

BER = BER / (5 * length(decoded_message.graycode));
fprintf("BER = %f\n", BER);
