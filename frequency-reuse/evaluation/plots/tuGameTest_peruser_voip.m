repetitions = 20;

% TU CBR
% Cell
filenamesVoipCellTU = {};    
for j = 0:(repetitions-1)
    filenamesVoipCellTU(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.voip_cell')};   
end        
[throughputMatVoipCellTU, meanThroughputVecVoipCellTU, errorVecNegVoipCellTU, errorVecPosVoipCellTU] = getThroughputVec(filenamesVoipCellTU);
% D2D
filenamesVoipD2DTU = {};    
for j = 0:(repetitions-1)
    filenamesVoipD2DTU(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.voip_d2d')};   
end        
[throughputMatVoipD2DTU, meanThroughputVecVoipD2DTU, errorVecNegVoipD2DTU, errorVecPosVoipD2DTU] = getThroughputVec(filenamesVoipD2DTU);
numUsers = size(meanThroughputVecVoipD2DTU, 1);

% RR CBR
% Cell
filenamesVoipCellRR = {};    
for j = 0:(repetitions-1)
    filenamesVoipCellRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.voip_cell')};   
end        
[throughputMatVoipCellRR, meanThroughputVecVoipCellRR, errorVecNegVoipCellRR, errorVecPosVoipCellRR] = getThroughputVec(filenamesVoipCellRR);
% D2D
filenamesVoipD2DRR = {};    
for j = 0:(repetitions-1)
    filenamesVoipD2DRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.voip_d2d')};   
end        
[throughputMatVoipD2DRR, meanThroughputVecVoipD2DRR, errorVecNegVoipD2DRR, errorVecPosVoipD2DRR] = getThroughputVec(filenamesVoipD2DRR);

% PF CBR
% Cell
filenamesVoipCellPF = {};    
for j = 0:(repetitions-1)
    filenamesVoipCellPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.voip_cell')};   
end        
[throughputMatVoipCellPF, meanThroughputVecVoipCellPF, errorVecNegVoipCellPF, errorVecPosVoipCellPF] = getThroughputVec(filenamesVoipCellPF);
% D2D
filenamesVoipD2DPF = {};    
for j = 0:(repetitions-1)
    filenamesVoipD2DPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.voip_d2d')};   
end        
[throughputMatVoipD2DPF, meanThroughputVecVoipD2DPF, errorVecNegVoipD2DPF, errorVecPosVoipD2DPF] = getThroughputVec(filenamesVoipD2DPF);

figure
hold on

e = errorbar(1:numUsers, meanThroughputVecVoipCellTU, errorVecNegVoipCellTU, errorVecPosVoipCellTU, '-');
errorbar(1:numUsers, meanThroughputVecVoipD2DTU, errorVecNegVoipD2DTU, errorVecPosVoipD2DTU, '-');

errorbar(1:numUsers, meanThroughputVecVoipCellRR, errorVecNegVoipCellRR, errorVecPosVoipCellRR, '-.');
errorbar(1:numUsers, meanThroughputVecVoipD2DRR, errorVecNegVoipD2DRR, errorVecPosVoipD2DRR, '-.');

errorbar(1:numUsers, meanThroughputVecVoipCellPF, errorVecNegVoipCellPF, errorVecPosVoipCellPF, '--');
errorbar(1:numUsers, meanThroughputVecVoipD2DPF, errorVecNegVoipD2DPF, errorVecPosVoipD2DPF, '--');

e.LineWidth = 1;
e.Marker = 'x';
e.MarkerSize = 8;
xlabel('receiver [#]')
ylabel('Mean Opinion Score [MOS]')
title('TU\_GAME, 50 pairs, 6 RBs, 60s, 20reps', 'FontSize', 20);
legend({'TU Scheduler Cell', 'TU Scheduler D2D', 'RR Scheduler Cell', 'RR Scheduler D2D', 'PF Scheduler Cell', 'PF Scheduler D2D'}, 'Location', 'west')
set(gca,'FontSize', 26)
hold off