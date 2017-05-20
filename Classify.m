function [ resQ, resV, resultsM ] = Classify( X, Y )

testCount = 5;  %iloœæ przeprowadzanych testów
dataCount = 12; %iloœæ wyników dla jednego testu
distance = ['euclidean'; 'cityblock'];

resQ = zeros(dataCount, 1); % tablica jakoœci klasyfikacji
resV = zeros(dataCount, 1); % tablica wariancji
results = zeros(dataCount, testCount * 2);
resultsM = ClassificationError;

n=1;
p = gcp();

for i=1:testCount
    
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

        
        % *************** BEZ NORMALIZACJI ****************
        f11 = parfeval(p, @NM, 1, x1, Y1, x2, Y2, distance(1,:));     % NM euk 
        f12 = parfeval(p, @NM, 1, x1, Y1, x2, Y2, distance(2,:));     % NM tax
        
        f21 = parfeval(p, @KNN, 1, x1, Y1, x2, Y2, 1, distance(1,:)); % KNN euk
        f22 = parfeval(p, @KNN, 1, x1, Y1, x2, Y2, 1, distance(2,:)); % KNN tax
      
        f31 = parfeval(p, @KNN, 1,  x1, Y1, x2, Y2, 3, distance(1,:));% KNN 3 euk
        f32 = parfeval(p, @KNN, 1,  x1, Y1, x2, Y2, 3, distance(2,:));% KNN 3 tax
       

        
        % ************** Z Normalizacj¹ *******************
        
        x3 = fetchOutputs(f01); % oczekiwanie na normalizacjê
        x4 = fetchOutputs(f02);
        
        nf11 = parfeval(p, @NM, 1, x3, Y1, x4, Y2, distance(1,:));     % NM euk
        nf12 = parfeval(p, @NM, 1, x3, Y1, x4, Y2, distance(2,:));     % NM tax
        
        nf21 = parfeval(p, @KNN, 1, x3, Y1, x4, Y2, 1, distance(1,:)); % KNN euk
        nf22 = parfeval(p, @KNN, 1, x3, Y1, x4, Y2, 1, distance(2,:)); % KNN tax
        
        nf31 = parfeval(p, @KNN, 1, x3, Y1, x4, Y2, 3, distance(1,:)); % KNN euk
        nf32 = parfeval(p, @KNN, 1, x3, Y1, x4, Y2, 3, distance(2,:)); % KNN tax
        
        resultsM(1,n) = fetchOutputs(f11);
        resultsM(2,n) = fetchOutputs(f12);
        resultsM(3,n) = fetchOutputs(f21);
        resultsM(4,n) = fetchOutputs(f22);
        resultsM(5,n) = fetchOutputs(f31);
        resultsM(6,n) = fetchOutputs(f32);
        resultsM(7,n) = fetchOutputs(nf11);
        resultsM(8,n) = fetchOutputs(nf12);
        resultsM(9,n) = fetchOutputs(nf21);
        resultsM(10,n) = fetchOutputs(nf22);
        resultsM(11,n) = fetchOutputs(nf31);
        resultsM(12,n) = fetchOutputs(nf32);
        
        for c=1:dataCount
            results(c,n) = resultsM(c,n).ClasQuality;
        end
        
        n=n+1;
    end
end

resQ(:, 1) = mean(results, 2);
resV(:, 1) = var(results,0,2);

end

