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
selsectedXdata = [];                        % macierz danych sk³adana na podstawie wektora ko³omogrowa
Ydata = data( : , dataXLength );            % wektor klasyfikacji


resultQ = zeros(12,dataXLength-1);
resultV = zeros(12,dataXLength-1);

kolomogrowVek = 1:dataXLength-1;  % tymczasowa wartoœæ wektora

%**************************************************************************
%                   Klasyfikacja
%**************************************************************************

for i=1:length(kolomogrowVek)
    
    selsectedXdata(:,i) = Xdata(:, kolomogrowVek(i)); 
    
    [resQ, resV] = Classify(selsectedXdata, Ydata);

    resultQ(:,i) = resQ(:,1);
    resultV(:,i) = resV(:,1);
    
end

disp('jakoœæ klasyfikacji');
disp(resultQ.');

disp('wariancja')
disp(resultV.');


