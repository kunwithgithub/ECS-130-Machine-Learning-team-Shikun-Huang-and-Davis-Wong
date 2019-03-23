%Author: Shikun Huang, Davis Wong
clear;
load mnistdata;

% Visualize a selected train/test digit
T(1,:) = mean(train0);
T(2,:) = mean(train1);
T(3,:) = mean(train2);
T(4,:) = mean(train3);
T(5,:) = mean(train4);
T(6,:) = mean(train5);
T(7,:) = mean(train6);
T(8,:) = mean(train7);
T(9,:) = mean(train8);
T(10,:) = mean(train9);

%figure(1)
disp(rows);
testVec = zeros(10,1);
res = centroid(test3, T);
disp(round(mean(res)));

function res = centroid(A, T)
    [rows column] = size(A);
    n = rows;
    sol = zeros(round(n),1);
    for i = 1:(n-1) %for each test image
       z = double(A(i,:));
       dist = zeros(10,1);
       min = 99999;
       mincol = 99999;
       for k=1:10 %for each training image
            dist(k) = norm( z - T(k,:) );
            if dist(k) < min
                min = dist(k);
                mincol = k - 1;
            end
       end
       sol(i) = mincol; 
   end 
   res = sol;
end


