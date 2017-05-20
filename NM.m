function [ res ] = NM( X1, Y1, X2, Y2, distance )

    mdl = fitNM(X1,Y1);
    labels = predictNM(mdl, X2, distance);
    res = mismatchError(labels, Y2);
    
end

