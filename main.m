%**************************************************************************
%                   Ustawienia skryptu
%**************************************************************************

clc;    % Czyszczenie konsoli
clear;  % Usuwanie danych
addpath('./klasyfikatorNM');
addpath('./obliczanieBledu');
addpath('./normalizacja');
addpath('./dzielenieZbioru');

%**************************************************************************
%                   Przygotowanie danych
%**************************************************************************

data = csvread('./dane/data.csv'); % wczytywanie danych

dataXLength = length(data(1,:));
Xdata = data( : , 1:(dataXLength-1) );      % macierz danych 
Ydata = data( : , dataXLength );            % wektor klasyfikacji

%**************************************************************************
%                   Klasyfikacja
%**************************************************************************

[res, resM] = Classify(Xdata, Ydata);


%25s

disp('b³¹d klasyfikacji | wariancja');
disp(res);

