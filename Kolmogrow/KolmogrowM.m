function [ Order, Ranks ] = KolmogrowM( X, Y )

Pi = CountPi(Y);
Ranks = zeros(length(Pi),1);
Order = 1:length(X(1,:));

for i = 1:length(X(1,:))
    Ranks(i) = Kolmogrov(X(:,i),Y,Pi);
end

[Ranks, Order] = sortrows(Ranks);
Ranks = flipud(Ranks);
Order = flipud(Order);

end

