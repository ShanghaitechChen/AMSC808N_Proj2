function [W,H,Res] = PGD_plus_Lee_Seung(A, W, H, iter_max, lr)
% PGD+Lee_Seung for P1
    Res = zeros(iter_max,1);
    R = A - W * H;
    for iter = 1 : iter_max
        if iter<= iter_max * 0.5
            W_new = subplus(W + lr * R * H');
            H_new = subplus(H + lr * W' * R);
            W = W_new;
            H = H_new;
            R = A - W * H;
            Res(iter) = norm(R,'fro')^2;
        else
            W = (W .* (A * H')) ./ (W * H * H');
            H = (H .* (W' * A)) ./ (W' * W * H);
            Res(iter) = norm(A - W * H,'fro')^2;
        end
    end
    
end