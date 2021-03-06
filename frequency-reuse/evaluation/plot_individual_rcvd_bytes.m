function plot_individual_rcvd_bytes(directory, numRx, repetitions)    
    rcvdBytesVec = zeros(numRx, repetitions);
    errorVecPos = [];    
    errorVecNeg = [];
    for i = 1:1:1
        reps = [];
        for j= 0:(repetitions - 1)
%             filename = strcat(directory, 'd', int2str(i), '-rep', int2str(j), '.sca.parsed');
            filename = strcat(directory, 'rep', int2str(j), '.sca.parsed');
            receiverBytesVec = csvread(filename);
            for k = 1:numRx
                rcvdBytesVec(k,j+1) = receiverBytesVec(k);
            end
            reps = [reps; sum(receiverBytesVec)];
        end        
    end   
%     deviation = [];
%     for i = 1:numRx        
%         deviation(i) = std(rcvdBytesVec(i,:));
%     end    
%     mean(deviation)
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
    xlabel('repetition [#]');
    ylabel('received bytes');    
    set(gca,'FontSize', 26)
    title('NAIVE\_ROUND\_ROBIN, 6 RBs, 60s, UDP/Full Buffer', 'FontSize', 20);
end

