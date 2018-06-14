% Obtain analytical expectation.
p_trans = 24; % dBm
N = -174; % dB
d_pair = 30; % Meters between transmitter and receiver.
frequency = 2; % GHz.

att_link = getPathAttenuation(d_pair / 1000, frequency);
p_rcvd = p_trans - att_link;

interferenceVec = [];
sinrVec = [];
for i = 1 : size(dVec, 2)
    att_interference = getPathAttenuation((dVec(i) - location) / 1000, frequency);
    interferenceVec(i) = p_trans - att_interference;        
    sinrVec(i) = p_rcvd / (interferenceVec(i) + N);
end

% Plot. 
figure;
hold on;
ylabel('in-cell interference [dB]');
plot(dVec - location, interferenceVec, 'Color', 'red');
xlabel('distance between pairs [m]');
set(gca,'FontSize', 26);
hold off;