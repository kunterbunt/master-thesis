% Parse simulation results.
reps = 20;
nVec = 2:6;
filenames = {};

for i=1:size(nVec,2)
    d = nVec(i);
    for rep=0:(reps - 1)                                
        filenames(i, rep+1) = {strcat('../../results/testInCellInterferenceAdditionUrbanMacro/n', num2str(d), '-rep', int2str(rep), '.sca.int')};                           
    end    
end

interferenceMat = zeros(size(nVec, 2), 3);
 
for i=1:size(nVec, 2)
    [interferenceMat(i, 1), interferenceMat(i, 2), interferenceMat(i, 3)] = getMeanVec(filenames(i,:));        
end

% Plot. 
figure;
hold on;

% yyaxis left;
ylabel('in-cell interference [dB]');
errorbar(nVec - 1, interferenceMat(:, 1), interferenceMat(:, 2), interferenceMat(:, 3), '--v', 'LineWidth', 2);
xticks(nVec - 1);

% yyaxis right;
% plot(dVec - location, sinrVec);

xlabel('number of interfering transmitters [#]');
%legend({'analytical (FSPL)', 'FSPL', 'FSPL + shadowing + fading', 'urban macrocell + shadowing + fading'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;