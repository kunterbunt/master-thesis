reps = 20;
nMax = 15;
nMin = 5;
filenamesRR = {};
filenamesPF = {};
filenamesTU = {};
filenamesRRDelay = {};
filenamesPFDelay = {};
filenamesTUDelay = {};
j = 1;
for n=nMin:nMax    
    for rep=0:(reps - 1)        
        filenamesRR(j, (rep+1)) = {strcat('../../results/RR-D2D/', 'n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
        filenamesPF(j, (rep+1)) = {strcat('../../results/PF-D2D/', 'n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
        filenamesTU(j, (rep+1)) = {strcat('../../results/TUGame-D2D/', 'n', int2str(n), '_rep', int2str(rep), '.sca.voip')};           
        
        filenamesRRDelay(j, (rep+1)) = {strcat('../../results/RR-D2D/', 'n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
        filenamesPFDelay(j, (rep+1)) = {strcat('../../results/PF-D2D/', 'n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
        filenamesTUDelay(j, (rep+1)) = {strcat('../../results/TUGame-D2D/', 'n', int2str(n), '_rep', int2str(rep), '.sca.delay')};           
    end
    j = j + 1;
end

mosMatRR = zeros(nMax - nMin + 1, 3);
mosMatPF = zeros(nMax - nMin + 1, 3);
mosMatTU = zeros(nMax - nMin + 1, 3);

delayMatRR = zeros(nMax - nMin + 1, 3);
delayMatPF = zeros(nMax - nMin + 1, 3);
delayMatTU = zeros(nMax - nMin + 1, 3);
for n=1:(nMax-nMin) + 1   
    [mosMatRR(n, 1), mosMatRR(n, 2), mosMatRR(n, 3)] = getMeanVec(filenamesRR(n,:));    
    [mosMatPF(n, 1), mosMatPF(n, 2), mosMatPF(n, 3)] = getMeanVec(filenamesPF(n,:));    
    [mosMatTU(n, 1), mosMatTU(n, 2), mosMatTU(n, 3)] = getMeanVec(filenamesTU(n,:));    
    
    [delayMatRR(n, 1), delayMatRR(n, 2), delayMatRR(n, 3)] = getMeanVec(filenamesRRDelay(n,:));    
    [delayMatPF(n, 1), delayMatPF(n, 2), delayMatPF(n, 3)] = getMeanVec(filenamesPFDelay(n,:));    
    [delayMatTU(n, 1), delayMatTU(n, 2), delayMatTU(n, 3)] = getMeanVec(filenamesTUDelay(n,:));    
end

figure;
subplot(2,1,1);
hold on;
errorbar(nMin:nMax, mosMatRR(:, 1), mosMatRR(:, 2), mosMatRR(:, 3), '--v');
errorbar(nMin:nMax, mosMatPF(:, 1), mosMatPF(:, 2), mosMatPF(:, 3), '--v');
errorbar(nMin:nMax, mosMatTU(:, 1), mosMatTU(:, 2), mosMatTU(:, 3), '--v');
ylabel('Mean Opinion Score');
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','north','Orientation','horizontal');
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
errorbar(nMin:nMax, delayMatRR(:, 1), delayMatRR(:, 2), delayMatRR(:, 3), '--^');
errorbar(nMin:nMax, delayMatPF(:, 1), delayMatPF(:, 2), delayMatPF(:, 3), '--^');
errorbar(nMin:nMax, delayMatTU(:, 1), delayMatTU(:, 2), delayMatTU(:, 3), '--^');
xlabel('number of D2D VoIP pairs [#]');
ylabel('Mean Delay [ms]');
legend({'Round Robin', 'Proportional Fair', 'Transferable Utility'}, 'Location','north','Orientation','horizontal');
set(gca,'FontSize', 26);
hold off;