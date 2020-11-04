clear; clc; close all
[M, Y] = readdata();
Res_abs = zeros(8, 9);
Res_rel = zeros(8, 9);
[Usvd, Ssvd, Vsvd] = svd(M);
for a = 1:8
    for k = 2:10
        Mtk = Usvd(:,1:k)*Ssvd(1:k,1:k)*Vsvd(:,1:k)';
        for runs = 1 : 100
            [C,U,R,res_absolute, res_relative] = CUR(M,k,a*k,Mtk);
            Res_abs(a, k-1) = Res_abs(a, k-1) + res_absolute;
            Res_rel(a, k-1) = Res_rel(a, k-1) + res_relative;
        end
        Res_abs(a, k-1) = Res_abs(a, k-1) / 100;
        Res_rel(a, k-1) = Res_rel(a, k-1) / 100;
    end
end

plot(1:9, Res_rel(1,:), '--','LineWidth',2)
hold on
plot(1:9, Res_rel(2,:), ':','LineWidth',2)
plot(1:9, Res_rel(3,:), '-.','LineWidth',2)
plot(1:9, Res_rel(4,:), '-o','LineWidth',2)
plot(1:9, Res_rel(5,:), '-+','LineWidth',2)
plot(1:9, Res_rel(6,:), '-*','LineWidth',2)
plot(1:9, Res_rel(7,:), '-d','LineWidth',2)
plot(1:9, Res_rel(8,:), '-s','LineWidth',2)
legend('a=1', 'a=2','a=3','a=4','a=5','a=6','a=7','a=8')
xticklabels({'2','3','4','5','6','7','8','9','10'})
xlabel('k');
ylabel('Relative Residuals');
title('Relative Residuals v.s. iterations when a varies in CUR decomposition.');

figure(2)
plot(1:9, Res_abs(1,:), '--','LineWidth',2)
hold on
plot(1:9, Res_abs(2,:), ':','LineWidth',2)
plot(1:9, Res_abs(3,:), '-.','LineWidth',2)
plot(1:9, Res_abs(4,:), '-o','LineWidth',2)
plot(1:9, Res_abs(5,:), '-+','LineWidth',2)
plot(1:9, Res_abs(6,:), '-*','LineWidth',2)
plot(1:9, Res_abs(7,:), '-d','LineWidth',2)
plot(1:9, Res_abs(8,:), '-s','LineWidth',2)
legend('a=1', 'a=2','a=3','a=4','a=5','a=6','a=7','a=8')
xticklabels({'2','3','4','5','6','7','8','9','10'})
xlabel('k');
ylabel('Absolute Residuals');
title('Absolute Residuals v.s. iterations when a varies in CUR decomposition.');