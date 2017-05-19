function [ mdl ] = fitNM( X, Y )

    mdl = nmModel; % create model
    
    % extract classes
    for i=1:length(Y)
        if(~any(mdl.ClassNames == Y(i)))
            mdl.ClassNames(length(mdl.ClassNames)+1) = Y(i);
        end
    end
    
    % sort objects from X matrix 
    for i=1:length(mdl.ClassNames)
        sd = [];
        n=1;
        for j=1:length(X(:,1))
           if(Y(j) == mdl.ClassNames(i))
            sd(n,:) = X(j,:);
            n=n+1;
           end
        end
        % count means
        mdl.Means(i,:) = mean(sd);
    end
    
end

