function [ Px ] = CountPx( Pj, Pxj )

Px = zeros(1,length(Pxj(1,:)));

for i = 1:length(Pj)
    Pxj(i,:) = Pj(i) * Pxj(i,:);
end

for i = 1:length(Px)
   Px(i) = sum(Pxj(:,i)); 
end

end

