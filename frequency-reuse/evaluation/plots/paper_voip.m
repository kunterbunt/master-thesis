set(0,'defaulttextinterpreter','latex');

reps = 30;
N = 8:4:20;
filenamesPF = {};
filenamesRR = {};
filenamesSta = {};
filenamesRRDelay = {};
filenamesPFDelay = {};
filenamesSTADelay = {};

for i=1:size(N,2)
    n = N(i);
    for rep=0:(reps - 1)                                
        filenamesRR(i, rep+1) = {strcat('../../results/paper_voip_rr/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};                     
        filenamesPF(i, rep+1) = {strcat('../../results/paper_voip_pf/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};                           
        filenamesSta(i, rep+1) = {strcat('../../results/paper_voip_sta/n', int2str(n), '_rep', int2str(rep), '.sca.d2d')};           
        
        filenamesRRDelay(i, (rep+1)) = {strcat('../../results/paper_voip_rr/', 'n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
        filenamesPFDelay(i, (rep+1)) = {strcat('../../results/paper_voip_pf/', 'n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
        filenamesSTADelay(i, (rep+1)) = {strcat('../../results/paper_voip_sta/', 'n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
    end    
end

mosMatD2DPF = zeros(size(N, 2), 3);
mosMatD2DRR = zeros(size(N, 2), 3);
mosMatD2DSta = zeros(size(N, 2), 3);

delayMatRR = zeros(size(N, 2), 3);
delayMatPF = zeros(size(N, 2), 3);
delayMatSTA = zeros(size(N, 2), 3);
 
for i=1:size(N, 2)
    [mosMatD2DPF(i, 1), mosMatD2DPF(i, 2), mosMatD2DPF(i, 3)] = getMeanVec(filenamesPF(i,:));    
    [mosMatD2DRR(i, 1), mosMatD2DRR(i, 2), mosMatD2DRR(i, 3)] = getMeanVec(filenamesRR(i,:));            
    [mosMatD2DSta(i, 1), mosMatD2DSta(i, 2), mosMatD2DSta(i, 3)] = getMeanVec(filenamesSta(i,:));        

    [delayMatRR(i, 1), delayMatRR(i, 2), delayMatRR(i, 3)] = getMeanVec(filenamesRRDelay(i,:));    
    [delayMatPF(i, 1), delayMatPF(i, 2), delayMatPF(i, 3)] = getMeanVec(filenamesPFDelay(i,:));    
    [delayMatSTA(i, 1), delayMatSTA(i, 2), delayMatSTA(i, 3)] = getMeanVec(filenamesSTADelay(i,:));    
end

h = figure;
hold on;
errorbar(N, mosMatD2DRR(:, 1), mosMatD2DRR(:, 2), mosMatD2DRR(:, 3), '--o');
errorbar(N, mosMatD2DPF(:, 1), mosMatD2DPF(:, 2), mosMatD2DPF(:, 3), '--*');
errorbar(N, mosMatD2DSta(:, 1), mosMatD2DSta(:, 2), mosMatD2DSta(:, 3), '--^');
ylabel({'average', 'Mean Opinion Score'});
xlabel('number of D2D VoIP pairs n');
xticks(N);
legend({'Round Robin', 'Proportional Fair', 'Proposed scheduler'}, 'Location', 'southwest', 'Interpreter','latex');
legend('boxoff')
set(gca,'FontSize', 10);
h.PaperUnits = 'inches';
h.PaperSize = [3.45 2];
h.PaperPosition = [0 0 3.45 2];
hold off;

h = figure;
hold on;
errorbar(N, delayMatRR(:, 1), delayMatRR(:, 2), delayMatRR(:, 3), '--o');
errorbar(N, delayMatPF(:, 1), delayMatPF(:, 2), delayMatPF(:, 3), '--*');
errorbar(N, delayMatSTA(:, 1), delayMatSTA(:, 2), delayMatSTA(:, 3), '--^');
ylabel({'average', 'packet delay [s]'});
xlabel('number of D2D VoIP pairs n');
xticks(N);
legend({'Round Robin', 'Proportional Fair', 'Proposed scheduler'}, 'Location', 'northwest', 'Interpreter','latex');
legend('boxoff')
set(gca,'FontSize', 10);
h.PaperUnits = 'inches';
h.PaperSize = [3.45 2];
h.PaperPosition = [0 0 3.45 2];
hold off;