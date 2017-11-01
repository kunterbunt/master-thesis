function plot_reuse_vs_noreuse(directory)
    sumBytesVec = [];
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 310:10:400
        reps = [];
        for j= 0:4
            filename = strcat(directory, 'noreuse-d', int2str(i), '-rep', int2str(j), '.sca.parsed');
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
    e = errorbar(10:10:100, sumBytesVec, errorVecNeg, errorVecPos);
    e.LineStyle = '--';
    e.LineWidth = 1;
    e.Marker = 'x';
    e.MarkerSize = 8;
    %ylim([0, max(sumBytesVec)]);
    xlabel('distance between pairs [m]');
    ylabel('sum of received bytes');    
    set(gca,'FontSize', 26)
    title('Frequency reuse impact on performance', 'FontSize', 20);            
    
    sumBytesVec = [];
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 310:10:400
        reps = [];
        for j= 0:4
            filename = strcat(directory, 'reuse-d', int2str(i), '-rep', int2str(j), '.sca.parsed');
            receiverBytesVec = csvread(filename);
            reps = [reps; sum(receiverBytesVec)];
        end
        CI = getCI(reps, 0.95);                
        errorVecPos = [errorVecPos; CI(1) - mean(reps)];        
        errorVecNeg = [errorVecNeg; mean(reps) - abs(CI(2))];        
        sumBytesVec = [sumBytesVec; mean(reps)];
    end
    e = errorbar(10:10:100, sumBytesVec, errorVecNeg, errorVecPos);    
    e.LineStyle = '--';
    e.LineWidth = 1;
    e.Marker = 'o';
    e.MarkerSize = 8;
    legend({'without reuse'; 'with reuse'});
end

