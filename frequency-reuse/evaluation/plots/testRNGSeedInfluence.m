numRx = 10;
repetitions = 50;

rcvdBytesVecPF = zeros(numRx, repetitions);
for i = 1:1:1
    repsPF = [];
    for j= 0:(repetitions - 1)
        filename = strcat('../../results/testRNGSeedInfluencePF/', 'rep', int2str(j), '.sca.parsed');
        receiverBytesVec = csvread(filename);
        for k = 1:numRx
            rcvdBytesVecPF(k,j+1) = receiverBytesVec(k);
        end
        repsPF = [repsPF; sum(receiverBytesVec)];
    end        
end   

deviationPF = [];
variancePF = [];
throughputPF = [];
errorVecPosPF = [];    
errorVecNegPF = [];
for i = 1:numRx        
    deviationPF(i) = std(rcvdBytesVecPF(i,:));
    variancePF(i) = var(rcvdBytesVecPF(i,:));
    throughputPF(i) = mean(rcvdBytesVecPF(i,:));
    CI = getCI(rcvdBytesVecPF(i,:), 0.95);
    errorVecPosPF = [errorVecPosPF; CI(3)];    
    % Cap at 0.
    if throughputPF(i) - CI(3) < 0
        errorVecNegPF = [errorVecNegPF; throughputPF(i)];   
    else
        errorVecNegPF = [errorVecNegPF; CI(3)];   
    end        
end    

rcvdBytesVecRR = zeros(numRx, repetitions);
for i = 1:1:1
    repsRR = [];
    for j= 0:(repetitions - 1)
        filename = strcat('../../results/testRNGSeedInfluence/', 'rep', int2str(j), '.sca.parsed');
        receiverBytesVec = csvread(filename);
        for k = 1:numRx
            rcvdBytesVecRR(k,j+1) = receiverBytesVec(k);
        end
        repsRR = [repsRR; sum(receiverBytesVec)];
    end        
end   

deviationRR = [];
varianceRR = [];
throughputRR = [];
errorVecPosRR = [];    
errorVecNegRR = [];
for i = 1:numRx        
    deviationRR(i) = std(rcvdBytesVecRR(i,:));
    varianceRR(i) = var(rcvdBytesVecRR(i,:));
    throughputRR(i) = mean(rcvdBytesVecRR(i,:));
    CI = getCI(rcvdBytesVecRR(i,:), 0.95);
    errorVecPosRR = [errorVecPosRR; CI(3)];    
    % Cap at 0.
    if throughputRR(i) - CI(3) < 0
        errorVecNegRR = [errorVecNegRR; throughputRR(i)];   
    else
        errorVecNegRR = [errorVecNegRR; CI(3)];   
    end        
end    

figure;
hold on;    

e = plot(10:10:100, deviationPF, 'color', 'red');    
e.LineWidth = 1;
e.Marker = 'x';
e.MarkerSize = 8;

% e = plot(10:10:100, throughputPF);   
e = errorbar(10:10:100, throughputPF, errorVecNegPF, errorVecPosPF, 'color', [1 0.5 0]);
e.LineWidth = 1;
e.Marker = 'o';
e.MarkerSize = 8;

e = plot(10:10:100, deviationRR, 'color', 'blue');        
e.LineWidth = 1;
e.Marker = 'x';
e.MarkerSize = 8;

% e = plot(10:10:100, throughputRR);    
e = errorbar(10:10:100, throughputRR, errorVecNegRR, errorVecPosRR, 'color', [0.5 0.5 1]);
e.LineWidth = 1;
e.Marker = 'o';
e.MarkerSize = 8;

xlabel('intra-pair distance [m]')
ylabel('Byte');    
legend({'Proportional Fair Scheduler Standard Deviation', 'Proportional Fair Scheduler Mean Throughput', 'Naive Round Robin Scheduler Standard Deviation', 'Naive Round Robin Scheduler Mean Throughput'});
set(gca,'FontSize', 36);
title('10 pairs, 50 RBs, 50 repetitions, 60s, UDP/Full Buffer', 'FontSize', 20);