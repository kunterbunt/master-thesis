% Obtain analytical expectation.
p_tx = 24; % dBm
N = -174; % dB
d_pair = 10; % Meters between transmitter and receiver.
frequency = 2; % GHz.
num_interferers = 1:5;
xVec = [415.451 359.549 359.549 415.451 450];
yVec = [447.553 429.389 370.611 352.447 400];
receiver_x = 400;
receiver_y = 410;


att_link = getPathAttenuation(d_pair / 1000, frequency);
p_rcvd = p_tx - att_link;

interferenceVec = [];
sinrVec = [];
for i = 1 : size(num_interferers, 2)
    interferenceVec(i) = p_tx;
    for j = 1 : i
        x = xVec(i);
        y = yVec(i);
        d = sqrt((receiver_x - x)^2 + (receiver_y - y)^2);
        attenuation = getPathAttenuation(d / 1000, frequency);
        interferenceVec(i) = interferenceVec(i) - attenuation;        
    end            
end

% Plot. 
figure;
hold on;
ylabel('in-cell interference [dB]');
plot(num_interferers, interferenceVec, 'Color', 'red');
xlabel('number of interfering nodes n');
xticks(1:5);
legend('analytical');
set(gca,'FontSize', 26);
hold off;