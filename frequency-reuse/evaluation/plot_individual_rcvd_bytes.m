function plot_individual_rcvd_bytes(directory, numRx, repetitions)    
    rcvdBytesVec = zeros(numRx, repetitions);
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 1:1:1
        reps = [];
        for j= 0:(repetitions - 1)
            filename = strcat(directory, 'N', int2str(i), '-rep', int2str(j), '.sca.parsed');
            receiverBytesVec = csvread(filename);
            for k = 1:numRx
                rcvdBytesVec(k,j+1) = receiverBytesVec(k);
            end
            reps = [reps; sum(receiverBytesVec)];
        end        
%         rcvdBytesVec(1,:) % all repetitions for Rx1
%         CI = getCI(reps, 0.95);                
%         errorVecPos = [errorVecPos; CI(1) - mean(reps)];        
%         errorVecNeg = [errorVecNeg; mean(reps) - abs(CI(2))];        
%         sumBytesVec = [sumBytesVec; mean(reps)];
    end        
    figure;
    hold on;    
    leg = {};
    for i = 1:numRx
        e = plot(1:repetitions, rcvdBytesVec(i,:));    
        e.LineWidth = 1;
        e.Marker = 'x';
        e.MarkerSize = 8;
        
        leg{end+1} = strcat('Rx', int2str(i));
    end            
    legend(leg);
    xlabel('reptition [#]');
    ylabel('received bytes');    
    set(gca,'FontSize', 26)
    title('Reuse Tester, 5 RBs, 10s', 'FontSize', 20);
end

