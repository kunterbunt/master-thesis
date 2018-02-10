p_max = 400;
p_min = 1;
p_k = p_max;
g_ke = 1e-6;
g_ki = 1e-8;
g_ie = 1e-8;
g_ii = 1e-6;
N = 4e-18;
beta = 2;

powerVec_gki = [];
powerVec_gke = [];
powerVec_gie = [];
powerVec_gii = [];

gRange = 1e-8:1e-9:1e-6;
for i=1:size(gRange, 2)
    g = gRange(i);    
    powerVec_gki(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g, g_ie, g_ii, N, beta), p_max, p_min, p_k, g, g_ie, g_ii, N);
    powerVec_gke(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p_k, g, g_ki, g_ie, g_ii, N, beta), p_max, p_min, p_k, g_ki, g_ie, g_ii, N);
    powerVec_gie(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g_ki, g, g_ii, N, beta), p_max, p_min, p_k, g_ki, g, g_ii, N);
    powerVec_gii(end+1) = stackelberg_getOptTxPw(stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g_ki, g_ie, g, N, beta), p_max, p_min, p_k, g_ki, g_ie, g, N);
end

figure;
hold on;
subplot(2,2,2);
plot(gRange, powerVec_gki);
ylabel('p_i [mW]');
xlabel('g_{ki}');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2,2,1);
plot(gRange, powerVec_gke);
ylabel('p_i [mW]');
xlabel('g_{ke}');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2,2,4);
plot(gRange, powerVec_gii);
ylabel('p_i [mW]');
xlabel('g_{ii}');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(2,2,3);
plot(gRange, powerVec_gie);
% ylabel('p_i [mW]');
xlabel('g_{ie}');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);