reps = 20;
nMax = 10;
filenamesVoip = {};
filenamesFulbuf = {};
for n=1:nMax
    for i=0:(reps - 1)
        filenamesVoip(n, (i+1)) = {strcat('../../results/TUGAME-VoIP-D2D_only/', 'n', int2str(n), '_rep', int2str(i), '.sca.voip')};   
        filenamesFulbuf(n, (i+1)) = {strcat('../../results/TUGAME-VoIP-D2D_only/', 'n', int2str(n), '_rep', int2str(i), '.sca.fulbuf')};   
    end
end

mosMatVoip = zeros(nMax, 3);
sumBytesMatFulBuf = zeros(nMax, 3);
for n=1:nMax    
    [mosMatVoip(n, 1), mosMatVoip(n, 2), mosMatVoip(n, 3)] = getSumBytesVec(filenamesVoip(n,:));
    [sumBytesMatFulBuf(n, 1), sumBytesMatFulBuf(n, 2), sumBytesMatFulBuf(n, 3)] = getSumBytesVec(filenamesFulbuf(n,:));
end

figure;
hold on;
yyaxis left;
errorbar(1:nMax, mosMatVoip(:, 1), mosMatVoip(:, 2), mosMatVoip(:, 3));
xlabel('number of full buffer pairs [#]');
ylabel('Mean Opinion Score');

yyaxis right;
errorbar(1:nMax, sumBytesMatFulBuf(:, 1), sumBytesMatFulBuf(:, 2), sumBytesMatFulBuf(:, 3));
ylabel('Sum of received bytes [B]');
set(gca,'FontSize', 26)