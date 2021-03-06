repetitions = 20;
filenamesCbrCell = {};    
filenamesCbrD2D = {};    
dRange = 10:10:50;

for d = 10:10:50
    for j = 0:(repetitions-1)        
        filenamesCbrCell(end+1) = {strcat('../../results/d2dVsCellPF/', 'd', int2str(d), '_rep', int2str(j), '.sca.cell')};   
        filenamesCbrD2D(end+1) = {strcat('../../results/d2dVsCellPF/', 'd', int2str(d), '_rep', int2str(j), '.sca.d2d')};           
    end        
end

sumBytesVecCell = [];
errorVecNegCell = [];
errorVecPosCell = [];

sumBytesVecD2D = [];
errorVecNegD2D = []; 
errorVecPosD2D = [];
for i = 1:20:size(filenamesCbrCell, 2)
    j = i + 19;
    [sumBytesVecCell(end + 1), errorVecNegCell(end + 1), errorVecPosCell(end + 1)] = getSumBytesVec(filenamesCbrCell(i:j));    
    [sumBytesVecD2D(end + 1), errorVecNegD2D(end + 1), errorVecPosD2D(end + 1)] = getSumBytesVec(filenamesCbrD2D(i:j));    
end

figure;
hold on;
errorbar(dRange, sumBytesVecCell, errorVecNegCell, errorVecPosCell);
errorbar(dRange, sumBytesVecD2D, errorVecNegD2D, errorVecPosD2D);
xlabel('distance [m]');
ylabel('sum throughput [B]');
legend({'Cellular Flows', 'D2D Flows'});
set(gca,'FontSize', 26);
hold off;