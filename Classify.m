function [ res, resultsM ] = Classify( X, Y )

res = zeros(6,2);
results = zeros(6,10);
resultsM = ClassificationError;
n=1;
p = gcp();

for i=1:5
    
    [X1, Y1, X2, Y2] = SplitData(X, Y); % dzielenie na 2 losowe czêœci
  
    for j=1:2

        if(j==2) % zamiana
            [X2, X1] = deal(X1, X2);
            [Y2, Y1] = deal(Y1, Y2);
        end

        % przypisanie waartoœci
        x1=X1;
        x2=X2;
        f01 = parfeval(p, @Norm, 1, X1);
        f02 = parfeval(p, @Norm, 1, X2);

        
        % *************** Bez Normalizacji ****************
        f1 = parfeval(p, @KNN, 1, x1, Y1, x2, Y2, 1);      
        f2 = parfeval(p, @KNN, 1,  x1, Y1, x2, Y2, 3);       
        f3 = parfeval(p, @NM, 1, x1, Y1, x2, Y2);
        

        % ************** Z Normalizacj¹ *******************
        
        x3 = fetchOutputs(f01);
        x4 = fetchOutputs(f02);
        
        f4 = parfeval(p, @KNN, 1, x3, Y1, x4, Y2, 1);      
        f5 = parfeval(p, @KNN, 1, x3, Y1, x4, Y2, 3); 
        resultsM(6,n) = NM(x3, Y1, x4, Y2);
        
        resultsM(1,n) = fetchOutputs(f1);
        resultsM(2,n) = fetchOutputs(f2);
        resultsM(3,n) = fetchOutputs(f3);
        resultsM(4,n) = fetchOutputs(f4);
        resultsM(5,n) = fetchOutputs(f5);
        
        for c=1:6
            results(c,n) = resultsM(c,n).ClasError;
        end
        
        n=n+1;
    end
end

res(:, 1) = mean(results, 2);
res(:, 2) = var(results,0,2);

end

