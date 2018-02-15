reps = 10;
N = 6:2:12;
filenamesRR = {};
filenamesPF = {};
filenamesTU = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesRR(i, rep+1) = {strcat('../../results/D2D-VOIP-RR/n', int2str(n), '_rep', int2str(rep), '.sca.voip')};   
        filenamesPF(i, rep+1) = {strcat('../../results/D2D-VOIP-PF/n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
        filenamesTU(i, rep+1) = {strcat('../../results/D2D-VOIP-TU/n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
    end    
end

mosMatRR = zeros(size(N, 2), 3);
mosMatPF = zeros(size(N, 2), 3);
mosMatTU = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [mosMatRR(i, 1), mosMatRR(i, 2), mosMatRR(i, 3)] = getMeanVec(filenamesRR(i,:));    
    [mosMatPF(i, 1), mosMatPF(i, 2), mosMatPF(i, 3)] = getMeanVec(filenamesPF(i,:));        
    [mosMatTU(i, 1), mosMatTU(i, 2), mosMatTU(i, 3)] = getMeanVec(filenamesTU(i,:));        
end

figure;
% subplot(2,1,1);
hold on;
errorbar(N, mosMatPF(:, 1), mosMatPF(:, 2), mosMatPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatRR(:, 1), mosMatRR(:, 2), mosMatRR(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatTU(:, 1), mosMatTU(:, 2), mosMatTU(:, 3), '--v', 'LineWidth', 2);

ylabel('Mean Opinion Score');
xlabel('number of D2D VoIP pairs [#]');
xticklabels(N);
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','northeast');
set(gca,'FontSize', 26);
hold off;