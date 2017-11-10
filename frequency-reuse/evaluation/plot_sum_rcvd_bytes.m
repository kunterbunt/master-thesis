function plot_sum_rcvd_bytes(directory, numReps)
    sumBytesVec = [];
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 350:10:390
        reps = [];
        for j = 0:(numReps-1)
            filename = strcat(directory, 'd', int2str(i), '-rep', int2str(j), '.sca.parsed');
            receiverBytesVec = csvread(filename);
            reps = [reps; sum(receiverBytesVec)];
        end
        CI = getCI(reps, 0.95);                
        errorVecPos = [errorVecPos; CI(1) - mean(reps)];        
        errorVecNeg = [errorVecNeg; mean(reps) - abs(CI(2))];        
        sumBytesVec = [sumBytesVec; mean(reps)];
    end        
    figure;
    hold on;    
    e = errorbar(10:10:50, sumBytesVec, errorVecNeg, errorVecPos);
    e.LineStyle = '--';
    e.LineWidth = 1;
    e.Marker = 'x';
    e.MarkerSize = 8;
    %ylim([0, max(sumBytesVec)]);
    xlabel('pair distance [m]');
    ylabel('received bytes');    
    set(gca,'FontSize', 26)
    title('REUSE\_TESTER, 2pairs, 5RBs, 30s, 20reps', 'FontSize', 20);
end

