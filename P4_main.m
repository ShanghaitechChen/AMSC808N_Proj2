clear; clc; close all
[M, Y] = readdata();
n = size(M, 1);
k = 50;
[~,~,V] = svd(M,'econ');
Vk = V(:,1:k);
p = sum(Vk.^2,2) / k; 
[maxp, indices] = sort(p, 'descend');
M_new = M(:, indices(1:10000));
% compute leverage score for new matrix containing 10000 cols
[~,~,V] = svd(M_new);
Vk_new = V(:,1:k);
p_new = sum(Vk_new.^2,2) / k; 
[maxp_new, indices_new] = sort(p_new, 'descend');
M_new_5col = M_new(:,indices_new(1:5));

% n*10000
centered = M_new - ones(n,1) * sum(M_new) / n;
[~,~,V] = svd(centered);
principle_component = V(:,1:2);
projection = centered * principle_component;

fsz = 16;clf;
figure(1);
hold on;
grid;
scatter(projection(1:71,1),projection(1:71,2),'d', 'r');
scatter(projection(72:139,1),projection(72:139,2),'o','b');

% n*5
centered = M_new_5col - ones(n,1) * sum(M_new_5col) / n;
[~,~,V] = svd(centered);
principle_component = V(:,1:2);
projection = centered * principle_component;

fsz = 16;
figure(2);
hold on;
grid;
scatter(projection(1:71,1),projection(1:71,2),'d', 'r');
scatter(projection(72:139,1),projection(72:139,2),'o','b');