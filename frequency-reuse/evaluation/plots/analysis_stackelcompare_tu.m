reps = 30;
N = 6:2:12;
filenamesD2DNoReuse = {};
filenamesCellNoReuse = {};

filenamesD2DRandReuse = {};
filenamesCellRandReuse = {};

filenamesD2DStaReuse = {};
filenamesCellStaReuse = {};

filenamesD2DStaReuseTx = {};
filenamesCellStaReuseTx = {};

filenamesD2DModdedSta = {};
filenamesCellModdedSta = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesD2DNoReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_noreuse/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellNoReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_noreuse/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DRandReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_random/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellRandReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_random/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DStaReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellStaReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DStaReuseTx(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta_tx/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellStaReuseTx(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta_tx/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DModdedSta(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellModdedSta(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
    end    
end

throughputMatD2DNoReuse = zeros(size(N, 2), 3);
throughputMatCellNoReuse = zeros(size(N, 2), 3);

throughputMatD2DRandReuse = zeros(size(N, 2), 3);
throughputMatCellRandReuse = zeros(size(N, 2), 3);

throughputMatD2DStaReuse = zeros(size(N, 2), 3);
throughputMatCellStaReuse = zeros(size(N, 2), 3);

throughputMatD2DStaReuseTx = zeros(size(N, 2), 3);
throughputMatCellStaReuseTx = zeros(size(N, 2), 3);

throughputMatD2DModdedSta = zeros(size(N, 2), 3);
throughputMatCellModdedSta = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [throughputMatD2DNoReuse(i, 1), throughputMatD2DNoReuse(i, 2), throughputMatD2DNoReuse(i, 3)] = getMeanVec(filenamesD2DNoReuse(i,:));    
    [throughputMatCellNoReuse(i, 1), throughputMatCellNoReuse(i, 2), throughputMatCellNoReuse(i, 3)] = getMeanVec(filenamesCellNoReuse(i,:));    
    
    [throughputMatD2DRandReuse(i, 1), throughputMatD2DRandReuse(i, 2), throughputMatD2DRandReuse(i, 3)] = getMeanVec(filenamesD2DRandReuse(i,:));    
    [throughputMatCellRandReuse(i, 1), throughputMatCellRandReuse(i, 2), throughputMatCellRandReuse(i, 3)] = getMeanVec(filenamesCellRandReuse(i,:));    
    
    [throughputMatD2DStaReuse(i, 1), throughputMatD2DStaReuse(i, 2), throughputMatD2DStaReuse(i, 3)] = getMeanVec(filenamesD2DStaReuse(i,:));    
    [throughputMatCellStaReuse(i, 1), throughputMatCellStaReuse(i, 2), throughputMatCellStaReuse(i, 3)] = getMeanVec(filenamesCellStaReuse(i,:));    
    
    [throughputMatD2DStaReuseTx(i, 1), throughputMatD2DStaReuseTx(i, 2), throughputMatD2DStaReuseTx(i, 3)] = getMeanVec(filenamesD2DStaReuseTx(i,:));    
    [throughputMatCellStaReuseTx(i, 1), throughputMatCellStaReuseTx(i, 2), throughputMatCellStaReuseTx(i, 3)] = getMeanVec(filenamesCellStaReuseTx(i,:));    
    
    [throughputMatD2DModdedSta(i, 1), throughputMatD2DModdedSta(i, 2), throughputMatD2DModdedSta(i, 3)] = getMeanVec(filenamesD2DModdedSta(i,:));    
    [throughputMatCellModdedSta(i, 1), throughputMatCellModdedSta(i, 2), throughputMatCellModdedSta(i, 3)] = getMeanVec(filenamesCellModdedSta(i,:));    
end

figure;
subplot(2,1,1);
hold on;
ylabel({'Overall';'Mean Opinion Score'});
% ylim([3 4.5]);
title('Cellular users');
errorbar(N, throughputMatCellNoReuse(:, 1), throughputMatCellNoReuse(:, 2), throughputMatCellNoReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellRandReuse(:, 1), throughputMatCellRandReuse(:, 2), throughputMatCellRandReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellStaReuse(:, 1), throughputMatCellStaReuse(:, 2), throughputMatCellStaReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellStaReuseTx(:, 1), throughputMatCellStaReuseTx(:, 2), throughputMatCellStaReuseTx(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellModdedSta(:, 1), throughputMatCellModdedSta(:, 2), throughputMatCellModdedSta(:, 3), '--v', 'LineWidth', 2);
xticks(N);
% xticklabels(N);
legend({'TU + no reuse', 'TU + random reuse', 'TU + Stackelberg reuse', 'TU + Stackelberg reuse w/ p_i', 'novel scheduler'}, 'Location', 'southwest', 'FontSize', 18);
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
ylabel({'Overall';'Mean Opinion Score'});
% ylim([3 4.5]);
title('D2D users');
errorbar(N, throughputMatD2DNoReuse(:, 1), throughputMatD2DNoReuse(:, 2), throughputMatD2DNoReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DRandReuse(:, 1), throughputMatD2DRandReuse(:, 2), throughputMatD2DRandReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DStaReuse(:, 1), throughputMatD2DStaReuse(:, 2), throughputMatD2DStaReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DStaReuseTx(:, 1), throughputMatD2DStaReuseTx(:, 2), throughputMatD2DStaReuseTx(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DModdedSta(:, 1), throughputMatD2DModdedSta(:, 2), throughputMatD2DModdedSta(:, 3), '--v', 'LineWidth', 2);

xlabel('number of VoIP users per type [#]');
xticks(N);
% xticklabels(N);
set(gca,'FontSize', 26);
legend({'TU + no reuse', 'TU + random reuse', 'TU + Stackelberg reuse', 'TU + Stackelberg reuse w/ p_i', 'novel scheduler'}, 'Location', 'southwest', 'FontSize', 18);

hold off;