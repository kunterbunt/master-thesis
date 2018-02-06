p_max = 400;
p_min = 1;
p_tx = 398;
g_ke = 1e-8;
g_ki = 1e-8;
g_ik = 1e-8;
g_ie = 1e-8;
g_ii = 1e-8;
N = 4e-18;
beta = 5;

% powerVec_gki = [];
powerVec_gie = [];
powerVec_gii = [];

gRange = 1e-8:1e-9:1e-6;
for i=1:size(gRange, 2)
    g = gRange(i);
    price = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta);
%     price = 200000;
%     powerVec_gki(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g, g_ie, g_ii, N);
    powerVec_gie(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g_ki, g, g_ii, N);
    powerVec_gii(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g_ki, g_ie, g, N);    
end

% powerVec_pk = [];
% pwrRange = 1:2:400;
% for i=1:size(pwrRange, 2)
%     p = pwrRange(i);    
%     powerVec_pk(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta), p_max, p_min, p, g_ki, g_ie, g_ii, N);
% end

powerVec_price = [];
priceRange = 1:0.1:10;
for i=1:size(priceRange, 2)
    price = priceRange(i);
    powerVec_price(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p, g_ki, g_ie, g_ii, N);
end

figure;
hold on;
% subplot(3,2,1);
% plot(gRange, powerVec_gki);
% % ylim([0 400]);
% xlabel('g_{ki}');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2,2,1);
plot(gRange, powerVec_gie);
ylabel('p_i [mW]');
xlabel('g_{ie}');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2,2,2);
plot(gRange, powerVec_gii);
ylabel('p_i [mW]');
xlabel('g_{ii}');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

% subplot(3,2,4);
% plot(pwrRange, powerVec_pk);
% % ylim([0 400]);
% xlabel('p_{k}');
% set(gca,'FontSize', 26);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2,2,3);
plot(priceRange, powerVec_price);
ylabel('p_i [mW]');
xlabel('\alpha_k');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);