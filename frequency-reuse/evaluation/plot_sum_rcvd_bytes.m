function plot_sum_rcvd_bytes(directory, numReps)
    sumBytesVec = [];
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 325:20:465
        reps = [];
        for j = 0:(numReps-1)
            filename = strcat(directory, 'd', int2str(i), '-rep', int2str(j), '.sca.parsed.firstRx');
            receiverBytesVec = csvread(filename);            
            reps = [reps; sum(receiverBytesVec)];
        end        
        CI = getCI(reps, 0.95);
        errorVecPos = [errorVecPos; CI(3)];
        sampleMean = mean(reps);
        % Cap at 0.
        if sampleMean - CI(3) < 0
            errorVecNeg = [errorVecNeg; sampleMean];   
        else
            errorVecNeg = [errorVecNeg; CI(3)];   
        end        
        sumBytesVec = [sumBytesVec; mean(reps)];
    end           
    figure;
    hold on;    
    e = errorbar(0:20:140, sumBytesVec, errorVecNeg, errorVecPos);
    e.LineStyle = '--';
    e.LineWidth = 1;
    e.Marker = 'x';
    e.MarkerSize = 8;
    %ylim([0, max(sumBytesVec)]);
    xlabel('distance from cluster center [m]');
    ylabel('received bytes');    
    set(gca,'FontSize', 26)
    title('REUSE\_TESTER, 10pairs, 5RBs, 30s, 20reps', 'FontSize', 20);
    
    sumBytesVec = [];
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 325:20:465
        reps = [];
        for j = 0:(numReps-1)
            filename = strcat(directory, 'd', int2str(i), '-rep', int2str(j), '.sca.parsed.otherRx');
            receiverBytesVec = csvread(filename);            
            reps = [reps; sum(receiverBytesVec)];
        end        
        CI = getCI(reps, 0.95);
        errorVecPos = [errorVecPos; CI(3)];
        sampleMean = mean(reps);
        % Cap at 0.
        if sampleMean - CI(3) < 0
            errorVecNeg = [errorVecNeg; sampleMean];   
        else
            errorVecNeg = [errorVecNeg; CI(3)];   
        end        
        sumBytesVec = [sumBytesVec; mean(reps)];
    end            
    e = errorbar(0:20:140, sumBytesVec, errorVecNeg, errorVecPos);
    e.LineWidth = 1;
    e.LineStyle = '--';
    e.Marker = 'x';
    e.MarkerSize = 8;
    legend({'Rx_0', 'Rx_{i>0}'})
end

