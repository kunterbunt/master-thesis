reps = 20;
dVec = 420:20:500;
filenames = {};

for i=1:size(dVec,2)
    d = dVec(i);
    for rep=0:(reps - 1)                                
        filenames(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
    end    
end

interferenceMat = zeros(size(dVec, 2), 3);
 
for i=1:size(dVec, 2)
    [interferenceMat(i, 1), interferenceMat(i, 2), interferenceMat(i, 3)] = getMeanVec(filenames(i,:));    
end

figure;
hold on;
ylabel('in-cell interference');
errorbar(dVec - dVec(1), interferenceMat(:, 1), interferenceMat(:, 2), interferenceMat(:, 3), '--v', 'LineWidth', 2);
xlabel('distance [m]');
% legend({'Rx_0', 'Rx_{i>0}', 'Interpreter', 'latex'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;