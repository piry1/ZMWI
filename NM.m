function [ res ] = NM( X1, Y1, X2, Y2 )

    mdl = fitNM(X1,Y1);
    labels = predictNM(mdl, X2);
    res = mismatchError(labels, Y2);
    
end

