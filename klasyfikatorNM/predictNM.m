function [ labels ] = predictNM( mdl, X )

labels = zeros( length(X(:,1)) , 1);

    for j=1:length(X(:,1))
        d=[];
        for i=1:length(mdl.ClassNames)
            x=abs( [ X(j,:) ; mdl.Means(i,:) ] );
            d(i) = pdist(x,'euclidean');
        end
        [~, pos] = min(d);
        labels(j,1) = pos;
    end

end

