function [ ] = plots(Lp, Q )

close all;

width = 3;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1.2;      % LineWidth
msz = 6;       % MarkerSize


% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(1);


hold on;
grid on;

set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 2:13
    plot(Lp.',Q(:,i),'LineWidth',lw,'MarkerSize',msz);
end
legend('NM euk','NM tax','KNN euk', 'KNN tax', 'KNN3 euk', 'KNN3 tax', 'n NM euk','n NM tax','n KNN euk', 'n KNN tax', 'n KNN3 euk', 'n KNN3 tax','Location', 'SouthEast');
%print('wyniki/f1','-dbmp');
print('wyniki/f1','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(2);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('Bez normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 2:7
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
end
legend('NM euk','NM tax','KNN euk', 'KNN tax', 'KNN3 euk', 'KNN3 tax','Location', 'SouthEast');
print('wyniki/f2','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(3);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('Po normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 8:13
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
end
legend('NM euk','NM tax','KNN euk', 'KNN tax', 'KNN3 euk', 'KNN3 tax','Location', 'SouthEast');
print('wyniki/f3','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(4);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('Bez normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 2:3
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
    [var, idx] = max(Q(:,i));
    plot(idx, var, 'p', 'LineWidth',lw,'MarkerSize',msz*2);
end
legend('NM euk','NM euk max', 'NM tax', 'NM tax max','Location', 'SouthEast');
print('wyniki/f4','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(5);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('Bez normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 4:7
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
    [var, idx] = max(Q(:,i));
    plot(idx, var, 'p', 'LineWidth',lw,'MarkerSize',msz*2);
end
legend('KNN euk','KNN euk max','KNN tax','KNN tax max', 'KNN3 euk', 'KNN3 euk max','KNN3 tax','KNN3 tax max','Location', 'SouthEast');
print('wyniki/f5','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(6);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('Po normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 8:9
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
    [var, idx] = max(Q(:,i));
    plot(idx, var, 'p', 'LineWidth',lw,'MarkerSize',msz*2);
end
legend('NM euk','NM euk max', 'NM tax', 'NM tax max','Location', 'SouthEast');
print('wyniki/f6','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(7);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('Po normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = 10:13
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
    [var, idx] = max(Q(:,i));
    plot(idx, var, 'p', 'LineWidth',lw,'MarkerSize',msz*2);
end
legend('KNN euk','KNN euk max','KNN tax','KNN tax max', 'KNN3 euk', 'KNN3 euk max','KNN3 tax','KNN3 tax max','Location', 'SouthEast');
print('wyniki/f7','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(8);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('NM przed i po normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = [2,3,8,9]
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
end
legend('NM euk','NM tax', 'n NM euk','n NM tax','Location', 'SouthEast');
print('wyniki/f8','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(9);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('KNN k=1 przed i po normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = [4,5,10,11]
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
end
legend('KNN euk','KNN tax', 'n KNN euk','n KNN tax','Location', 'SouthEast');
print('wyniki/f9','-dpng','-r300');

% *************************************************************************
figure('Position', [100, 100, 1920/2, 1080/2]);
figure(10);
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
set(gca,'XTick',1:2:35);
hold on;
grid on;
title('KNN k=3 przed i po normalizacji')
ylabel('jakoœæ klasyfikacji [%]');
xlabel('iloœæ cech');
for i = [6,7,12,13]
    plot(Lp.',Q(:,i), 'o-','LineWidth',lw,'MarkerSize',msz);
end
legend('KNN euk','KNN tax', 'n KNN euk','n KNN tax','Location', 'SouthEast');
print('wyniki/f10','-dpng','-r300');

end

