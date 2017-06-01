%**************************************************************************
%                   Ustawienia skryptu
%**************************************************************************

clc;    % Czyszczenie konsoli
clear;  % Usuwanie danych
close all;
addpath('./klasyfikatorNM');
addpath('./obliczanieBledu');
addpath('./normalizacja');
addpath('./dzielenieZbioru');
addpath('./Kolmogrow');
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

[ Order, Ranks ] = KolmogrowM(Xdata, Ydata);

%**************************************************************************
%                   Klasyfikacja
%**************************************************************************
l = length(Order);
for i=1:l
   
    Info = [num2str(i), ' of ', num2str(l)];
    disp(Info);
    
    selsectedXdata(:,i) = Xdata(:, Order(i)); 
    [resQ, resV] = Classify(selsectedXdata, Ydata);

    resultQ(:,i) = resQ(:,1);
    resultV(:,i) = resV(:,1);
    
end


Lp = (1:l).';
Q = [ Lp, resultQ.'];
V = [ Lp, resultV.'];
O = [Order, Ranks];


T1 = array2table(Q,...
    'VariableNames',{'liczba_cech', 'NM_euk','NM_tax','KNN_euk', 'KNN_tax', 'KNN3_euk', 'KNN3_tax', 'n_NM_euk','n_NM_tax','n_KNN_euk', 'n_KNN_tax', 'n_KNN3_euk', 'n_KNN3_tax' });

T2 = array2table(V,...
    'VariableNames',{'liczba_cech', 'NM_euk','NM_tax','KNN_euk', 'KNN_tax', 'KNN3_euk', 'KNN3_tax', 'n_NM_euk','n_NM_tax','n_KNN_euk', 'n_KNN_tax', 'n_KNN3_euk', 'n_KNN3_tax' });

T3 = array2table(O,...
    'VariableNames',{'Cecha', 'Miara_K' });


clc;
disp('jakoœæ klasyfikacji');
disp(T1);

disp('wariancja');
disp(T2);

disp('Miara Kolmogrowa');
disp(T3);

disp('Zapisywanie danych do pliku xlsx');
filename = 'wyniki/results.xlsx';
writetable(T1,filename,'Sheet',1);
writetable(T2,filename,'Sheet',2);
writetable(T3,filename,'Sheet',3);

disp('Generowanie wykresów');
plots(Lp, Q);
disp('Koniec');
