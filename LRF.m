function [X, Y, Res] = LRF(lambda, iter_max, k)
% Low-rank factorization for P2(a)
    A = readmatrix('MovieRankings36.csv');
    [n, d] = size(A);
    Omega = {};
    for i = 1:n
        Omega{i} = find(~isnan(A(i,:)));
    end
    for i = 1:d
        Omega{n+i} = find(~isnan(A(:, i)));
    end
    Y = rand(d, k);
    [X, Y, Res] = LRF_solver(A, Y, Omega, lambda, iter_max, n, k);
end

function [X, Y, Res] = LRF_solver(A, Y, Omega, lambda, iter_max, n, k)
    X = zeros(n, k);
    Res = zeros(iter_max, 1);
    for iter = 1 : iter_max
        for i = 1 : n
            Y_t = Y(Omega{i},:);
            a = A(i,Omega{i})';
            X(i,:) = ((Y_t' * Y_t + lambda * eye(k,k)) \ (Y_t' * a))';
        end
        for i = 1 : size(A, 2)
            X_t = X(Omega{n+i},:);
            a = A(Omega{n+i},i);
            Y(i,:) = ((X_t' * X_t + lambda * eye(k,k)) \ (X_t' * a))';
        end

        res = A - (X * Y');
        Res(iter) = norm(res(~isnan(A)),'fro');
    end
end