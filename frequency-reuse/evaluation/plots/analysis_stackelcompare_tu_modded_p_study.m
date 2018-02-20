reps = 5;
n = 10;
pVec = 0:0.1:1;
filenamesD2D = {};
filenamesCell = {};

for i=1:size(pVec,2)
    p = pVec(i);
    for rep=0:(reps - 1)                                
        filenamesD2D(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCell(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.cell')};   
    end    
end

throughputMatD2D = zeros(size(pVec, 2), 3);
throughputMatCell = zeros(size(pVec, 2), 3);
 
for i=1:size(pVec, 2)
    [throughputMatD2D(i, 1), throughputMatD2D(i, 2), throughputMatD2D(i, 3)] = getMeanVec(filenamesD2D(i,:));    
    [throughputMatCell(i, 1), throughputMatCell(i, 2), throughputMatCell(i, 3)] = getMeanVec(filenamesCell(i,:));        
end

figure;
hold on;
ylabel({'Overall';'Mean Opinion Score'});
% ylim([3 4.5]);
errorbar(pVec, throughputMatCell(:, 1), throughputMatCell(:, 2), throughputMatCell(:, 3), '--v', 'LineWidth', 2);
errorbar(pVec, throughputMatD2D(:, 1), throughputMatD2D(:, 2), throughputMatD2D(:, 3), '--v', 'LineWidth', 2);
% xticks(N);
% xticklabels(N);
legend({'Cellular VoIP users', 'D2D VoIP users'}, 'Location', 'east', 'FontSize', 26);
set(gca,'FontSize', 26);

hold off;