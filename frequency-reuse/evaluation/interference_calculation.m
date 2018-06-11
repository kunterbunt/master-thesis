p_trans = 26; % dBm
N = -174; % dB
dVec = 325:20:465; % Meters.
dVec = dVec / 1000; % Kilometers.
d_pair = 10 / 1000; % Meters between transmitter and receiver.
frequency = 2.4; % GHz.

att_link = getPathAttenuation(d_pair, frequency);
p_rcvd = p_trans - att_link;
gain = p_rcvd - p_trans;

interferenceVec = [];
sinrVec = [];
for i = 1 : size(dVec, 2)
    att_interference = getPathAttenuation(dVec(i), frequency);
    interferenceVec(i) = p_trans - att_interference;        
    sinrVec(i) = 10^(p_rcvd/10) / (10^(interferenceVec(i)/10) + 10^(N/10));
end

sinrVec = 10*log10(sinrVec)

