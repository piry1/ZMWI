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
[X1, Y1, X2, Y2] = SplitData(Xdata, Ydata); % dzielenie na 2 losowe czêœci

%**************************************************************************
%                   Klasyfikacja
%**************************************************************************
                   
for i=1:2
    
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
        k = KNN(x1, Y1, x2, Y2, nk);
        fprintf('KNN - s¹siedzi: %d\n', nk);
        disp(k.ClasError);
    end
    % ********** NM ***********

    k = NM(x1, Y1, x2, Y2);
    
    disp('NM:');
    disp(k.ClasError);
end
