utilVec = [];
p_tx = 398;
g_ke = 8e-7;
g_ki = 8e-7;
g_ie = 8e-7;
g_ii = 8e-7;
N = -174;
beta = 5;

% % Plot to price.
% range = -1000:1000;
% for price = range(1):range(end)
%     utilVec(end+1) = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, price);
% end
% 
% figure;
% hold on;
% plot(range, utilVec);
% xlabel('\alpha');
% ylabel('leader utility');
% set(gca,'FontSize', 26);
% hold off;
% 
% % Plot to g_ke
% g_keVec = 8e-7:1e-3:1;
% price = 100;
% utilVec2 = [];
% for i=1:size(g_keVec, 2)
%     g = g_keVec(i);
%     utilVec2(end+1) = stackelberg_utility_leader(p_tx, g, g_ki, g_ie, g_ii, N, beta, price);
% end
% 
% figure;
% hold on;
% plot(g_keVec, utilVec2);
% xlabel('g_ke');
% ylabel('leader utility');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
% hold off;

% Plot to g_ie
% price = 100;
% g_ieVec = 8e-8:1e-7:8e-6;
% utilVec3 = [];
% 
% for i=1:size(g_ieVec, 2)
%     g = g_ieVec(i);
%     utilVec3(end+1) = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g, N, beta, price);
% end
% 
% figure;
% hold on;
% plot(g_ieVec, utilVec3);
% xlabel('g_{ie}');
% ylabel('leader utility');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
% hold off;

% % Plot to g_ki
% price = 100;
% g_ii = 8e-7;
% g_kiVec = 8e-8:1e-7:8e-6;
% utilVec4 = [];
% 
% for i=1:size(g_kiVec, 2)
%     g = g_kiVec(i);
%     utilVec4(end+1) = stackelberg_utility_leader(p_tx, g_ke, g, g_ie, g_ii, N, beta, price);
% end
% 
% figure;
% hold on;
% plot(g_kiVec, utilVec4);
% xlabel('g_{ii}');
% ylabel('leader utility');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
% hold off;