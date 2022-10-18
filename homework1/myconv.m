clear;
close all;
clc
%% Question a.
n1_a = -1:41;
u1 = n1_a >= 0 & n1_a <= 20;
x11_a = n1_a .* u1;
u2 = n1_a >= 21 & n1_a <= 40;
x12_a = (40 - n1_a) .* u2;
x1_a = x11_a + x12_a;
subplot(4,2,1),stem(n1_a,x1_a);
axis([-1,41,0,20]);
title('Question a--x_{1}[n]');
n2_a = 0:11;
x2_a = n2_a >= 1 & n2_a <= 10;
subplot(4,2,2),stem(n2_a,x2_a);
axis([0,11,0,2]);
title('Question a--x_{2}[n]');
%% Question b.
x1_a(42:43) = [];
x1_a(1:2) = [];
x2_a(12) = [];
x2_a(1) = [];
n3_b = 2:49;
y1_b = conv(x1_a,x2_a);
subplot(4,2,3),stem(n3_b,y1_b)
axis([2,49,0,200]);
title('Question b--y[n]');
%% Question c.
m1_c = zeros(48,10);
for i = 1:39
    for j = 1:10
        m1_c(i + j - 1,j) = x1_a(i);
    end
end
m2_c = transpose(x2_a);
y2_c = m1_c * m2_c;
subplot(4,2,4),stem(n3_b,y2_c)
axis([2,49,0,200]);
title('Question c--y[n]');
%% Question d.
n4_d = -1:7;
u3 = n4_d >= 1 & n4_d <= 5;
x1_d = (3 .^ n4_d) .* u3;
subplot(4,2,5),stem(n4_d,x1_d)
axis([-1,7,0,300]);
title('Question d--x_{1}[n]');
x2_d = (2 .^ n4_d) .* u3;
subplot(4,2,6),stem(n4_d,x2_d)
axis([-1,7,0,40]);
title('Question d--x_{2}[n]');
x1_d(8:9) = [];
x1_d(1:2) = [];
x2_d(8:9) = [];
x2_d(1:2) = [];
n5_d = 2:10;
y1_d = conv(x1_d,x2_d);
subplot(4,2,7),stem(n5_d,y1_d)
axis([2,10,0,10000]);
title('Question d--y[n](by function conv)');
m1_d = zeros(9,5);
for i = 1:5
    for j = 1:5
        m1_d(i + j - 1,j) = x1_d(i);
    end
end
m2_d = transpose(x2_d);
y2_d = m1_d * m2_d;
subplot(4,2,8),stem(n5_d,y2_d)
axis([2,10,0,10000]);
title('Question d--y[n](by direct computation)');