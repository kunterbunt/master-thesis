numRxCbrCell = 10;
numRxCbrD2D = 10;
numRxVoIPCell = 15;
numRxVoIPD2D = 15;

repetitions = 20;

% TU CBR
% Cell
filenamesCbrCell = {};    
for j = 0:(repetitions-1)
    filenamesCbrCell(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.cbr_cell')};   
end        
[sumBytesVecCbrCell, errorVecNegCbrCell, errorVecPosCbrCell] = getSumBytesVec(filenamesCbrCell);
% D2D
filenamesCbrD2D = {};    
for j = 0:(repetitions-1)
    filenamesCbrD2D(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.cbr_d2d')};   
end        
[sumBytesVecCbrD2D, errorVecNegCbrD2D, errorVecPosCbrD2D] = getSumBytesVec(filenamesCbrD2D);

% Round Robin CBR
% Cell
filenamesCbrCellRR = {};    
for j = 0:(repetitions-1)
    filenamesCbrCellRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.cbr_cell')};   
end        
[sumBytesVecCbrCellRR, errorVecNegCbrCellRR, errorVecPosCbrCellRR] = getSumBytesVec(filenamesCbrCellRR);
% D2D
filenamesCbrD2DRR = {};    
for j = 0:(repetitions-1)
    filenamesCbrD2DRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.cbr_d2d')};   
end        
[sumBytesVecCbrD2DRR, errorVecNegCbrD2DRR, errorVecPosCbrD2DRR] = getSumBytesVec(filenamesCbrD2DRR);

% PF CBR
% Cell
filenamesCbrCellPF = {};    
for j = 0:(repetitions-1)
    filenamesCbrCellPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.cbr_cell')};   
end        
[sumBytesVecCbrCellPF, errorVecNegCbrCellPF, errorVecPosCbrCellPF] = getSumBytesVec(filenamesCbrCellPF);
% D2D
filenamesCbrD2DPF = {};    
for j = 0:(repetitions-1)
    filenamesCbrD2DPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.cbr_d2d')};   
end        
[sumBytesVecCbrD2DPF, errorVecNegCbrD2DPF, errorVecPosCbrD2DPF] = getSumBytesVec(filenamesCbrD2DPF);

% Combine
sumBytesVecCbr = [sumBytesVecCbrCell; sumBytesVecCbrD2D];
errorVecNegCbr = [errorVecNegCbrCell; errorVecNegCbrD2D];
errorVecPosCbr = [errorVecPosCbrCell; errorVecPosCbrD2D];
sumBytesVecCbrRR = [sumBytesVecCbrCellRR; sumBytesVecCbrD2DRR];
errorVecNegCbrRR = [errorVecNegCbrCellRR; errorVecNegCbrD2DRR];
errorVecPosCbrRR = [errorVecPosCbrCellRR; errorVecPosCbrD2DRR];
sumBytesVecCbrPF = [sumBytesVecCbrCellPF; sumBytesVecCbrD2DPF];
errorVecNegCbrPF = [errorVecNegCbrCellPF; errorVecNegCbrD2DPF];
errorVecPosCbrPF = [errorVecPosCbrCellPF; errorVecPosCbrD2DPF];

figure;
hold on;    
yyaxis left
ylabel('received bytes');    

% 2kps threshold line
plot(0:1, repmat(150000, 1, 2), '-', 'Color', 'k')
text(0, 152000, '2kpbs')
% Plot TU
e = errorbar(0:1, sumBytesVecCbr, errorVecNegCbr, errorVecPosCbr, '-');
e.LineWidth = 1;
e.Marker = 'x';
e.MarkerSize = 8;
% Plot RR
errorbar(0:1, sumBytesVecCbrRR, errorVecNegCbrRR, errorVecPosCbrRR, '--', 'Color', [0 0.75 0.25]);
% Plot PF
errorbar(0:1, sumBytesVecCbrPF, errorVecNegCbrPF, errorVecPosCbrPF, '-.', 'Color', [0.5 0.75 0.5]);

% TU VoIP
% Cell
filenamesVoipCell = {};    
for j = 0:(repetitions-1)
    filenamesVoipCell(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.voip_cell')};   
end        
[sumBytesVecVoipCell, errorVecNegVoipCell, errorVecPosVoipCell] = getMeanVec(filenamesVoipCell);
% D2D
filenamesVoipD2D = {};    
for j = 0:(repetitions-1)
    filenamesVoipD2D(end+1) = {strcat('../../results/tuGameTest/', 'rep', int2str(j), '.sca.voip_d2d')};   
end        
[sumBytesVecVoipD2D, errorVecNegVoipD2D, errorVecPosVoipD2D] = getMeanVec(filenamesVoipD2D);

% RR VoIP
% Cell
filenamesVoipCellRR = {};    
for j = 0:(repetitions-1)
    filenamesVoipCellRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.voip_cell')};   
end        
[sumBytesVecVoipCellRR, errorVecNegVoipCellRR, errorVecPosVoipCellRR] = getMeanVec(filenamesVoipCellRR);
% D2D
filenamesVoipD2DRR = {};    
for j = 0:(repetitions-1)
    filenamesVoipD2DRR(end+1) = {strcat('../../results/tuGameTestComparisonRR/', 'rep', int2str(j), '.sca.voip_d2d')};   
end        
[sumBytesVecVoipD2DRR, errorVecNegVoipD2DRR, errorVecPosVoipD2DRR] = getMeanVec(filenamesVoipD2DRR);

% PF VoIP
% Cell
filenamesVoipCellPF = {};    
for j = 0:(repetitions-1)
    filenamesVoipCellPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.voip_cell')};   
end        
[sumBytesVecVoipCellPF, errorVecNegVoipCellPF, errorVecPosVoipCellPF] = getMeanVec(filenamesVoipCellPF);
% D2D
filenamesVoipD2DPF = {};    
for j = 0:(repetitions-1)
    filenamesVoipD2DPF(end+1) = {strcat('../../results/tuGameTestComparisonPF/', 'rep', int2str(j), '.sca.voip_d2d')};   
end        
[sumBytesVecVoipD2DPF, errorVecNegVoipD2DPF, errorVecPosVoipD2DPF] = getMeanVec(filenamesVoipD2DPF);

% Combine
sumBytesVecVoip = [sumBytesVecVoipCell; sumBytesVecVoipD2D];
errorVecNegVoip = [errorVecNegVoipCell; errorVecNegVoipD2D];
errorVecPosVoip = [errorVecPosVoipCell; errorVecPosVoipD2D];
sumBytesVecVoipRR = [sumBytesVecVoipCellRR; sumBytesVecVoipD2DRR];
errorVecNegVoipRR = [errorVecNegVoipCellRR; errorVecNegVoipD2DRR];
errorVecPosVoipRR = [errorVecPosVoipCellRR; errorVecPosVoipD2DRR];
sumBytesVecVoipPF = [sumBytesVecVoipCellPF; sumBytesVecVoipD2DPF];
errorVecNegVoipPF = [errorVecNegVoipCellPF; errorVecNegVoipD2DPF];
errorVecPosVoipPF = [errorVecPosVoipCellPF; errorVecPosVoipD2DPF];

% Second y-axis
yyaxis right
ylabel('Mean Opinion Score (MOS)');    
% Plot TU
e = errorbar(2:3, sumBytesVecVoip, errorVecNegVoip, errorVecPosVoip, '-');
e.LineWidth = 1;
e.Marker = 'x';
e.MarkerSize = 8;
% Plot RR
errorbar(2:3, sumBytesVecVoipRR, errorVecNegVoipRR, errorVecPosVoipRR, '--', 'Color', [0.5 0.5 0]);
% Plot PF
errorbar(2:3, sumBytesVecVoipPF, errorVecNegVoipPF, errorVecPosVoipPF, '-.', 'Color', [1 0.25 1]);

% Graph management
xlabel('UE type');
set(gca,'FontSize', 26)
xticklabels({'CBR\_Cell', 'CBR\_D2D', 'VoIP\_Cell', 'VoIP\_D2D'})
title('TU\_GAME, 50 pairs, 6 RBs, 60s, 20reps', 'FontSize', 20);
xlim([-0.05 3.05])
legend({'2kps threshold', 'TU Scheduler (CBR)', 'RR Scheduler (CBR)', 'PF Scheduler (CBR)', 'TU Scheduler (VoIP)', 'RR Scheduler (VoIP)', 'PF Scheduler (VoIP)'})