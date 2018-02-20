reps = 15;
N = 4:2:10;
filenamesRR = {};
filenamesPF = {};
filenamesTU = {};

filenamesRR_fulbuf = {};
filenamesPF_fulbuf = {};
filenamesTU_fulbuf = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesRR(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-RR/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};   
        filenamesPF(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-PF/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};           
        filenamesTU(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-TU/n', int2str(n), '_rep', int2str(rep), '.sca.vid')};           
        
        filenamesRR_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-RR/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
        filenamesPF_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-PF/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};           
        filenamesTU_fulbuf(i, rep+1) = {strcat('../../results/TU-VID-VS-FULBUF-TU/n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};           
    end    
end

vidVecRR = zeros(size(N, 2), 1);
vidVecPF = zeros(size(N, 2), 1);
vidVecTU = zeros(size(N, 2), 1);

fulbufVecRR = zeros(size(N, 2), 1);
fulbufVecPF = zeros(size(N, 2), 1);
fulbufVecTU = zeros(size(N, 2), 1);
 
for i=1:size(N, 2)
    vidVecRR(i) = getFairnessVec(filenamesRR(i,:));    
    vidVecPF(i) = getFairnessVec(filenamesPF(i,:));        
    vidVecTU(i) = getFairnessVec(filenamesTU(i,:));       
    
    fulbufVecRR(i) = getFairnessVec(filenamesRR_fulbuf(i,:));    
    fulbufVecPF(i) = getFairnessVec(filenamesPF_fulbuf(i,:));        
    fulbufVecTU(i) = getFairnessVec(filenamesTU_fulbuf(i,:));       
end

figure;
subplot(2, 1, 1);
hold on;
title('3 video streamers performance');
ylabel({'throughput sum';'3 video streamers'});
plot(N, vidVecPF(:), '--v', 'LineWidth', 2);
plot(N, vidVecRR(:), '--v', 'LineWidth', 2);
plot(N, vidVecTU(:), '--v', 'LineWidth', 2);
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','northeast');
xticklabels({'4', '', '6', '', '8', '', '10'});
set(gca,'FontSize', 26);

subplot(2, 1, 2);
hold on;
title('n full buffer users performance');
ylabel({'throughput sum';'n full buffer users'});
xlabel('number of D2D full-buffer pairs n [#]');
plot(N, fulbufVecRR(:), '--v', 'LineWidth', 2);
plot(N, fulbufVecPF(:), '--v', 'LineWidth', 2);
plot(N, fulbufVecTU(:), '--v', 'LineWidth', 2);
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','northeast');
xticklabels({'4', '', '6', '', '8', '', '10'});
set(gca,'FontSize', 26);
hold off;