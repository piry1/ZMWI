function [ Pxj ] = CountPxj( X, Y )

maxC = max(Y);
maxX = max(X);
Pxj = zeros(maxC,maxX);

for j = 1:maxC
    k = 1;
    M = zeros(1,nnz(Y == j));
    for i = 1:length(Y)       
        if(Y(i) == j)
            M(k) = X(i);
            k = k+1;
        end
    end
   
    for x = 1:maxX
        Pxj(j,x) = nnz(M == x)/length(M);
    end
    
end

end

