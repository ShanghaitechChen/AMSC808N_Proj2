% Plotting for P2(a)
clear;clc;close all
Residual = [];
reviews = [];
[X, Y, Res] = LRF(0.25, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(0.25, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(1, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(2, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(3, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(4, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(5, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
[X, Y, Res] = LRF(10, 100, 10);
Residual = [Residual, Res];
reviews = [reviews, reshape(X*Y', 720, 1)];
% Plotting box for reviews
boxplot(reviews)
xticklabels({'0.25','0.5','1','2','3','4','5','10'})
xlabel('\lambda');
ylabel('Ratings');
title('Boxplots for the ratings when \lambda varies using LRF');
% Plotting lines for Residual
figure(2)
plot(1:100, Residual(:,1))
hold on
plot(1:100, Residual(:,2), '--')
plot(1:100, Residual(:,3), ':')
plot(1:100, Residual(:,4), '-.')
plot(1:100, Residual(:,5), 'o')
plot(1:100, Residual(:,6), '+')
plot(1:100, Residual(:,7), '*')
plot(1:100, Residual(:,8), 'd')
legend('\lambda=0.25','\lambda=0.5','\lambda=1','\lambda=2','\lambda=3','\lambda=4','\lambda=5','\lambda=10')
xlabel('Iteration (1-100)');
ylabel('Residuals');
title('Residuals v.s. iterations when \lambda varies using LRF');

% Plotting for P2(b)
figure(3)
Residual = [];
reviews = [];
[M, Res] = NNT(0.25, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(0.5, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(1, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(2, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(3, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(4, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(5, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
[M, Res] = NNT(10, 100);
Residual = [Residual, Res];
reviews = [reviews, reshape(M, 720, 1)];
% Plotting box for reviews
boxplot(reviews)
xticklabels({'0.25','0.5','1','2','3','4','5','10'})
xlabel('\lambda');
ylabel('Ratings');
title('Boxplots for the ratings when \lambda varies using NNT');
% Plotting lines for Residual
figure(4)
plot(1:100, Residual(:,1))
hold on
plot(1:100, Residual(:,2), '--')
plot(1:100, Residual(:,3), ':')
plot(1:100, Residual(:,4), '-.')
plot(1:100, Residual(:,5), 'o')
plot(1:100, Residual(:,6), '+')
plot(1:100, Residual(:,7), '*')
plot(1:100, Residual(:,8), 'd')
legend('\lambda=0.25','\lambda=0.5','\lambda=1','\lambda=2','\lambda=3','\lambda=4','\lambda=5','\lambda=10')
xlabel('Iteration (1-100)');
ylabel('Residuals');
title('Residuals v.s. iterations when \lambda varies using NNT');

% time comparison
figure(5)
tic
for i = 1:100
    [M, Res] = NNT(10, 100);
end
time_NNT = toc;
tic
for i = 1:100
    [X, Y, Res] = LRF(10, 100, 10);
end
time_LRF = toc;
time_NNT = time_NNT / 100;
time_LRF = time_LRF / 100;
bar([time_LRF, time_NNT])
xticklabels({'LRF','NNT'})
xlabel('Method');
ylabel('Time / s');
title('Average time to perform one run of LRF or NNT');