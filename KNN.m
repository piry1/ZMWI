function [ res ] = KNN( X1, Y1, X2, Y2, nk, distance)

    mdl = fitcknn(X1,Y1);
    mdl.NumNeighbors = nk;
    mdl.Distance = distance;  
    labels = predict(mdl, X2);
    res = mismatchError(labels, Y2);

end

