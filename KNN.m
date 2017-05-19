function [ res ] = KNN( X1, Y1, X2, Y2, nk )

    mdl = fitcknn(X1,Y1);
    mdl.NumNeighbors = nk;
    labels = predict(mdl, X2);
    res = mismatchError(labels, Y2);

end

