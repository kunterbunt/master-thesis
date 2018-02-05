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

priceVec_gke = [];
priceVec_gki = [];
priceVec_gie = [];
priceVec_gii = [];
gRange = 1e-8:1e-6:1e-1;
for i=1:size(gRange, 2)
    g = gRange(i);
    priceVec_gke(end+1) = stackelberg_getOptPrice(p_max, p_min, p_tx, g, g_ki, g_ie, g_ik, g_ii, N, beta);
    priceVec_gki(end+1) = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g, g_ie, g_ik, g_ii, N, beta);
    priceVec_gie(end+1) = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g_ki, g, g_ik, g_ii, N, beta);
    priceVec_gii(end+1) = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g, N, beta);
end

priceVec_ptx = [];
priceVec_pmax = [];
pRange=1:1:400;
for i=1:size(pRange, 2)
    p = pRange(i);
    priceVec_ptx(end + 1) = stackelberg_getOptPrice(p_max, p_min, p, g, g_ki, g_ie, g_ik, g_ii, N, beta);
    priceVec_pmax(end + 1) = stackelberg_getOptPrice(p, p_min, p_tx, g, g_ki, g_ie, g_ik, g_ii, N, beta);
end

figure;
hold on;
subplot(3,2,1);
plot(gRange, priceVec_gke);
ylabel('\alpha_k');
xlabel('g_{ke}');
set(gca,'FontSize', 26);

subplot(3,2,2);
plot(gRange, priceVec_gki);
ylabel('\alpha_k');
xlabel('g_{ki}');
set(gca,'FontSize', 26);

subplot(3,2,3);
plot(gRange, priceVec_gie);
ylabel('\alpha_k');
xlabel('g_{ie}');
set(gca,'FontSize', 26);

subplot(3,2,4);
plot(gRange, priceVec_gii);
ylabel('\alpha_k');
xlabel('g_{ii}');
set(gca,'FontSize', 26);

subplot(3,2,5);
plot(pRange, priceVec_ptx);
ylabel('\alpha_k');
xlabel('p_{tx} [mW]');
set(gca,'FontSize', 26);

subplot(3,2,6);
plot(pRange, priceVec_pmax);
ylabel('\alpha_k');
xlabel('p_{max} [mW]');
set(gca,'FontSize', 26);

hold off;