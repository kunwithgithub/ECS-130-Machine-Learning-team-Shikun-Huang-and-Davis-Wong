%author: Shikun Huang, Davis Wong
%professor: Zhaojun Bai
clear;
load mnistdata;

basis_len = 5;
Us=zeros( 28*28, basis_len, 10);
for k=1:10
    % go through each digit 0 to 9
    s = strcat('train',num2str(k-1));
    A = double(eval(s));

    % and get first 5 singular vector
  [U,~,~] = svds( A', basis_len );
    Us(:,:,k)=U;
end

res = pca(test6, Us);
disp(round(mean(res)));

function res = pca(A, Us)
    [rows column] = size(A);
    n = rows;
    sol = zeros(round(n),1);
    for i = 1:(n-1)
        z = double(A(14,:))';
        dist = zeros(10,1);
        min = 99999;
        mincol = 99999;
        for k=1:10
            Uk = Us(:,:,k);
            dist(k) = norm( z - Uk*(Uk'*z));
            if dist(k) < min
                min = dist(k);
                mincol = k;
            end
        end
        sol(i) = mincol - 1;
    end
    res = sol;
end




