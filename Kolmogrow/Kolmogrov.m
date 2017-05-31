function [ Rank ] = Kolmogrov( X, Y, Pi )

Pxj = CountPxj(X, Y);
Px = CountPx(Pi, Pxj);

tmp = Pxj;

for i = 1:length(Px)
    tmp(:,i) = abs(tmp(:,i) - Px(i));
end

tmp2 = zeros(length(Pi),1);

for i = 1:length(Pi)
    tmp2(i) = sum(tmp(i,:)) * Pi(i);
end

Rank = sum(tmp2);

end

