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
price = 200000;

utilVec = [];
pRange = 0:1:1000;
for i=1:size(pRange, 2)
    p = pRange(i);
    utilVec(end+1) = stackelberg_utility_follower(price, p, p_tx, g_ii, g_ki, g_ie, N);
end

figure;
hold on;
plot(pRange, utilVec);
ylabel('u_i');
xlabel('p_i [mW]');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);