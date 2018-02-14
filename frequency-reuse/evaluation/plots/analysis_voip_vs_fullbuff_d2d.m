reps = 10;
N = 5:5:15;
% filenamesRR_MOS = {};
% filenamesRR_FULBUF = {};
filenamesPF_MOS = {};
filenamesPF_FULBUF = {};
filenamesTU_MOS = {};
filenamesTU_FULBUF = {};

for i=1:size(N, 2)
    for rep=0:(reps - 1)                
        n = N(i);
        filenamesTU_MOS(i, (rep+1)) = {strcat('../../results/TUGAME-VoIP-D2D_only/', 'n', int2str(n), '_rep', int2str(rep), '.sca.voip')};                           
        filenamesTU_FULBUF(i, (rep+1)) = {strcat('../../results/TUGAME-VoIP-D2D_only/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
        filenamesPF_MOS(i, (rep+1)) = {strcat('../../results/TUGAME-VoIP-D2D_only-PF/', 'n', int2str(n), '_rep', int2str(rep), '.sca.voip')};   
        filenamesPF_FULBUF(i, (rep+1)) = {strcat('../../results/TUGAME-VoIP-D2D_only-PF/', 'n', int2str(n), '_rep', int2str(rep), '.sca.fulbuf')};   
    end
    j = j + 1;
end

mosMatPF = zeros(size(N, 2), 3);
mosMatTU = zeros(size(N, 2), 3);

throughputMatPF = zeros(size(N, 2), 3);
throughputMatTU = zeros(size(N, 2), 3);

for n=1:size(N, 2)        
    [mosMatPF(n, 1), mosMatPF(n, 2), mosMatPF(n, 3)] = getMeanVec(filenamesPF_MOS(n,:));    
    [mosMatTU(n, 1), mosMatTU(n, 2), mosMatTU(n, 3)] = getMeanVec(filenamesTU_MOS(n,:));    
    
    [throughputMatPF(n, 1), throughputMatPF(n, 2), throughputMatPF(n, 3)] = getMeanVec(filenamesPF_FULBUF(n,:));        
    [throughputMatTU(n, 1), throughputMatTU(n, 2), throughputMatTU(n, 3)] = getMeanVec(filenamesTU_FULBUF(n,:));    
end

figure;
subplot(2,1,1);
hold on;
errorbar(N, mosMatPF(:, 1), mosMatPF(:, 2), mosMatPF(:, 3), '--v', 'LineWidth', 2);
% errorbar(M, mosMatPF(:, 1), mosMatPF(:, 2), mosMatPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, mosMatTU(:, 1), mosMatTU(:, 2), mosMatTU(:, 3), '--v', 'LineWidth', 2);
ylabel('Mean Opinion Score');
xlabel('number of D2D VoIP pairs [#]');
legend({'Proportional Fair', 'Transferable Utility'}, 'Location','north','Orientation','horizontal');
set(gca,'FontSize', 26);

subplot(2,1,2);
hold on;
errorbar(N, throughputMatPF(:, 1), throughputMatPF(:, 2), throughputMatPF(:, 3), '--v', 'LineWidth', 2);
% errorbar(M, mosMatPF(:, 1), mosMatPF(:, 2), mosMatPF(:, 3), '--v', 'LineWidth', 2);
errorbar(N, throughputMatTU(:, 1), throughputMatTU(:, 2), throughputMatTU(:, 3), '--v', 'LineWidth', 2);

ylabel('sum of received bytes [B]');
legend({'Proportional Fair', 'Transferable Utility'}, 'Location','north','Orientation','horizontal');
set(gca,'FontSize', 26);
hold off;