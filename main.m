clc;    % Czyszczenie konsoli
clear;  % Usuwanie danych
addpath('./klasyfikatorNM');
addpath('./obliczanieBledu');
addpath('./normalizacja');
addpath('./dzielenieZbioru');

data = csvread('./dane/data.csv');

dataXLength = length(data(1,:));

Xdata = data( : , 1:(dataXLength-1) );      % macierz danych 
Ydata = data( : , dataXLength );            % wektor klasyfikacji
[X1, Y1, X2, Y2] = SplitData(Xdata, Ydata); % dzielenie na 2 losowe czêœci

Xunorm = data( : , 1:(dataXLength-1) );  
                   
for i=1:2
    x1=[];
    x2=[];
    
    if( i == 1 )
        x1=X1;
        x2=X2;
        disp('Nie unormowane wartoœci');
    else
        x1=Norm(X1);
        x2=Norm(X2);
        disp('Unormowane wartoœci');
    end
    
    % ********** KNN **********
    
    for nk = [1 3]
        mdlKNN = fitcknn(x1,Y1);
        mdlKNN.NumNeighbors = nk;
        labelsKNN = predict(mdlKNN, x2);

        k = mismatchError(labelsKNN, Y2);
        fprintf('KNN - s¹siedzi: %d\n', nk);
        disp(k.ClasError);
    end
    % ********** NM ***********

    mdlNM = fitNM(x1,Y1);
    labelsNM = predictNM(mdlNM, x2);
    
    k = mismatchError(labelsNM, Y2);
    disp('NM:');
    disp(k.ClasError);
end
% ********** wyniki **********
% 
% disp('Wyniki klasyfikacji');
% disp('KNN:');
% disp(labelsKNN');
% disp('NM:');
% disp(labelsNM');