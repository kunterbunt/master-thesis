%% Parse simulation results.
reps = 20;
dVec = 405:5:500;
location = 400;
filenames = {};

for i=1:size(dVec,2)
    d = dVec(i);
    for rep=0:(reps - 1)                                
        filenames(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
    end    
end

interferenceMat = zeros(size(dVec, 2), 3);
 
for i=1:size(dVec, 2)
    [interferenceMat(i, 1), interferenceMat(i, 2), interferenceMat(i, 3)] = getMeanVec(filenames(i,:));    
end

%% Obtain analytical expectation.
p_trans = 26; % dBm
N = -174; % dB
d_pair = 30; % Meters between transmitter and receiver.
frequency = 2; % GHz.

att_link = getPathAttenuation(d_pair / 1000, frequency);
p_rcvd = p_trans - att_link;
gain = p_rcvd - p_trans;

interferenceVec = [];
sinrVec = [];
for i = 1 : size(dVec, 2)
    att_interference = getPathAttenuation((dVec(i) - location) / 1000, frequency);
    interferenceVec(i) = p_trans - att_interference;        
    sinrVec(i) = p_rcvd / interferenceVec(i) + N;
end

%% Plot. 
figure;
hold on;

% yyaxis left;
ylabel('in-cell interference [dB]');
errorbar(dVec - location, 10*log10(interferenceMat(:, 1)), 10*log10(interferenceMat(:, 2)), 10*log10(interferenceMat(:, 3)), '--v', 'LineWidth', 2);
plot(dVec - location, interferenceVec);

% yyaxis right;
% plot(dVec - location, sinrVec);

xlabel('distance [m]');
legend({'simulation', 'analytical'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;