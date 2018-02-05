p_max = 400;
p_min = 1;
p_tx = 398;
g_ke = 1e-8;
g_ki = 1e-8;
g_ik = 1e-8;
g_ie = 1e-8;
g_ii = 1e-8;
N = 4e-18;
beta = 2;

powerVec_gki = [];
powerVec_gie = [];
powerVec_gii = [];

gRange = 1e-8:1e-6:1e-1;
for i=1:size(gRange, 2)
    g = gRange(i);
    price = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta);
%     price = 200000;
    powerVec_gki(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g, g_ie, g_ii, N);
    powerVec_gie(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g_ki, g, g_ii, N);
    powerVec_gii(end+1) = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g_ki, g_ie, g, N);    
end

powerVec_pmax = [];
powerVec_pmin = [];
powerVec_ptx = [];
pRange = 1:1:400;
for i=1:size(pRange, 2)
    p = pRange(i);
    powerVec_pmax(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta), p, p_min, p_tx, g_ki, g_ie, g_ii, N);
    powerVec_pmin(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta), p_max, p, p_tx, g_ki, g_ie, g_ii, N);
    powerVec_ptx(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta), p_max, p_min, p, g_ki, g_ie, g_ii, N);
end

powerVec_beta = [];
betaRange = 2:1:10;
for i=1:size(betaRange, 2)
    b = betaRange(i);
    powerVec_beta(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p, g_ke, g_ki, g_ie, g_ik, g_ii, N, b), p_max, p_min, p, g_ki, g_ie, g_ii, N);
end

figure;
hold on;
subplot(3,3,1);
plot(gRange, powerVec_gki);
ylim([0 400]);
xlabel('g_{ki}');
set(gca,'FontSize', 26);

subplot(3,3,2);
plot(gRange, powerVec_gie);
ylim([0 400]);
xlabel('g_{ie}');
set(gca,'FontSize', 26);

subplot(3,3,3);
plot(gRange, powerVec_gii);
ylim([0 400]);
xlabel('g_{ii}');
set(gca,'FontSize', 26);

subplot(3,3,4);
plot(pRange, powerVec_pmax);
ylim([0 400]);
ylabel('p_i [mW]');
xlabel('p_{max}');
set(gca,'FontSize', 26);

subplot(3,3,5);
plot(pRange, powerVec_pmin);
ylim([0 400]);
xlabel('p_{min}');
set(gca,'FontSize', 26);

subplot(3,3,6);
plot(pRange, powerVec_ptx);
ylim([0 400]);
xlabel('p_{k}');
set(gca,'FontSize', 26);

subplot(3,3,7);
plot(betaRange, powerVec_beta);
% ylim([0 400]);
xlabel('\beta');
set(gca,'FontSize', 26);