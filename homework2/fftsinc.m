clear;
close all;
clc
%% 1(a)
N = 501;
T = 50;
N1 = (N-1)/2;
Ts = T/N1;
n = (-250:1:250);
x = zeros(1,N);

for i = 1:N
    x(i) = sinc((i-251)*Ts);
end
subplot(3,2,1),plot(n,x)
title('Question 1(a)--x[n]');
xlabel('n'), ylabel('x[n]');
%% 1(b)
X = fft(x);
X = fftshift(abs(X));
w = n.*(2*pi/N);
subplot(3,2,2),plot(w,X)
title('Question 1(b)--DFT of x[n]');
axis([-250*(2*pi/N),250*(2*pi/N),0,6]);
xlabel('angular frequency £s'), ylabel('amplitude');
%% 1(c)
Xk = zeros(1,N);
for k = 1:N
    sum = 0;
    for i = 1:N
        sum = sum + x(i)*exp(-(1j*2*pi*(k-251)*(i-251)/N));
    end
    Xk(k) = abs(sum);
end
subplot(3,2,3),plot(w,Xk)
title('Question 1(c)--magnitude of X_{k}(e^{j£s})');
axis([-250*(2*pi/N),250*(2*pi/N),0,6]);
xlabel('angular frequency £s'), ylabel('amplitude'); 
%% 2(d)
Tw = T/2;
W = zeros(1,N);
for i = 1:N
    if abs((i-251)*Ts) <= Tw/2
        W(i) = 0.5*(1+cos(2*pi*abs(i-251)*Ts/Tw));
    end
end
subplot(3,2,4),plot(n,W)
title('Question 2(d)--w[n]');
xlabel('n'), ylabel('w[n]');
%% 2(e)
y = x.*W;
subplot(3,2,5),plot(n,y)
title('Question 2(e)--y[n]');
xlabel('n'), ylabel('y[n]');
%% 2(f)
Y = fft(y);
Y = fftshift(abs(Y));
subplot(3,2,6),plot(w,Y)
title('Question 2(f)--DFT of y[n]');
axis([-250*(2*pi/N),250*(2*pi/N),0,6]);
xlabel('angular frequency £s'), ylabel('amplitude');