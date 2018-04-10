reps = 30;
N = 6:2:12;
filenamesD2DPF = {};
filenamesCellPF = {};

filenamesD2DRR = {};
filenamesCellRR = {};

filenamesD2DSta = {};
filenamesCellSta = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesD2DPF(i, rep+1) = {strcat('../../results/paper_voip_pf/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellPF(i, rep+1) = {strcat('../../results/paper_voip_pf/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DRR(i, rep+1) = {strcat('../../results/paper_voip_rr/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellRR(i, rep+1) = {strcat('../../results/paper_voip_rr/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DSta(i, rep+1) = {strcat('../../results/paper_voip_sta/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellSta(i, rep+1) = {strcat('../../results/paper_voip_sta/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
    end    
end

mosMatD2DPF = zeros(size(N, 2), 3);
mosMatCellPF = zeros(size(N, 2), 3);

mosMatD2DRR = zeros(size(N, 2), 3);
mosMatCellRR = zeros(size(N, 2), 3);

mosMatD2DSta = zeros(size(N, 2), 3);
mosMatCellSta = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [mosMatD2DPF(i, 1), mosMatD2DPF(i, 2), mosMatD2DPF(i, 3)] = getMeanVec(filenamesD2DPF(i,:));    
    [mosMatCellPF(i, 1), mosMatCellPF(i, 2), mosMatCellPF(i, 3)] = getMeanVec(filenamesCellPF(i,:));    
    
    [mosMatD2DRR(i, 1), mosMatD2DRR(i, 2), mosMatD2DRR(i, 3)] = getMeanVec(filenamesD2DRR(i,:));        
    [mosMatCellRR(i, 1), mosMatCellRR(i, 2), mosMatCellRR(i, 3)] = getMeanVec(filenamesCellRR(i,:));    
    
    [mosMatD2DSta(i, 1), mosMatD2DSta(i, 2), mosMatD2DSta(i, 3)] = getMeanVec(filenamesD2DSta(i,:));    
    [mosMatCellSta(i, 1), mosMatCellSta(i, 2), mosMatCellSta(i, 3)] = getMeanVec(filenamesCellSta(i,:));    
end

figure;
subplot(2,1,1);
hold on;
ylabel('sum of received bytes [B]');
title('Cellular users');
errorbar(N, mosMatCellPF(:, 1), mosMatCellPF(:, 2), mosMatCellPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatCellRR(:, 1), mosMatCellRR(:, 2), mosMatCellRR(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatCellSta(:, 1), mosMatCellSta(:, 2), mosMatCellSta(:, 3), '--v', 'LineWidth', 2);
legend({'PF', 'RR', 'Novel'});
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
ylabel('sum of received bytes [B]');
title('D2D users');
errorbar(N, mosMatD2DPF(:, 1), mosMatD2DPF(:, 2), mosMatD2DPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatD2DRR(:, 1), mosMatD2DRR(:, 2), mosMatD2DRR(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatD2DSta(:, 1), mosMatD2DSta(:, 2), mosMatD2DSta(:, 3), '--v', 'LineWidth', 2);

xlabel('number of full buffer pairs per type [#]');
% xticklabels(N);
legend({'PF', 'RR', 'Novel'});
set(gca,'FontSize', 26);
hold off;