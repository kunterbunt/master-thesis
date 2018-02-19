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
    end    
end

fairnessVecD2DNoReuse = zeros(size(N, 2), 1);
fairnessVecCellNoReuse = zeros(size(N, 2), 1);

fairnessVecD2DRandReuse = zeros(size(N, 2), 1);
fairnessVecCellRandReuse = zeros(size(N, 2), 1);

fairnessVecD2DStaReuse = zeros(size(N, 2), 1);
fairnessVecCellStaReuse = zeros(size(N, 2), 1);

fairnessVecD2DStaReuseTx = zeros(size(N, 2), 1);
fairnessVecCellStaReuseTx = zeros(size(N, 2), 1);
 
for i=1:size(N, 2)
    
    fairnessVecD2DNoReuse(i) = getFairnessVec(filenamesD2DNoReuse(i,:));            
    fairnessVecCellNoReuse(i) = getFairnessVec(filenamesCellNoReuse(i,:));    
    
    fairnessVecD2DRandReuse(i) = getFairnessVec(filenamesD2DRandReuse(i,:));    
    fairnessVecCellRandReuse(i) = getFairnessVec(filenamesCellRandReuse(i,:));    
    
    fairnessVecD2DStaReuse(i) = getFairnessVec(filenamesD2DStaReuse(i,:));    
    fairnessVecCellStaReuse(i) = getFairnessVec(filenamesCellStaReuse(i,:));    
    
    fairnessVecD2DStaReuseTx(i) = getFairnessVec(filenamesD2DStaReuseTx(i,:));    
    fairnessVecCellStaReuseTx(i) = getFairnessVec(filenamesCellStaReuseTx(i,:));    
end

figure;
subplot(2,1,1);
hold on;
ylabel('Jain Fairness Index');
% ylim([3 4.5]);
title('Cellular users');
plot(N, fairnessVecCellNoReuse, '--v', 'LineWidth', 2);
plot(N, fairnessVecCellRandReuse, '--v', 'LineWidth', 2);
plot(N, fairnessVecCellStaReuse, '--v', 'LineWidth', 2);
plot(N, fairnessVecCellStaReuseTx, '--v', 'LineWidth', 2);
xticks(N);
% xticklabels(N);
legend({'TU + no reuse', 'TU + random reuse', 'TU + Stackelberg reuse', 'TU + Stackelberg reuse w/ p_i'}, 'Location', 'southwest', 'FontSize', 18);
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
ylabel('Jain Fairness Index');
% ylim([3 4.5]);
title('D2D users');
plot(N, fairnessVecD2DNoReuse, '--v', 'LineWidth', 2);
plot(N, fairnessVecD2DRandReuse, '--v', 'LineWidth', 2);
plot(N, fairnessVecD2DStaReuse, '--v', 'LineWidth', 2);
plot(N, fairnessVecD2DStaReuseTx(:, 1), '--v', 'LineWidth', 2);

xlabel('number of VoIP users per type [#]');
xticks(N);
% xticklabels(N);
set(gca,'FontSize', 26);
legend({'TU + no reuse', 'TU + random reuse', 'TU + Stackelberg reuse', 'TU + Stackelberg reuse w/ p_i'}, 'Location', 'southwest', 'FontSize', 18);

hold off;