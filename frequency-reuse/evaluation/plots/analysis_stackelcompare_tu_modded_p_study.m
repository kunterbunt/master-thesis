reps = 5;
n = 10;
pVec = 0:0.1:1;
filenamesD2D = {};
filenamesCell = {};
filenamesTraditionalGames = {};
filenamesReverseGames = {};
filenamesD2DGames = {};

for i=1:size(pVec,2)
    p = pVec(i);
    for rep=0:(reps - 1)                                
        filenamesD2D(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.d2d')};   
        filenamesCell(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.cell')};   
        filenamesTraditionalGames(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.traditgames')};   
        filenamesReverseGames(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.reversegames')};   
        filenamesD2DGames(i, rep+1) = {strcat('../../results/stackelcompare_tu_modded_p_study/n', int2str(n), '_p', num2str(p), '_rep', int2str(rep), '.sca.d2dgames')};   
    end    
end

throughputMatD2D = zeros(size(pVec, 2), 3);
throughputMatCell = zeros(size(pVec, 2), 3);
throughputMatCombined = zeros(size(pVec, 2), 3);
numTraditionalGamesMat = zeros(size(pVec, 2), 3);
numReverseGamesMat = zeros(size(pVec, 2), 3);
numD2DGamesMat = zeros(size(pVec, 2), 3);
 
for i=1:size(pVec, 2)
    [throughputMatD2D(i, 1), throughputMatD2D(i, 2), throughputMatD2D(i, 3)] = getMeanVec(filenamesD2D(i,:));    
    [throughputMatCell(i, 1), throughputMatCell(i, 2), throughputMatCell(i, 3)] = getMeanVec(filenamesCell(i,:));        
    [throughputMatCombined(i, 1), throughputMatCombined(i, 2), throughputMatCombined(i, 3)] = getMeanVec([filenamesCell(i,:) filenamesD2D(i,:)]);         
    [numTraditionalGamesMat(i, 1), numTraditionalGamesMat(i, 2), numTraditionalGamesMat(i, 3)] = getMeanVec(filenamesTraditionalGames(i,:));         
    [numReverseGamesMat(i, 1), numReverseGamesMat(i, 2), numReverseGamesMat(i, 3)] = getMeanVec(filenamesReverseGames(i,:));         
    [numD2DGamesMat(i, 1), numD2DGamesMat(i, 2), numD2DGamesMat(i, 3)] = getMeanVec(filenamesD2DGames(i,:));         
end

figure;
hold on;
ylabel({'Overall';'Mean Opinion Score'});
errorbar(pVec, throughputMatCell(:, 1), throughputMatCell(:, 2), throughputMatCell(:, 3), '--v', 'LineWidth', 2);
errorbar(pVec, throughputMatD2D(:, 1), throughputMatD2D(:, 2), throughputMatD2D(:, 3), '--v', 'LineWidth', 2);
% errorbar(pVec, throughputMatCombined(:, 1), throughputMatCombined(:, 2), throughputMatCombined(:, 3), ':', 'LineWidth', 2);
plot(pVec, throughputMatCombined(:, 1), ':', 'LineWidth', 2, 'Color', 'black');
xticks(pVec);
xlabel('p');
legend({'Cellular VoIP users', 'D2D VoIP users', 'both'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;

figure;
hold on;
errorbar(pVec, numTraditionalGamesMat(:, 1), numTraditionalGamesMat(:, 2), numTraditionalGamesMat(:, 3), '--v', 'LineWidth', 2);
errorbar(pVec, numReverseGamesMat(:, 1), numReverseGamesMat(:, 2), numReverseGamesMat(:, 3), '--v', 'LineWidth', 2);
errorbar(pVec, numD2DGamesMat(:, 1), numD2DGamesMat(:, 2), numD2DGamesMat(:, 3), '--v', 'LineWidth', 2);
xticks(pVec);
xlabel('p');
ylabel('Count [#]');
legend({'traditional games', 'reverse games', 'D2D games'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;