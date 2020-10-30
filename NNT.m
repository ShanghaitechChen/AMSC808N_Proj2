function [M,Res] = NNT(lambda, iter_max)
% Nuclear norm trick for P2(b)
    A = readmatrix('MovieRankings36.csv');
    [n,d] = size(A);
    Res = zeros(iter_max,1);
    At = A;
    M = rand(n,d) * 5;
    
    for iter = 1 : iter_max
        At(isnan(A)) = M(isnan(A));
        [U,S,V] = svd(At);
        St = subplus(S - lambda * eye(n,d));
        M = U * St * V';
        res = A - M;
        Res(iter) = norm(res(~isnan(A)),'fro');
    end
end