function [ error ] = mismatchError( results, labels )

    error = ClassificationError;
    len = length(labels);

    error.ConfM = confusionmat(labels, results);
    error.Match = sum(diag(error.ConfM));
    error.Mismatch = len - error.Match;
    error.ClasQuality = (sum(diag(error.ConfM))/length(labels)) * 100;
    error.ClasError = ((length(labels) - sum(diag(error.ConfM)))/length(labels)) * 100;
   
end