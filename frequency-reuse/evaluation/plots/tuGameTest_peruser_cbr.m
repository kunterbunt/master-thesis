repetitions = 20;

% TU CBR
% Cell
filenamesCbrCellTU = {};    
for j = 0:(repetitions-1)
    filenamesCbrCellTU(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.cbr_cell')};   
end        
[throughputMatCBRCellTU, meanThroughputVecCBRCellTU, errorVecNegCBRCellTU, errorVecPosCBRCellTU] = getThroughputVec(filenamesCbrCellTU);
% D2D
filenamesCbrD2DTU = {};    
for j = 0:(repetitions-1)
    filenamesCbrD2DTU(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.cbr_d2d')};   
end        
[throughputMatCBRD2DTU, meanThroughputVecCBRD2DTU, errorVecNegCBRD2DTU, errorVecPosCBRD2DTU] = getThroughputVec(filenamesCbrD2DTU);
numUsers = size(meanThroughputVecCBRD2DTU, 1);

% RR CBR
% Cell
filenamesCbrCellRR = {};    
for j = 0:(repetitions-1)
    filenamesCbrCellRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.cbr_cell')};   
end        
[throughputMatCBRCellRR, meanThroughputVecCBRCellRR, errorVecNegCBRCellRR, errorVecPosCBRCellRR] = getThroughputVec(filenamesCbrCellRR);
% D2D
filenamesCbrD2DRR = {};    
for j = 0:(repetitions-1)
    filenamesCbrD2DRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.cbr_d2d')};   
end        
[throughputMatCBRD2DRR, meanThroughputVecCBRD2DRR, errorVecNegCBRD2DRR, errorVecPosCBRD2DRR] = getThroughputVec(filenamesCbrD2DRR);

% PF CBR
% Cell
filenamesCbrCellPF = {};    
for j = 0:(repetitions-1)
    filenamesCbrCellPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.cbr_cell')};   
end        
[throughputMatCBRCellPF, meanThroughputVecCBRCellPF, errorVecNegCBRCellPF, errorVecPosCBRCellPF] = getThroughputVec(filenamesCbrCellPF);
% D2D
filenamesCbrD2DPF = {};    
for j = 0:(repetitions-1)
    filenamesCbrD2DPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.cbr_d2d')};   
end        
[throughputMatCBRD2DPF, meanThroughputVecCBRD2DPF, errorVecNegCBRD2DPF, errorVecPosCBRD2DPF] = getThroughputVec(filenamesCbrD2DPF);

figure
hold on

e = errorbar(1:numUsers, meanThroughputVecCBRCellTU, errorVecNegCBRCellTU, errorVecPosCBRCellTU, '-');
errorbar(1:numUsers, meanThroughputVecCBRD2DTU, errorVecNegCBRD2DTU, errorVecPosCBRD2DTU, '-');

errorbar(1:numUsers, meanThroughputVecCBRCellRR, errorVecNegCBRCellRR, errorVecPosCBRCellRR, '-.');
errorbar(1:numUsers, meanThroughputVecCBRD2DRR, errorVecNegCBRD2DRR, errorVecPosCBRD2DRR, '-.');

errorbar(1:numUsers, meanThroughputVecCBRCellPF, errorVecNegCBRCellPF, errorVecPosCBRCellPF, '--');
errorbar(1:numUsers, meanThroughputVecCBRD2DPF, errorVecNegCBRD2DPF, errorVecPosCBRD2DPF, '--');

e.LineWidth = 1;
e.Marker = 'x';
e.MarkerSize = 8;
xlabel('receiver [#]')
ylabel('#received bytes')
title('TU\_GAME, 50 pairs, 6 RBs, 60s, 20reps', 'FontSize', 20);
legend({'TU Scheduler Cell', 'TU Scheduler D2D', 'RR Scheduler Cell', 'RR Scheduler D2D', 'PF Scheduler Cell', 'PF Scheduler D2D'}, 'Location', 'west')
set(gca,'FontSize', 26)
hold off