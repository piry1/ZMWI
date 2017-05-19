clc;    % Czyszczenie konsoli
clear;  % Usuwanie danych
addpath('./klasyfikatorNM');

data = csvread('./dane/data.csv');

dataXLength = length(data(1,:));

Xunorm = data( : , 1:(dataXLength-1) );  % macierz danych 
Xnorm = Norm(Xunorm);                    % macierz danych po normalizacji
Y = data( : , dataXLength );        % wektor klasyfikacji

for i=1:2
    X=[];
    if( i == 1 )
        X=Xunorm;
        disp('Nie unormowane wartoœci');
    else
        X=Xnorm;
        disp('Unormowane wartoœci');
    end
    
    % ********** KNN **********

    mdlKNN = fitcknn(X,Y);
    mdlKNN.NumNeighbors = 3;
    labelsKNN = predict(mdlKNN, X);

    k = mismatchError(labelsKNN, Y);
    disp('knn:');
    disp(k);
    
    % ********** NM ***********

    mdlNM = fitNM(X,Y);
    labelsNM = predictNM(mdlNM, X);
    
    k = mismatchError(labelsNM, Y);
    disp('nm:');
    disp(k);
end
% ********** wyniki **********
% 
% disp('Wyniki klasyfikacji');
% disp('KNN:');
% disp(labelsKNN');
% disp('NM:');
% disp(labelsNM');