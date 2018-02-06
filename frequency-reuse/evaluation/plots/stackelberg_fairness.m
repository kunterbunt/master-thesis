deltaVec = [0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.25 0.5 0.75 1];
ttiVec = [51 34 26 21 17 15 13 12 10 4 2 2 1];
figure;
plot(deltaVec, ttiVec);
xlabel('\delta');
ylabel('TTIs [#]');
set(gca,'FontSize', 46);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);