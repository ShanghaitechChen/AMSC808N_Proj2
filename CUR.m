function [C,U,R,res_absolute, res_relative] = CUR(M,k,c,Mtk)
% CUR decomposition for P3
    C = ColumnSelect(M,k,c);
    R = ColumnSelect(M',k,c)';
    U = pinv(C)*M*pinv(R);
    res_absolute = norm(M - C*U*R,'fro');
    res_relative = res_absolute / norm(M - Mtk,'fro');
end

 
function [CorR] = ColumnSelect(A,k,c)
    [~,~,V] = svd(A,'econ');
    Vk = V(:,1:k);
    p = c * sum(Vk.^2,2) / k; 
    p(p > 1) = 1;
    CorR = A(:,(rand(size(p))<=p));
end