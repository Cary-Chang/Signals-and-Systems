clear;
close all;
clc
%% Question 1(a)
fs = 10;
Ts = 1/fs;
x = zeros(1,100);
n = (1:1:100);
for i = 1:100
    x(i) = cos(2*pi*(i-1)*Ts);
end
figure(1);
plot(n,x)
title('Question 1(a)--x[n]');
xlabel('n'), ylabel('x[n]');
%% Question 1(b)
L1 = 3;
fc1 = 0.1;
[b1,a1] = butter(L1,fc1);
[h1,w1] = freqz(b1,a1);

figure(2);
subplot(3,3,1),plot(w1,db(h1))
axis([0,pi,-inf,20]);
title('Question 1(b)--Magnitude response');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');

subplot(3,3,2),plot(w1,360/(2*pi)*unwrap(angle(h1)))
axis([0,pi,-inf,inf]);
title('Question 1(b)--Phase response');
xlabel('£s (rad/sec)'), ylabel('Phase (degree)');

y1 = filter(b1,a1,x);
subplot(3,3,3),plot(n,y1)
title('Question 1(b)--Output signal y[n]');
xlabel('n'), ylabel('y[n]');
%% Question 1(c)
L2 = 7;
fc2 = 0.1;
[b2,a2] = butter(L2,fc2);
[h2,w2] = freqz(b2,a2);

subplot(3,3,4),plot(w2,db(h2))
axis([0,pi,-inf,50]);
title('Question 1(c)--Magnitude response');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');

subplot(3,3,5),plot(w2,unwrap(angle(h2))*180/pi)
axis([0,pi,-inf,inf]);
title('Question 1(c)--Phase response');
xlabel('£s (rad/sec)'), ylabel('Phase (degree)');

y2 = filter(b2,a2,x);
subplot(3,3,6),plot(n,y2)
title('Question 1(c)--Output signal y[n]');
xlabel('n'), ylabel('y[n]');
%% Question 1(d)
L3 = 3;
fc3 = 0.5;
[b3,a3] = butter(L3,fc3);
[h3,w3] = freqz(b3,a3);

subplot(3,3,7),plot(w3,db(h3))
axis([0,pi,-inf,50]);
title('Question 1(d)--Magnitude response');
xlabel('£s (rad/sec)'), ylabel('Magnitude (dB)');

subplot(3,3,8),plot(w3,360/(2*pi)*unwrap(angle(h3)))
axis([0,pi,-inf,inf]);
title('Question 1(d)--Phase response');
xlabel('£s (rad/sec)'), ylabel('Phase (degree)');
 
y3 = filter(b3,a3,x);
subplot(3,3,9),plot(n,y3)
title('Question 1(d)--Output signal y[n]');
xlabel('n'), ylabel('y[n]');