utilVec = [];
p_k = 398;
g_ke = 1e-8;
g_ki = 1e-8;
g_ie = 1e-8;
g_ii = 1e-8;
N = 4e-18;
beta = 2;

% Plot to price.
range = -10000:1:10000;
for price = range(1):range(end)
    utilVec(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, price);
end

% Plot to channel gains.
gRange = 1e-10:1e-7:1e-5;
price = 10000;
utilVec_gke = [];
utilVec_gki = [];
utilVec_gie = [];
utilVec_gii = [];
for i=1:size(gRange, 2)
    g = gRange(i);
    utilVec_gke(end+1) = stackelberg_utility_leader(p_k, g, g_ki, g_ie, g_ii, N, beta, price);
    utilVec_gki(end+1) = stackelberg_utility_leader(p_k, g_ke, g, g_ie, g_ii, N, beta, price);
    utilVec_gie(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g, g_ii, N, beta, price);
    utilVec_gii(end+1) = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g, N, beta, price);
end

figure;
hold on;
plot(range, utilVec);
xlabel('\alpha_k');
ylabel('leader utility');
set(gca,'FontSize', 26);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;

figure;
hold on;
plot(gRange, utilVec_gke);
xlabel('g_{ke}');
ylabel('leader utility');
set(gca,'FontSize', 48);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;

figure;
hold on;
plot(gRange, utilVec_gki);
xlabel('g_{ki}');
ylabel('leader utility');
set(gca,'FontSize', 48);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;

figure;
hold on;
plot(gRange, utilVec_gie);
xlabel('g_{ie}');
ylabel('leader utility');
set(gca,'FontSize', 48);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;

figure;
hold on;
plot(gRange(10:end), utilVec_gii(10:end));
xlabel('g_{ii}');
ylabel('leader utility');
set(gca,'FontSize', 48);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;