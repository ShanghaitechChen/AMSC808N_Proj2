function [W,H,Res] = PGD(A, W, H, iter_max)
% PGD for P1
    Res = zeros(iter_max,1);
    R = A - W * H;
    for iter = 1 : iter_max
        W_new = subplus(W + 1e-2 * R * H');
        H_new = subplus(H + 1e-2 * W' * R);
        W = W_new;
        H = H_new;
        R = A - W * H;
        Res(iter) = norm(R,'fro')^2;
    end
    
end