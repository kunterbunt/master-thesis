repetitions = 20;
filenamesCbrCell = {};    
filenamesCbrD2D = {};    

for p = 0:0.1:1.0    
    for j = 0:(repetitions-1)
        if p > 0.0 && p < 1.0
            filenamesCbrCell(end+1) = {strcat('../../results/parameterStudy-p/', 'p', sprintf('%.1f',p), '_rep', int2str(j), '.sca.cell')};   
            filenamesCbrD2D(end+1) = {strcat('../../results/parameterStudy-p/', 'p', sprintf('%.1f',p), '_rep', int2str(j), '.sca.d2d')};   
        else
            filenamesCbrCell(end+1) = {strcat('../../results/parameterStudy-p/', 'p', int2str(p), '_rep', int2str(j), '.sca.cell')};   
            filenamesCbrD2D(end+1) = {strcat('../../results/parameterStudy-p/', 'p', int2str(p), '_rep', int2str(j), '.sca.d2d')};   
        end
    end        
end

sumBytesVecCell = [];
errorVecNegCell = [];
errorVecPosCell = [];

sumBytesVecD2D = [];
errorVecNegD2D = []; 
errorVecPosD2D = [];
for i = 1:20:220
    j = i + 19;
    [sumBytesVecCell(end + 1), errorVecNegCell(end + 1), errorVecPosCell(end + 1)] = getSumBytesVec(filenamesCbrCell(i:j));    
    [sumBytesVecD2D(end + 1), errorVecNegD2D(end + 1), errorVecPosD2D(end + 1)] = getSumBytesVec(filenamesCbrD2D(i:j));    
end

figure;
hold on;

p = 0:0.1:1.0;
index = 2:11; % p=0.0 wasn't working as I had assumed that to turn it off. So it's the same as p=1.0.
%errorbar(p(index), sumBytesVecCell(index), errorVecNegCell(index), errorVecPosCell(index));
errorbar(p(index), sumBytesVecD2D(index), errorVecNegD2D(index), errorVecPosD2D(index));

xlabel('p')
ylabel('sum throughput [B]')
legend({'D2D Flows'})
set(gca,'FontSize', 26)