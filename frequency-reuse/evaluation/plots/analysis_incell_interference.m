% Parse simulation results.
reps = 20;
dVec = 405:5:500;
y1 = 400;
y2 = 430;
location = 400;
filenames_urban = {};
filenames_fspl = {};
filenames_fspl_only = {};

for i=1:size(dVec,2)
    d = dVec(i);
    for rep=0:(reps - 1)                                
        filenames_urban(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/urban_macrocell/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
        filenames_fspl(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/free_space/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
        filenames_fspl_only(i, rep+1) = {strcat('../../results/testInCellInterferenceAnalytical/free_space_no_shadowing_no_fading/d', num2str(d), '-rep', int2str(rep), '.sca.int')};                   
    end    
end

interferenceMat_urban = zeros(size(dVec, 2), 3);
interferenceMat_fspl = zeros(size(dVec, 2), 3);
interferenceMat_fspl_only = zeros(size(dVec, 2), 3);
 
for i=1:size(dVec, 2)
    [interferenceMat_urban(i, 1), interferenceMat_urban(i, 2), interferenceMat_urban(i, 3)] = getMeanVec(filenames_urban(i,:));    
    [interferenceMat_fspl(i, 1), interferenceMat_fspl(i, 2), interferenceMat_fspl(i, 3)] = getMeanVec(filenames_fspl(i,:));    
    [interferenceMat_fspl_only(i, 1), interferenceMat_fspl_only(i, 2), interferenceMat_fspl_only(i, 3)] = getMeanVec(filenames_fspl_only(i,:));    
end

% Obtain analytical expectation.
p_trans = 24; % dBm
N = -174; % dB
d_pair = 30; % Meters between transmitter and receiver.
frequency = 2; % GHz.

att_link = getPathAttenuation(d_pair / 1000, frequency);
p_rcvd = p_trans - att_link;
gain = p_rcvd - p_trans;

attenuationVec = [];
interferenceVec = [];
sinrVec = [];
for i = 1 : size(dVec, 2)
    d = sqrt((dVec(i) - location)^2 + (y1 - y2)^2);
    attenuationVec(i) = getPathAttenuation(d / 1000, frequency);
    interferenceVec(i) = p_trans - attenuationVec(i);        
    sinrVec(i) = p_rcvd / interferenceVec(i) + N;
end

% Plot. 
figure;
hold on;

% yyaxis left;
ylabel('in-cell interference [dB]');
plot(dVec - location, interferenceVec, 'LineWidth', 2);
plot(dVec - location, interferenceMat_fspl_only(:, 1), '--v', 'LineWidth', 2);
errorbar(dVec - location, 10*log10(interferenceMat_fspl(:, 1)), 10*log10(interferenceMat_fspl(:, 2)), 10*log10(interferenceMat_fspl(:, 3)), '--v', 'LineWidth', 2);
errorbar(dVec - location, 10*log10(interferenceMat_urban(:, 1)), 10*log10(interferenceMat_urban(:, 2)), 10*log10(interferenceMat_urban(:, 3)), '--^', 'LineWidth', 2);


% yyaxis right;
% plot(dVec - location, sinrVec);

xlabel('distance between pairs [m]');
legend({'analytical (FSPL)', 'FSPL', 'FSPL + shadowing + fading', 'urban macrocell + shadowing + fading'}, 'Location', 'northeast', 'FontSize', 26);
set(gca,'FontSize', 26);
hold off;