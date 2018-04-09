reps = 15;
N = 6:2:12;

filenamesD2DModdedSta_p0 = {};
filenamesCellModdedSta_p0 = {};

filenamesD2DModdedSta_p025 = {};
filenamesCellModdedSta_p025 = {};

filenamesD2DModdedSta_p05 = {};
filenamesCellModdedSta_p05 = {};

filenamesD2DModdedSta_p075 = {};
filenamesCellModdedSta_p075 = {};

filenamesD2DModdedSta_p1 = {};
filenamesCellModdedSta_p1 = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                            
        filenamesD2DModdedSta_p0(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellModdedSta_p0(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DModdedSta_p025(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0.25_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellModdedSta_p025(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0.25_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DModdedSta_p05(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0.5_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellModdedSta_p05(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0.5_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DModdedSta_p075(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0.75_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellModdedSta_p075(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p0.75_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DModdedSta_p1(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p1_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellModdedSta_p1(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study_2/n', int2str(n), '_p1_rep', int2str(rep), '.sca.cell')};   
    end    
end

throughputMatD2DModdedSta_p0 = zeros(size(N, 2), 3);
throughputMatCellModdedSta_p0 = zeros(size(N, 2), 3);

throughputMatD2DModdedSta_p025 = zeros(size(N, 2), 3);
throughputMatCellModdedSta_p025 = zeros(size(N, 2), 3);

throughputMatD2DModdedSta_p05 = zeros(size(N, 2), 3);
throughputMatCellModdedSta_p05 = zeros(size(N, 2), 3);

throughputMatD2DModdedSta_p075 = zeros(size(N, 2), 3);
throughputMatCellModdedSta_p075 = zeros(size(N, 2), 3);

throughputMatD2DModdedSta_p1 = zeros(size(N, 2), 3);
throughputMatCellModdedSta_p1 = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)   
    [throughputMatD2DModdedSta_p0(i, 1), throughputMatD2DModdedSta_p0(i, 2), throughputMatD2DModdedSta_p0(i, 3)] = getMeanVec(filenamesD2DModdedSta_p0(i,:));    
    [throughputMatCellModdedSta_p0(i, 1), throughputMatCellModdedSta_p0(i, 2), throughputMatCellModdedSta_p0(i, 3)] = getMeanVec(filenamesCellModdedSta_p0(i,:));    
    
    [throughputMatD2DModdedSta_p025(i, 1), throughputMatD2DModdedSta_p025(i, 2), throughputMatD2DModdedSta_p025(i, 3)] = getMeanVec(filenamesD2DModdedSta_p025(i,:));    
    [throughputMatCellModdedSta_p025(i, 1), throughputMatCellModdedSta_p025(i, 2), throughputMatCellModdedSta_p025(i, 3)] = getMeanVec(filenamesCellModdedSta_p025(i,:));    
    
    [throughputMatD2DModdedSta_p05(i, 1), throughputMatD2DModdedSta_p05(i, 2), throughputMatD2DModdedSta_p05(i, 3)] = getMeanVec(filenamesD2DModdedSta_p05(i,:));    
    [throughputMatCellModdedSta_p05(i, 1), throughputMatCellModdedSta_p05(i, 2), throughputMatCellModdedSta_p05(i, 3)] = getMeanVec(filenamesCellModdedSta_p05(i,:));    
    
    [throughputMatD2DModdedSta_p075(i, 1), throughputMatD2DModdedSta_p075(i, 2), throughputMatD2DModdedSta_p075(i, 3)] = getMeanVec(filenamesD2DModdedSta_p075(i,:));    
    [throughputMatCellModdedSta_p075(i, 1), throughputMatCellModdedSta_p075(i, 2), throughputMatCellModdedSta_p075(i, 3)] = getMeanVec(filenamesCellModdedSta_p075(i,:));    
    
    [throughputMatD2DModdedSta_p1(i, 1), throughputMatD2DModdedSta_p1(i, 2), throughputMatD2DModdedSta_p1(i, 3)] = getMeanVec(filenamesD2DModdedSta_p1(i,:));    
    [throughputMatCellModdedSta_p1(i, 1), throughputMatCellModdedSta_p1(i, 2), throughputMatCellModdedSta_p1(i, 3)] = getMeanVec(filenamesCellModdedSta_p1(i,:));    
end

figure;
subplot(2,1,1);
hold on;
ylabel({'Overall';'Mean Opinion Score'});
% ylim([3 4.5]);
title('Cellular users');
errorbar(N, throughputMatCellModdedSta_p0(:, 1), throughputMatCellModdedSta_p0(:, 2), throughputMatCellModdedSta_p0(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellModdedSta_p025(:, 1), throughputMatCellModdedSta_p025(:, 2), throughputMatCellModdedSta_p025(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellModdedSta_p05(:, 1), throughputMatCellModdedSta_p05(:, 2), throughputMatCellModdedSta_p05(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellModdedSta_p075(:, 1), throughputMatCellModdedSta_p075(:, 2), throughputMatCellModdedSta_p075(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellModdedSta_p1(:, 1), throughputMatCellModdedSta_p1(:, 2), throughputMatCellModdedSta_p1(:, 3), '--v', 'LineWidth', 2);
xticks(N);
ylim([3.5 4.5]);
legend({'p=0', 'p=0.25', 'p=0.5', 'p=0.75', 'p=1'}, 'Location', 'northeast', 'FontSize', 18);
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
ylabel({'Overall';'Mean Opinion Score'});
% ylim([3 4.5]);
title('D2D users');
errorbar(N, throughputMatD2DModdedSta_p0(:, 1), throughputMatD2DModdedSta_p0(:, 2), throughputMatD2DModdedSta_p0(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DModdedSta_p025(:, 1), throughputMatD2DModdedSta_p025(:, 2), throughputMatD2DModdedSta_p025(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DModdedSta_p05(:, 1), throughputMatD2DModdedSta_p05(:, 2), throughputMatD2DModdedSta_p05(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DModdedSta_p075(:, 1), throughputMatD2DModdedSta_p075(:, 2), throughputMatD2DModdedSta_p075(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DModdedSta_p1(:, 1), throughputMatD2DModdedSta_p1(:, 2), throughputMatD2DModdedSta_p1(:, 3), '--v', 'LineWidth', 2);

xlabel('number of VoIP users per type [#]');
xticks(N);
% xticklabels(N);
set(gca,'FontSize', 26);
legend({'p=0', 'p=0.25', 'p=0.5', 'p=0.75', 'p=1'}, 'Location', 'northeast', 'FontSize', 18);

hold off;