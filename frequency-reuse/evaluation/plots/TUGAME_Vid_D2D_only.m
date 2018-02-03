reps = 20;
nMax = 10;
filenamesVid = {};
filenamesFulbuf = {};
for n=1:nMax
    for i=0:(reps - 1)
        filenamesVid(n, (i+1)) = {strcat('../../results/TUGAME-Vid-D2D_only/', 'n', int2str(n), '_rep', int2str(i), '.sca.vid')};   
        filenamesFulbuf(n, (i+1)) = {strcat('../../results/TUGAME-Vid-D2D_only/', 'n', int2str(n), '_rep', int2str(i), '.sca.fulbuf')};   
    end
end

sumBytesMatVid = zeros(nMax, 3);
sumBytesMatFulBuf = zeros(nMax, 3);
for n=1:nMax    
    [sumBytesMatVid(n, 1), sumBytesMatVid(n, 2), sumBytesMatVid(n, 3)] = getSumBytesVec(filenamesVid(n,:));
    [sumBytesMatFulBuf(n, 1), sumBytesMatFulBuf(n, 2), sumBytesMatFulBuf(n, 3)] = getSumBytesVec(filenamesFulbuf(n,:));
end

figure;
hold on;
errorbar(1:nMax, sumBytesMatVid(:, 1), sumBytesMatVid(:, 2), sumBytesMatVid(:, 3));
errorbar(1:nMax, sumBytesMatFulBuf(:, 1), sumBytesMatFulBuf(:, 2), sumBytesMatFulBuf(:, 3));
ylabel('Sum of received bytes [B]');
xlabel('number of full buffer pairs [#]');
legend('vid', 'full buffer')
set(gca,'FontSize', 26)