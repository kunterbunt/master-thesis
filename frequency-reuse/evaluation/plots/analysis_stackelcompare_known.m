reps = 15;
% N = 5:5:15;
filenames_sta = {};
filenames_rand = {};

% for i=1:size(N,2)
%     n = N(i);
    for rep=0:(reps - 1)                                
        filenames_sta(rep+1) = {strcat('../../results/stackelcompare_known/', 'rep', int2str(rep), '.sca.fulbuf')};   
        filenames_rand(rep+1) = {strcat('../../results/stackelcompare_known_random/', 'rep', int2str(rep), '.sca.fulbuf')};           
    end    
% end

throughputMatSta = zeros(1, 3);
throughputMatRand = zeros(1, 3);
 
[throughputMatSta(1, 1), throughputMatSta(1, 2), throughputMatSta(1, 3)] = getMeanVec(filenames_sta(:)');    
[throughputMatRand(1, 1), throughputMatRand(1, 2), throughputMatRand(1, 3)] = getMeanVec(filenames_rand(:)');    

figure;
hold on;
bar(1:2, [throughputMatRand(:, 1) throughputMatSta(:, 1)]);
errorbar(1:2, [throughputMatRand(:, 1) throughputMatSta(:, 1)], [throughputMatRand(:, 2) throughputMatSta(:, 2)], [throughputMatRand(:, 3) throughputMatSta(:, 3)], '.', 'LineWidth', 2);
xticks([1 2]);
xticklabels({'random reuse', 'Stackelberg reuse'});

ylabel('sum throughput [B]');
set(gca,'FontSize', 46);
hold off;