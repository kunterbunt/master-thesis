utilVec = [];
p_k = 400;
g_ke = 1e-8;
g_ki = 1e-8;
g_ie = 1e-8;
g_ii = 1e-8;
N = 4e-18;
beta = 5;
price = 10000;

% Plot to channel gains.
gRange = 1e-8:1e-9:1e-4;
utilVec_gke = [];
utilVec_gki = [];
utilVec_gie = [];
utilVec_gii = [];
for i=1:size(gRange, 2)
    g = gRange(i);
%     utilVec_gke(end+1) = stackelberg_utility_leader(p_k, g, g_ki, g_ie, g_ii, N, beta, stackelberg_getOptPrice(p_max, p_min, p_k, g, g_ki, g_ie, g_ii, N, beta));
%     utilVec_gki(end+1) = stackelberg_utility_leader(p_k, g_ke, g, g_ie, g_ii, N, beta, stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g, g_ie, g_ii, N, beta));
%     utilVec_gie(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g, g_ii, N, beta, stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g_ki, g, g_ii, N, beta));
%     utilVec_gii(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g, N, beta, stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g_ki, g_ie, g, N, beta));

    utilVec_gke(end+1) = stackelberg_utility_leader(p_k, g, g_ki, g_ie, g_ii, N, beta, price);
    utilVec_gki(end+1) = stackelberg_utility_leader(p_k, g_ke, g, g_ie, g_ii, N, beta, price);
    utilVec_gie(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g, g_ii, N, beta, price);
    utilVec_gii(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g, N, beta, price);
end

% utilVec_price = [];
% priceRange = 0:1:10;
% for i=1:size(priceRange, 2)
%     price2 = priceRange(i);
%     utilVec_price(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, price2);
% end

figure;
hold on;
% plot(range, utilVec);
% xlabel('\alpha_k');
% ylabel('leader utility');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
% hold off;

subplot(2, 2, 1);
plot(gRange, utilVec_gke);
xlabel('g_{ke}');
xticklabels({'10^{-8}', '', '10^{-4}'});
ylabel('utility u_k');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;

subplot(2, 2, 2);
plot(gRange, utilVec_gki);
xlabel('g_{ki}');
xticklabels({'10^{-8}', '', '10^{-4}'});
% ylabel('leader utility');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2, 2, 3);
plot(gRange, utilVec_gie);
xlabel('g_{ie}');
xticklabels({'10^{-8}', '', '10^{-4}'});
ylabel('utility u_k');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2, 2, 4);
plot(gRange, utilVec_gii);
xlabel('g_{ii}');
xticklabels({'10^{-8}', '', '10^{-4}'});
% ylabel('leader utility');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;

% figure;
% plot(priceRange, utilVec_price);
% xlabel('\alpha_{k}');
% ylabel('utility u_k');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);