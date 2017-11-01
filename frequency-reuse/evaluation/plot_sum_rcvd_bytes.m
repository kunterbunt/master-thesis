function plot_sum_rcvd_bytes(directory)
    sumBytesVec = [];
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 410:10:500
        reps = [];
        for j= 0:4
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
    errorbar(10:10:100, sumBytesVec, errorVecNeg, errorVecPos);
    %ylim([0, max(sumBytesVec)]);
    xlabel('transmission distance [m]');
    ylabel('received bytes');    
    set(gca,'FontSize', 26)
    title('Naive Round Robin, no reuse, 5 RBs', 'FontSize', 20);
end

