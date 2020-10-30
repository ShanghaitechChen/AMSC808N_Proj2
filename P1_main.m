clear;clc;close all
k = 5;
[X, Y, Res] = LRF(5, 100, k);
A = X*Y';
% [M, Res] = NNT(5, 100);
% A = M;

% K-means
[centers, clusters] = KMeans(A, k, 100);
histogram(clusters)

% NMF
W = rand(size(A, 1),k);
H = rand(k,size(A, 2));
[W_PGD,H_PGD,Res_PGD] = PGD(A, W, H, 500);
[W_LS,H_LS,Res_LS] = Lee_Seung(A, W, H, 500);
[W_PGD_LS,H_PGD_LS,Res_PGD_LS] = PGD_plus_Lee_Seung(A, W, H, 500);
figure(2)
plot(1:500, Res_PGD(:,1), '-.','LineWidth',2)
hold on
plot(1:500, Res_LS(:,1), ':','LineWidth',2)
plot(1:500, Res_PGD_LS(:,1), '--','LineWidth',2)
legend('PGD','Lee-Seung','PGD+Lee-Seung')
xlabel('Iteration (1-500)');
ylabel('Residuals');
title('Residuals v.s. iterations');
set(gca, 'YScale', 'log')