function [W,H,Res] = Lee_Seung(A,W,H,iter_max)
% Lee-Seung for P1

    k = 10; 
    Res = zeros(iter_max,1);
    %W = rand(n,k);
    %H = rand(k,d);

    for iter = 1 : iter_max
        W = (W .* (A * H')) ./ (W * H * H');
        H = (H .* (W' * A)) ./ (W' * W * H);
        Res(iter) = norm(A - W * H,'fro')^2;
    end
    
end