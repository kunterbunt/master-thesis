reps = 20;
dVec = 325:20:465;
filenames = {};
filenamesFirst = {};

for i=1:size(dVec,2)
    d = dVec(i);
    for rep=0:(reps - 1)                                
        filenames(i, rep+1) = {strcat('../../results/cluster-interference/d', num2str(d), '-rep', int2str(rep), '.sca.parsed')};           
        filenamesFirst(i, rep+1) = {strcat('../../results/cluster-interference/d', num2str(d), '-rep', int2str(rep), '.sca.parsed.first')};           
    end    
end

throughputMatSingle = zeros(size(dVec, 2), 3);
throughputMatCluster = zeros(size(dVec, 2), 3);
 
for i=1:size(dVec, 2)
    [throughputMatSingle(i, 1), throughputMatSingle(i, 2), throughputMatSingle(i, 3)] = getMeanVec(filenamesFirst(i,:));
    [throughputMatCluster(i, 1), throughputMatCluster(i, 2), throughputMatCluster(i, 3)] = getMeanVec(filenames(i,:));
end

figure;
hold on;
ylabel('sum throughput [Bytes]');
errorbar(dVec - dVec(1), throughputMatSingle(:, 1), throughputMatSingle(:, 2), throughputMatSingle(:, 3), '--v', 'LineWidth', 2);
errorbar(dVec - dVec(1), throughputMatCluster(:, 1), throughputMatCluster(:, 2), throughputMatCluster(:, 3), '--o', 'LineWidth', 2);
xlabel('distance from cluster [m]');
legend({'Rx_0', 'Rx_{i>0}', 'Interpreter', 'latex'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;