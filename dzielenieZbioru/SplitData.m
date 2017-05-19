function [ X1, Y1, X2, Y2 ] = SplitData( X, Y )

len = length(Y);

% inicjalizacja danych
X1 = zeros(len/2, length( X(1,:) ));
X2 = X1;

Y1 = zeros(len/2,1);
Y2 = Y1;

% losowanie indeksów
[~, idx] = datasample(Y, len/2,'Replace',false);

% przypisywanie wartoœci

x1 = 1;
x2 = 1;

for i=1:len
    if( any( idx == i) )
       X1(x1, :) = X(i, :);
       Y1(x1) = Y(i);
       x1 = x1 + 1;
    else
       X2(x2, :) = X(i, :);
       Y2(x2) = Y(i);
       x2 = x2 + 1;
    end
end

end

