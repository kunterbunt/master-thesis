reps = 30;
N = 5:5:15;
filenamesD2D = {};
filenamesCell = {};

for rep=0:(reps - 1)                                
    filenamesD2D(rep+1) = {strcat('../../results/throughput_d2d_cell/', 'rep', int2str(rep), '.sca.fulbufd2d')};   
    filenamesCell(rep+1) = {strcat('../../results/throughput_d2d_cell/', 'rep', int2str(rep), '.sca.fulbufcell')};   
end    

throughputMatD2D = zeros(1, 3);
throughputMatCell = zeros(1, 3);
 
[throughputMatD2D(n, 1), throughputMatD2D(n, 2), throughputMatD2D(n, 3)] = getMeanVec(filenamesD2D(:));    
[throughputMatCell(n, 1), throughputMatCell(n, 2), throughputMatCell(n, 3)] = getMeanVec(filenamesCell(:));    

figure;
% subplot(2,1,1);
hold on;
errorbar(1:2, [throughputMatD2D(1, 1) throughputMatCell(1, 1)], [throughputMatD2D(1, 2) throughputMatCell(1 ,2)], [throughputMatD2D(1, 3) throughputMatCell(1, 3)], '--v', 'LineWidth', 2);
ylabel('sum of received bytes [B]');
% xlabel('number of D2D VoIP pairs [#]');
% legend({'Round Robin', 'Transferable Utility'}, 'Location','north','Orientation','horizontal');
set(gca,'FontSize', 26);
hold off;