priceVec = [];
p_max = 400;
p_min = 1;
p_tx = 398;
g_ke = 8e-7;
g_ki = 8e-7;
g_ie = 8e-7;
g_ii = 8e-7;
g_ik = 8e-7;
N = -174;
beta = 5;

g_keVec = 8e-9:1e-8:1e-6;
range = g_keVec;
for i=1:size(g_keVec, 2)
    g_ke = g_keVec(i);
    priceVec(end+1) = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta);
end

priceVec

figure;
hold on;
plot(range, priceVec);
xlabel('g_{ke}');
ylabel('\alpha');
set(gca,'FontSize', 26);
hold off;