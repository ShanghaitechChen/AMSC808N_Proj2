clear;clc;close all
k = 5;
[X, Y, Res] = LRF(5, 100, k);
A = X*Y';
% [M, Res] = NNT(5, 100);
% A = M;

% K-means
%[centers, clusters] = KMeans(A, k, 100);
%histogram(clusters)

% NMF
Res_PGD = zeros(1000, 1);
Res_LS = zeros(1000, 1);
Res_PGD_LS = zeros(1000, 1);
lr = 1e-2;
for run = 1 : 100
    W = rand(size(A, 1),k);
    H = rand(k,size(A, 2));
    [W_PGD,H_PGD,Res1] = PGD(A, W, H, 1000, lr);
    [W_LS,H_LS,Res2] = Lee_Seung(A, W, H, 1000);
    [W_PGD_LS,H_PGD_LS,Res3] = PGD_plus_Lee_Seung(A, W, H, 1000, lr);
    Res_PGD = Res_PGD + Res1;
    Res_LS = Res_LS + Res2;
    Res_PGD_LS = Res_PGD_LS + Res3;
end
Res_PGD = Res_PGD/100;
Res_LS = Res_LS/100;
Res_PGD_LS = Res_PGD_LS/100;
figure(2)
plot(1:1000, Res_PGD(:,1), '-.','LineWidth',2)
hold on
plot(1:1000, Res_LS(:,1), ':','LineWidth',2)
plot(1:1000, Res_PGD_LS(:,1), '--','LineWidth',2)
legend('PGD','Lee-Seung','PGD+Lee-Seung')
xlabel('Iteration (1-1000)');
ylabel('Residuals');
title('Residuals v.s. iterations');
set(gca, 'YScale', 'log')