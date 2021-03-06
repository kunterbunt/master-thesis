reps = 30;
N = 8:4:20;
filenamesRR = {};
filenamesPF = {};
filenamesTU = {};

filenamesRR_delay = {};
filenamesPF_delay = {};
filenamesTU_delay = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesRR(i, rep+1) = {strcat('../../results/D2D-VOIP-RR/n', int2str(n), '_rep', int2str(rep), '.sca.voip')};   
        filenamesPF(i, rep+1) = {strcat('../../results/D2D-VOIP-PF/n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
        filenamesTU(i, rep+1) = {strcat('../../results/D2D-VOIP-TU/n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
        
        filenamesRR_delay(i, rep+1) = {strcat('../../results/D2D-VOIP-RR/n', int2str(n), '_rep', int2str(rep), '.sca.delay')};   
        filenamesPF_delay(i, rep+1) = {strcat('../../results/D2D-VOIP-PF/n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
        filenamesTU_delay(i, rep+1) = {strcat('../../results/D2D-VOIP-TU/n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
    end    
end

mosMatRR = zeros(size(N, 2), 3);
mosMatPF = zeros(size(N, 2), 3);
mosMatTU = zeros(size(N, 2), 3);

delayMatRR = zeros(size(N, 2), 3);
delayMatPF = zeros(size(N, 2), 3);
delayMatTU = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [mosMatRR(i, 1), mosMatRR(i, 2), mosMatRR(i, 3)] = getMeanVec(filenamesRR(i,:));    
    [mosMatPF(i, 1), mosMatPF(i, 2), mosMatPF(i, 3)] = getMeanVec(filenamesPF(i,:));        
    [mosMatTU(i, 1), mosMatTU(i, 2), mosMatTU(i, 3)] = getMeanVec(filenamesTU(i,:));    
    
    [delayMatRR(i, 1), delayMatRR(i, 2), delayMatRR(i, 3)] = getMeanVec(filenamesRR_delay(i,:));    
    [delayMatPF(i, 1), delayMatPF(i, 2), delayMatPF(i, 3)] = getMeanVec(filenamesPF_delay(i,:));        
    [delayMatTU(i, 1), delayMatTU(i, 2), delayMatTU(i, 3)] = getMeanVec(filenamesTU_delay(i,:));    
end

figure;
subplot(2,1,1);
hold on;
errorbar(N, mosMatRR(:, 1), mosMatRR(:, 2), mosMatRR(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatPF(:, 1), mosMatPF(:, 2), mosMatPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatTU(:, 1), mosMatTU(:, 2), mosMatTU(:, 3), '--v', 'LineWidth', 2);

ylabel('Mean Opinion Score');
% xlabel('number of D2D VoIP pairs [#]');
xticks(N);
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','northeast');
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
errorbar(N, delayMatRR(:, 1), delayMatRR(:, 2), delayMatRR(:, 3), '--v', 'LineWidth', 2);
errorbar(N, delayMatPF(:, 1), delayMatPF(:, 2), delayMatPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, delayMatTU(:, 1), delayMatTU(:, 2), delayMatTU(:, 3), '--v', 'LineWidth', 2);

ylabel({'Mean', 'Packet Delay [s]'});
xlabel('number of D2D VoIP pairs [#]');
xticks(N);
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','northeast');
set(gca,'FontSize', 26);
hold off;