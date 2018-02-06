utilVec = [];
p_i = 398;
p_k = 398;
g_ke = 1e-8;
g_ki = 1e-8;
g_ie = 1e-8;
g_ii = 1e-8;
N = 4e-18;
beta = 7;

% Plot to price.
% range = 0:1:1e5;
% for alpha_k = range(1):range(end)
%     utilVec(end+1) = stackelberg_utility_leader_ori(alpha_k, p_i, p_k, g_ke, g_ie, N, beta);
% end

% Plot to channel gains.
gRange = 1e-10:1e-7:1e-5;
alpha_k = 10;
% utilVec_gke = [];
utilVec_gie = [];
for i=1:size(gRange, 2)
    g = gRange(i);
%     utilVec_gke(end+1) = stackelberg_utility_leader_ori(alpha_k, p_i, p_k, g, g_ie, N, beta);    
    utilVec_gie(end+1) = stackelberg_utility_leader_ori(alpha_k, p_i, p_k, g_ke, g, N, beta);    
end

% Plot to follower's power.
utilVec_pi = [];
pRange = 1:1:p_k;
for i=1:size(pRange,2)
    p = pRange(i);
    utilVec_pi(end+1) = stackelberg_utility_leader_ori(alpha_k, p, p_k, g_ke, g_ie, N, beta);
end

figure;
hold on;
% subplot(2,2,1);
% plot(range, utilVec);
% xlabel('\alpha_k');
% ylabel('leader utility');
% set(gca,'FontSize', 48);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

% subplot(2,2,2);
% plot(gRange, utilVec_gke);
% xlabel('g_{ke}');
% ylabel('leader utility');
% set(gca,'FontSize', 48);
% set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(1,2,1);
plot(gRange, utilVec_gie);
xlabel('g_{ie}');
ylabel('leader utility');
set(gca,'FontSize', 48);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);

subplot(1,2,2);
plot(pRange, utilVec_pi);
xlabel('p_{i}');
ylabel('leader utility');
set(gca,'FontSize', 48);
set(findall(gca, 'Type', 'Line'),'LineWidth', 2);
hold off;