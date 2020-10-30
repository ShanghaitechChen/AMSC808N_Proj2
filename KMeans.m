function [centers, clusters] = KMeans(A, k, iter_max)
% K-means for P1
    n = size(A, 1);
    clusters = zeros(n, 1);
    p = randperm(n);
    centers = A(p(1:k), :);
    for iter = 1 : iter_max
        clusters = Assign(A, n, k, centers, clusters);
        centers = Recenter(A, centers, clusters);
    end
    centers = centers';
end

function [clusters] = Assign(A, n, k, centers, clusters)
    for i = 1 : n
        closest = 1;
        dis = norm(A(i,:) - centers(1,:));
        for j = 2 : k
            dis_new = norm(A(i,:) - centers(j,:));
            if dis_new < dis
                closest = j;
            end
        end
        clusters(i) = closest;
    end
end

function [centers] = Recenter(A, centers, clusters)
    for i = 1 : size(centers, 1)
        if sum(clusters(:,1)==i)~=0
            centers(i, :) = mean(A(clusters(:,1)==i,:));
        end
    end
end
            
