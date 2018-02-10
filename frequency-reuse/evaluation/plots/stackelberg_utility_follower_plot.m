p_max = 400;
p_min = 1;
p_k = 398;
g_ke = 1e-8;
g_ki = 1e-8;
g_ik = 1e-8;
g_ie = 1e-8;
g_ii = 1e-8;
N = 4e-18;
beta = 2;
price1 = 4e5;
price2 = 0.5 * price1;
price3 = 0.5 * price2;

utilVec1 = [];
utilVec2 = [];
utilVec3 = [];
pRange = 0:1:1000;
for i=1:size(pRange, 2)
    p = pRange(i);
    utilVec1(end+1) = stackelberg_utility_follower(price1, p, p_k, g_ii, g_ki, g_ie, N);
    utilVec2(end+1) = stackelberg_utility_follower(price2, p, p_k, g_ii, g_ki, g_ie, N);
    utilVec3(end+1) = stackelberg_utility_follower(price3, p, p_k, g_ii, g_ki, g_ie, N);
end

figure;
hold on;
plot(pRange, utilVec1);
plot(pRange, utilVec2);
plot(pRange, utilVec3);
legend({strcat('\alpha_k=', int2str(price1)), strcat('\alpha_k=', int2str(price2)), strcat('\alpha_k=', int2str(price3))}, 'Location', 'northwest')
ylabel('u_i');
xlabel('p_i [mW]');
set(gca,'FontSize', 32);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);