clc;    % Czyszczenie konsoli
clear;  % Usuwanie danych
addpath('./klasyfikatorNM');

data = csvread('./dane/data.csv');

dataXLength = length(data(1,:));

X = data( : , 1:(dataXLength-1) );  % macierz danych 
Y = data( : , dataXLength );        % wektor klasyfikacji

% ********** KNN **********

mdl = fitcknn(X,Y);
labelsKNN = predict(mdl,X(460:475,:));

% ********** NM ***********

mdlNM = fitNM(X,Y);
labelsNM = predictNM(mdlNM, X(460:475,:));

% ********** wyniki **********

disp('Wyniki klasyfikacji');
disp('KNN:');
disp(labelsKNN');
disp('NM:');
disp(labelsNM');