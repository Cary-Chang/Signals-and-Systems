clear;
close all;
clc

z = [1 1 -1 -1]';
p = [0.3+0.4i 0.3-0.4i 0.1+0.1i 0.1-0.1i]';
k = 0.09;
[b1,a1] = zp2tf(z,p,k);
%% Question (a)
h = zeros(1,61);
n = (0:1:60);
[r1,p1,k1]=residuez(b1, a1);
for i = 1:61
    for j = 1:size(r1,1)
        h(i) = h(i) + r1(j)*p1(j)^(i - 1);
    end
end
h(1) = h(1) + k1;

subplot(4,2,1),stem(n,h)
grid on
title('Question (a)--h[n]');
xlabel('n'), ylabel('h[n]');
%% Question (b)
subplot(4,2,2),zplane(b1, a1)
grid on
title('Question (b)--The locations of poles and zeros of H(z).');
%% Question (c)
[h1,w1] = freqz(b1,a1);
subplot(4,2,3),plot(w1,db(h1))
grid on
axis([0,pi,-inf,0]);
title('Question (c)--Magnitude response');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');

subplot(4,2,4),plot(w1,unwrap(angle(h1))*180/pi)
grid on
axis([0,pi,-inf,inf]);
title('Question (c)--Phase response');
xlabel('£s (rad/sec)'), ylabel('Phase (degree)');
%% Question (d)
sos = zp2sos(z, p, k);
b2 = sos(1,1:3);
a2 = sos(1,4:6);
b3 = sos(2,1:3);
a3 = sos(2,4:6);
%% Question (e)
[h2,w2] = freqz(b2,a2);
subplot(4,2,5),plot(w2,db(h2))
grid on
axis([-inf,inf,-inf,20]);
title('Question (e)--Magnitude response of H_{1}(z)');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');

[h3,w3] = freqz(b3,a3);
subplot(4,2,6),plot(w3,db(h3))
grid on
axis([-inf,inf,-inf,20]);
title('Question (e)--Magnitude response of H_{2}(z)');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');

subplot(4,2,7),plot(w3,db(abs(h2).*abs(h3)))
grid on
axis([0,pi,-inf,0]);
title('Question (e)--Magnitude response of |H_{1}(z)|*|H_{2}(z)|');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');
%% Question (f)
x = zeros(1,61);
x(1) = 1;
y = filter(b1,a1,x);
subplot(4,2,8),stem(n,y)
grid on
title('Question (f)--Impulse response y[n]');
xlabel('n'), ylabel('y[n]');