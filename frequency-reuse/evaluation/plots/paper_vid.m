% set(0,'defaulttextinterpreter','latex');

reps = 15;
N = 6:2:10;
filenamesRR = {};
filenamesPF = {};
filenamesTU = {};
filenamesSTA = {};

filenamesRR_fulbuf = {};
filenamesPF_fulbuf = {};
filenamesTU_fulbuf = {};
filenamesSTA_fulbuf = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesRR(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-RR/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};   
        filenamesPF(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-PF/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};           
        filenamesTU(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-TU/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};           
        filenamesSTA(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-STA/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};           
        
        filenamesRR_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-RR/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
        filenamesPF_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-PF/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};           
        filenamesTU_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-TU/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};           
        filenamesSTA_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-STA/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};           
    end    
end

vidMatRR = zeros(size(N, 2), 3);
vidMatPF = zeros(size(N, 2), 3);
vidMatTU = zeros(size(N, 2), 3);
vidMatSTA = zeros(size(N, 2), 3);

fulbufMatRR = zeros(size(N, 2), 3);
fulbufMatPF = zeros(size(N, 2), 3);
fulbufMatTU = zeros(size(N, 2), 3);
fulbufMatSTA = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [vidMatRR(i, 1), vidMatRR(i, 2), vidMatRR(i, 3)] = getMeanVec(filenamesRR(i,:));    
    [vidMatPF(i, 1), vidMatPF(i, 2), vidMatPF(i, 3)] = getMeanVec(filenamesPF(i,:));        
    [vidMatTU(i, 1), vidMatTU(i, 2), vidMatTU(i, 3)] = getMeanVec(filenamesTU(i,:));       
    [vidMatSTA(i, 1), vidMatSTA(i, 2), vidMatSTA(i, 3)] = getMeanVec(filenamesSTA(i,:));       
    
    [fulbufMatRR(i, 1), fulbufMatRR(i, 2), fulbufMatRR(i, 3)] = getMeanVec(filenamesRR_fulbuf(i,:));    
    [fulbufMatPF(i, 1), fulbufMatPF(i, 2), fulbufMatPF(i, 3)] = getMeanVec(filenamesPF_fulbuf(i,:));        
    [fulbufMatTU(i, 1), fulbufMatTU(i, 2), fulbufMatTU(i, 3)] = getMeanVec(filenamesTU_fulbuf(i,:));
    [fulbufMatSTA(i, 1), fulbufMatSTA(i, 2), fulbufMatSTA(i, 3)] = getMeanVec(filenamesSTA_fulbuf(i,:));
end

h = figure;
% subplot(2, 1, 1);
hold on;
ylabel({'throughput sum of';'three video streamers [B]'});
xlabel('number of full buffer users n');
errorbar(N, vidMatRR(:, 1), vidMatRR(:, 2), vidMatRR(:, 3), '--o');
errorbar(N, vidMatPF(:, 1), vidMatPF(:, 2), vidMatPF(:, 3), '--*');
errorbar(N, vidMatTU(:, 1), vidMatTU(:, 2), vidMatTU(:, 3), '--v');
errorbar(N, vidMatSTA(:, 1), vidMatSTA(:, 2), vidMatSTA(:, 3), '--^');
% legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','northeast');
legend({'Round Robin', 'Proportional Fair', 'Proposed (no FRR)' 'Proposed (with FRR)'}, 'Position', [0.795 0.8 0 0], 'Interpreter','latex');
legend('boxoff')
% xticklabels({'4', '', '6', '', '8', '', '10'});
xticks(N);
set(gca,'FontSize', 10);
h.PaperUnits = 'inches';
h.PaperSize = [3.45 2];
h.PaperPosition = [0 0 3.45 2];

hold off;

% subplot(2, 1, 2);
h = figure;
hold on;
ylabel({'throughput sum of';'n full buffer users [B]'});
xlabel('number of full buffer users n');
errorbar(N, fulbufMatPF(:, 1), fulbufMatPF(:, 2), fulbufMatPF(:, 3), '--o');
errorbar(N, fulbufMatRR(:, 1), fulbufMatRR(:, 2), fulbufMatRR(:, 3), '--*');
errorbar(N, fulbufMatTU(:, 1), fulbufMatTU(:, 2), fulbufMatTU(:, 3), '--v');
errorbar(N, fulbufMatSTA(:, 1), fulbufMatSTA(:, 2), fulbufMatSTA(:, 3), '--^');
legend({'Round Robin', 'Proportional Fair', 'Proposed (no FRR)', 'Proposed (with FRR)'}, 'Position', [0.795 0.8 0 0], 'Interpreter','latex');
legend('boxoff')
% xticklabels({'4', '', '6', '', '8', '', '10'});
xticks(N);
set(gca,'FontSize', 10);
h.PaperUnits = 'inches';
h.PaperSize = [3.45 2];
h.PaperPosition = [0 0 3.45 2];
hold off;