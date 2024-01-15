%%
clc;
close all;
clear;

%%  Part 1
z=linspace(0,10,700);
f=@(t) t.*exp(-t.^2/2);

figure;
plot(z,f(z));
title("f_Z(z)");
xlabel('z');
%%  Part 2
N1 = 1000;
nbin = 120;
X1 = randn([1 N1]);
Y1 = randn([1 N1]);
t = -50:1/50:50;
X = 60/sqrt(2*pi) .* exp(-t.^2 /2 );


figure;
subplot(2, 1, 1);
hold on;
histogram(X1, nbin);
plot(t,X)
title('f_X(x) | N = 1000');
xlabel('x');
xlim([-4 4]);

subplot(2, 1, 2);
hold on
histogram(Y1, nbin);
plot(t,X)
title('f_Y(y) | N = 1000');
xlabel('y');
xlim([-4 4]);
%%   Part 3
Z1 = sqrt(X1 .^ 2 + Y1 .^ 2);

figure;
histogram(Z1, nbin);
title('f_Z(z) | N = 1000');
xlabel('z');

E_z = mean(Z1);
Var_z = E_z - mean(Z1 .* Z1 - E_z);

fprintf("for N = %d :\n",N1);
fprintf("E[Z] = %f\n", E_z);
fprintf("Var[Z] = %f\n", Var_z);

%%  Part 4
N2 = 100000;
X2 = randn([1 N2]);
Y2 = randn([1 N2]);
X = 7500/sqrt(2*pi) .* exp(-t.^2 /2 );


figure;
subplot(2, 1, 1);
hold on
histogram(X2, nbin);
plot(t,X)
title('f_X(x) | N = 100000');
xlabel('x');
xlim([-4 4]);

subplot(2, 1, 2);
hold on
histogram(Y2, nbin);
plot(t,X)
title('f_Y(y) | N = 100000');
xlabel('y');
xlim([-4 4]);

Z2 = sqrt(X2 .^ 2 + Y2 .^ 2);
t = 0:1/50:5;
X = 4000 * f(t);

figure;
hold on
histogram(Z2, nbin);
plot(t,X);
title('f_Z(z) | N = 100000');
xlabel('z');


E_z = mean(Z2);
Var_z = E_z - mean(Z2 .* Z2 - E_z);

fprintf("\nfor N = %d :\n",N2);
fprintf("E[Z] = %f\n", E_z);
fprintf("Var[Z] = %f\n", Var_z);
