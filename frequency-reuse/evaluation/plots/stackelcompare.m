reps = 20;
nMin = 6;
nMax = 10;
filenamesD2D_noreuse = {};
filenamesCell_noreuse = {};

filenamesD2D_sta = {};
filenamesCell_sta = {};

filenamesD2D_random = {};
filenamesCell_random = {};

j = 0;
for n=nMin:2:nMax
    j = j + 1;
    for rep=0:(reps - 1)
        filenamesD2D_noreuse(j, (rep+1)) = {strcat('../../results/stackelcompare_rr_noreuse/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
        filenamesCell_noreuse(j, (rep+1)) = {strcat('../../results/stackelcompare_rr_noreuse/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbufCell')};   
        
        filenamesD2D_random(j, (rep+1)) = {strcat('../../results/stackelcompare_rr_random/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
        filenamesCell_random(j, (rep+1)) = {strcat('../../results/stackelcompare_rr_random/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbufCell')};   
        
        filenamesD2D_sta(j, (rep+1)) = {strcat('../../results/stackelcompare_rr_sta/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
        filenamesCell_sta(j, (rep+1)) = {strcat('../../results/stackelcompare_rr_sta/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbufCell')};   
    end
end

sumBytesMatD2D_noreuse = zeros(3, 3);
sumBytesMatCell_noreuse = zeros(3, 3);

sumBytesMatD2D_random = zeros(3, 3);
sumBytesMatCell_random = zeros(3, 3);

sumBytesMatD2D_sta = zeros(3, 3);
sumBytesMatCell_sta = zeros(3, 3);

for n=1:size(filenamesD2D_noreuse, 1)    
    [sumBytesMatD2D_noreuse(n, 1), sumBytesMatD2D_noreuse(n, 2), sumBytesMatD2D_noreuse(n, 3)] = getSumBytesVec(filenamesD2D_noreuse(n,:));
    [sumBytesMatCell_noreuse(n, 1), sumBytesMatCell_noreuse(n, 2), sumBytesMatCell_noreuse(n, 3)] = getSumBytesVec(filenamesCell_noreuse(n,:));
    
    [sumBytesMatD2D_random(n, 1), sumBytesMatD2D_random(n, 2), sumBytesMatD2D_random(n, 3)] = getSumBytesVec(filenamesD2D_random(n,:));
    [sumBytesMatCell_random(n, 1), sumBytesMatCell_random(n, 2), sumBytesMatCell_random(n, 3)] = getSumBytesVec(filenamesCell_random(n,:));
    
    [sumBytesMatD2D_sta(n, 1), sumBytesMatD2D_sta(n, 2), sumBytesMatD2D_sta(n, 3)] = getSumBytesVec(filenamesD2D_sta(n,:));
    [sumBytesMatCell_sta(n, 1), sumBytesMatCell_sta(n, 2), sumBytesMatCell_sta(n, 3)] = getSumBytesVec(filenamesCell_sta(n,:));
end

figure;
hold on;
errorbar(nMin:2:nMax, sumBytesMatD2D_noreuse(:, 1), sumBytesMatD2D_noreuse(:, 2), sumBytesMatD2D_noreuse(:, 3), '--', 'Color', 'blue', 'LineWidth', 2);
errorbar(nMin:2:nMax, sumBytesMatCell_noreuse(:, 1), sumBytesMatCell_noreuse(:, 2), sumBytesMatCell_noreuse(:, 3), '-', 'Color', 'blue', 'LineWidth', 2);

errorbar(nMin:2:nMax, sumBytesMatD2D_random(:, 1), sumBytesMatD2D_random(:, 2), sumBytesMatD2D_random(:, 3), '--', 'Color', 'red', 'LineWidth', 2);
errorbar(nMin:2:nMax, sumBytesMatCell_random(:, 1), sumBytesMatCell_random(:, 2), sumBytesMatCell_random(:, 3), '-', 'Color', 'red', 'LineWidth', 2);

errorbar(nMin:2:nMax, sumBytesMatD2D_sta(:, 1), sumBytesMatD2D_sta(:, 2), sumBytesMatD2D_sta(:, 3), '--', 'Color', 'green', 'LineWidth', 2);
errorbar(nMin:2:nMax, sumBytesMatCell_sta(:, 1), sumBytesMatCell_sta(:, 2), sumBytesMatCell_sta(:, 3), '-', 'Color', 'green', 'LineWidth', 2);

ylabel('Sum of received bytes [B]');
xlabel('number of full buffer pairs per type (cellular, D2D) [#]');
legend('D2D - no reuse', 'Cellular - no reuse', 'D2D - random reuse', 'Cellular - random reuse', 'D2D - Stackelberg reuse', 'Cellular - Stackelberg reuse')
xticks([6 8 10]);
set(gca,'FontSize', 26)
