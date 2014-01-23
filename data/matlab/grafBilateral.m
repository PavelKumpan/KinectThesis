fast = importdata('fast.TXT');
naive = importdata('naive.txt');
gauss = importdata('gauss.TXT');

fast(:, 2) = fast(:, 2) ./ 1000;
naive(:, 2) = naive(:, 2) ./ 1000;
gauss(:, 2) = gauss(:, 2) ./ 1000;

fastPoly = polyfit(fast(:, 1),  fast(:, 2), 2);
naivePoly = polyfit(naive(:, 1),  naive(:, 2), 3);
gaussPoly = polyfit(gauss(:, 1),  gauss(:, 2), 2);

res = linspace(fast(1, 1),fast(end, 1), 128);

plot(naive(:, 1), naive(:, 2), 'bo', ...
     res,  polyval(naivePoly, res), 'b-', ...
     fast(:, 1),  fast(:, 2), 'ro', ...
     res,  polyval(fastPoly, res), 'r-', ...
     gauss(:, 1), gauss(:, 2), 'go', ...
     res,  polyval(gaussPoly, res), 'g-');
 
 grid on;
 
 xlabel('rozli�en� [px]')
 ylabel('�as [s]')
 hleg1 = legend('Naivn� implementace','', 'Rychl� implementace', '', 'Gaussovsk� rozost�en�', '');
 set(hleg1,'Location','NorthWest')
 title('Porovn�n� �asov� n�ro�nosti rychk� implementace Bilater�ln�ho filtru s jeho naivn� implementac�');
 
 axis([-20 1050 -10 250])
 
 
 