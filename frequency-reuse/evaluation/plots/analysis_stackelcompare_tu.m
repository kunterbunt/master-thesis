reps = 4;
N = 10:10:30;
filenamesD2DNoReuse = {};
filenamesCellNoReuse = {};

filenamesD2DRandReuse = {};
filenamesCellRandReuse = {};

filenamesD2DStaReuse = {};
filenamesCellStaReuse = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesD2DNoReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_noreuse/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellNoReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_noreuse/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DRandReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_random/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellRandReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_random/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
        
        filenamesD2DStaReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCellStaReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta/n', int2str(n), '_rep', int2str(rep), '.sca.cell')};   
    end    
end

throughputMatD2DNoReuse = zeros(size(N, 2), 3);
throughputMatCellNoReuse = zeros(size(N, 2), 3);

throughputMatD2DRandReuse = zeros(size(N, 2), 3);
throughputMatCellRandReuse = zeros(size(N, 2), 3);

throughputMatD2DStaReuse = zeros(size(N, 2), 3);
throughputMatCellStaReuse = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [throughputMatD2DNoReuse(i, 1), throughputMatD2DNoReuse(i, 2), throughputMatD2DNoReuse(i, 3)] = getMeanVec(filenamesD2DNoReuse(i,:));    
    [throughputMatCellNoReuse(i, 1), throughputMatCellNoReuse(i, 2), throughputMatCellNoReuse(i, 3)] = getMeanVec(filenamesCellNoReuse(i,:));    
    
    [throughputMatD2DRandReuse(i, 1), throughputMatD2DRandReuse(i, 2), throughputMatD2DRandReuse(i, 3)] = getMeanVec(filenamesD2DRandReuse(i,:));    
    [throughputMatCellRandReuse(i, 1), throughputMatCellRandReuse(i, 2), throughputMatCellRandReuse(i, 3)] = getMeanVec(filenamesCellRandReuse(i,:));    
    
    [throughputMatD2DStaReuse(i, 1), throughputMatD2DStaReuse(i, 2), throughputMatD2DStaReuse(i, 3)] = getMeanVec(filenamesD2DStaReuse(i,:));    
    [throughputMatCellStaReuse(i, 1), throughputMatCellStaReuse(i, 2), throughputMatCellStaReuse(i, 3)] = getMeanVec(filenamesCellStaReuse(i,:));    
end

figure;
subplot(2,1,1);
hold on;
ylabel('sum of received bytes [B]');
title('Cellular users');
errorbar(N, throughputMatCellNoReuse(:, 1), throughputMatCellNoReuse(:, 2), throughputMatCellNoReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellRandReuse(:, 1), throughputMatCellRandReuse(:, 2), throughputMatCellRandReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellStaReuse(:, 1), throughputMatCellStaReuse(:, 2), throughputMatCellStaReuse(:, 3), '--v', 'LineWidth', 2);
legend({'no reuse', 'random reuse', 'Stackelberg reuse'});
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
ylabel('sum of received bytes [B]');
title('D2D users');
errorbar(N, throughputMatD2DNoReuse(:, 1), throughputMatD2DNoReuse(:, 2), throughputMatD2DNoReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DRandReuse(:, 1), throughputMatD2DRandReuse(:, 2), throughputMatD2DRandReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DStaReuse(:, 1), throughputMatD2DStaReuse(:, 2), throughputMatD2DStaReuse(:, 3), '--v', 'LineWidth', 2);

xlabel('number of full buffer pairs per type [#]');
% xticklabels(N);
legend({'no reuse', 'random reuse', 'Stackelberg reuse'});
set(gca,'FontSize', 26);
hold off;