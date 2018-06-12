%% Parse simulation results.
reps = 20;
dVec = 405:5:500;
location = 400;
filenames_urban = {};
filenames_fspl = {};

for i=1:size(dVec,2)
    d = dVec(i);
    for rep=0:(reps - 1)                                
        filenames_urban(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/urban_macrocell/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
        filenames_fspl(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/free_space/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
    end    
end

interferenceMat_urban = zeros(size(dVec, 2), 3);
interferenceMat_fspl = zeros(size(dVec, 2), 3);
 
for i=1:size(dVec, 2)
    [interferenceMat_urban(i, 1), interferenceMat_urban(i, 2), interferenceMat_urban(i, 3)] = getMeanVec(filenames_urban(i,:));    
    [interferenceMat_fspl(i, 1), interferenceMat_fspl(i, 2), interferenceMat_fspl(i, 3)] = getMeanVec(filenames_fspl(i,:));    
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
errorbar(dVec - location, 10*log10(interferenceMat_urban(:, 1)), 10*log10(interferenceMat_urban(:, 2)), 10*log10(interferenceMat_urban(:, 3)), '--v', 'LineWidth', 2, 'Color', 'blue');
errorbar(dVec - location, 10*log10(interferenceMat_fspl(:, 1)), 10*log10(interferenceMat_fspl(:, 2)), 10*log10(interferenceMat_fspl(:, 3)), '--v', 'LineWidth', 2, 'Color', 'magenta');
plot(dVec - location, interferenceVec, 'Color', 'red');

% yyaxis right;
% plot(dVec - location, sinrVec);

xlabel('distance between pairs [m]');
legend({'simulation (urban macrocell)', 'simulation (FSPL)', 'analytical (FSPL)'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;