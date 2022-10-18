clear;
close all;
clc
%% Question 2(a)
Ts = 0.002;
f1 = 100;
M = 1000;
x = zeros(1,M);
n = (1:1:M);
for i = 1:M
    x(i) = cos(2*pi*(i-1)*Ts) + 2*cos(2*pi*f1*(i-1)*Ts);
end
subplot(3,1,1),plot(n,x)
title('Question 2(a)--x[n]');
xlabel('n'), ylabel('x[n]');
%% Question 2(b)
[b1,a1] = butter(16,0.22);
y1 = filter(b1,a1,x);
subplot(3,1,2),plot(n,y1)
axis([-inf,inf,-1.5,1.5]);
title('Question 2(b)--Output signal y[n]');
xlabel('n'), ylabel('y[n]');
%% Question 2(c)
[b2,a2] = butter(16,[0.27 0.83]);
y2 = filter(b2,a2,x);
subplot(3,1,3),plot(n,y2)
axis([-inf,inf,-2.5,2.5]);
title('Question 2(c)--Output signal y[n]');
xlabel('n'), ylabel('y[n]');