function [ Xnorm ] = Norm( X )
    
    Xnorm=X;

    for i=1:length(X(1,:))
       % n = norm(X(:,i), inf);
        n = norm(X(:,i), 2);
        Xnorm(:,i) = X(:,i) / n;
    end

end

