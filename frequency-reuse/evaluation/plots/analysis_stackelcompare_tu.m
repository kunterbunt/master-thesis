reps = 10;
N = 5:5:15;
filenamesD2DNoReuse = {};
filenamesCellNoReuse = {};

filenamesD2DRandReuse = {};
filenamesCellRandReuse = {};

filenamesD2DStaReuse = {};
filenamesCellStaReuse = {}

filenamesD2DModdedReuse = {};
filenamesCellModdedReuse = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesD2DNoReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_noreuse/n', int2str(n), '_rep', int2str(rep), '.sca.d2dfulbuf')};   
        filenamesCellNoReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_noreuse/n', int2str(n), '_rep', int2str(rep), '.sca.cellfulbuf')};   
        
        filenamesD2DRandReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_random/n', int2str(n), '_rep', int2str(rep), '.sca.d2dfulbuf')};   
        filenamesCellRandReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_random/n', int2str(n), '_rep', int2str(rep), '.sca.cellfulbuf')};   
        
        filenamesD2DStaReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta/n', int2str(n), '_rep', int2str(rep), '.sca.d2dfulbuf')};   
        filenamesCellStaReuse(i, rep+1) = {strcat('../../results/stackelcompare_tu_sta/n', int2str(n), '_rep', int2str(rep), '.sca.cellfulbuf')};   
        
        filenamesD2DModdedReuse(i, rep+1) = {strcat('../../results/stackelcompare_modded_sta/n', int2str(n), '_rep', int2str(rep), '.sca.d2dfulbuf')};   
        filenamesCellModdedReuse(i, rep+1) = {strcat('../../results/stackelcompare_modded_sta/n', int2str(n), '_rep', int2str(rep), '.sca.cellfulbuf')};   
    end    
end

throughputMatD2DNoReuse = zeros(size(N, 2), 3);
throughputMatCellNoReuse = zeros(size(N, 2), 3);

throughputMatD2DRandReuse = zeros(size(N, 2), 3);
throughputMatCellRandReuse = zeros(size(N, 2), 3);

throughputMatD2DStaReuse = zeros(size(N, 2), 3);
throughputMatCellStaReuse = zeros(size(N, 2), 3);

throughputMatD2DModdedReuse = zeros(size(N, 2), 3);
throughputMatCellModdedReuse = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [throughputMatD2DNoReuse(i, 1), throughputMatD2DNoReuse(i, 2), throughputMatD2DNoReuse(i, 3)] = getMeanVec(filenamesD2DNoReuse(i,:));    
    [throughputMatCellNoReuse(i, 1), throughputMatCellNoReuse(i, 2), throughputMatCellNoReuse(i, 3)] = getMeanVec(filenamesCellNoReuse(i,:));    
    
    [throughputMatD2DRandReuse(i, 1), throughputMatD2DRandReuse(i, 2), throughputMatD2DRandReuse(i, 3)] = getMeanVec(filenamesD2DRandReuse(i,:));    
    [throughputMatCellRandReuse(i, 1), throughputMatCellRandReuse(i, 2), throughputMatCellRandReuse(i, 3)] = getMeanVec(filenamesCellRandReuse(i,:));    
    
    [throughputMatD2DStaReuse(i, 1), throughputMatD2DStaReuse(i, 2), throughputMatD2DStaReuse(i, 3)] = getMeanVec(filenamesD2DStaReuse(i,:));    
    [throughputMatCellStaReuse(i, 1), throughputMatCellStaReuse(i, 2), throughputMatCellStaReuse(i, 3)] = getMeanVec(filenamesCellStaReuse(i,:));    
    
%     [throughputMatD2DModdedReuse(i, 1), throughputMatD2DModdedReuse(i, 2), throughputMatD2DModdedReuse(i, 3)] = getMeanVec(filenamesD2DModdedReuse(i,:));    
%     [throughputMatCellModdedReuse(i, 1), throughputMatCellModdedReuse(i, 2), throughputMatCellModdedReuse(i, 3)] = getMeanVec(filenamesCellModdedReuse(i,:));    
end

figure;
% subplot(2,1,1);
hold on;
errorbar(N, throughputMatCellNoReuse(:, 1), throughputMatCellNoReuse(:, 2), throughputMatCellNoReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DNoReuse(:, 1), throughputMatD2DNoReuse(:, 2), throughputMatD2DNoReuse(:, 3), '--v', 'LineWidth', 2);

errorbar(N, throughputMatCellRandReuse(:, 1), throughputMatCellRandReuse(:, 2), throughputMatCellRandReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatD2DRandReuse(:, 1), throughputMatD2DRandReuse(:, 2), throughputMatD2DRandReuse(:, 3), '--v', 'LineWidth', 2);

errorbar(N, throughputMatD2DStaReuse(:, 1), throughputMatD2DStaReuse(:, 2), throughputMatD2DStaReuse(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatCellStaReuse(:, 1), throughputMatCellStaReuse(:, 2), throughputMatCellStaReuse(:, 3), '--v', 'LineWidth', 2);

% errorbar(N, throughputMatD2DModdedReuse(:, 1), throughputMatD2DModdedReuse(:, 2), throughputMatD2DModdedReuse(:, 3), '--v', 'LineWidth', 2);
% errorbar(N, throughputMatCellModdedReuse(:, 1), throughputMatCellModdedReuse(:, 2), throughputMatCellModdedReuse(:, 3), '--v', 'LineWidth', 2);

ylabel('sum of received bytes [B]');
xlabel('number of full buffer pairs per type [#]');
xticklabels(N);
legend({'TU+NoReuse [cellular]', 'TU+NoReuse [D2D]', 'TU+RandReuse [Cellular]', 'TU+RandReuse [D2D]', 'TU+StaReuse [Cellular]', 'TU+StaReuse [D2D]', 'ModdedSta [Cellular]', 'ModdedSta [D2D]'}, 'Location','northeast');
set(gca,'FontSize', 26);
hold off;