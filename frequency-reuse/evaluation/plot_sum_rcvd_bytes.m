function plot_sum_rcvd_bytes(directory)
    sumBytesVec = [];
    errorVec = [];    
    for i = 10:10:40
        reps = [];
        for j= 0:4
            filename = strcat(directory, 'N', int2str(i), '-rep', int2str(j), '.parsed');
            receiverBytesVec = csvread(filename);
            reps = [reps; sum(receiverBytesVec)];
        end
        CI = getCI(reps, 0.95);
        errorVec = [errorVec; CI(1) - CI(2)];
        sumBytesVec = [sumBytesVec; mean(reps)];
    end        
    figure;
    hold on;
    errorbar(10:10:40, sumBytesVec, errorVec);
    xlim([9, 40]);
    xlabel('number of D2D pairs');
    ylabel('sum of received bytes at all receivers');    
    set(gca,'FontSize', 26)
    title('Naive Round Robin, no reuse, 5 RBs', 'FontSize', 20);
end

