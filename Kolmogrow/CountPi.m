function [ Pi ] = CountPi( Y )

maxC = max(Y);
Pi = zeros(maxC,1);

for i = 1:maxC
    Pi(i) = nnz(Y == i);
end
    Pi = Pi / length(Y);

end

