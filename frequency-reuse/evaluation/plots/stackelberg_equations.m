
p_max = 400; % mW
p_min = 0;
p_tx = 350;
% Channel gains. k=leader e=eNodeB i=follower
g_ke = 8e-8;
g_ki = 8e-8;
g_ie = 8e-8;
g_ik = 8e-8;
g_ii = 8e-8;
% Noise constant.
N = -174;
% Scaling factor 'beta' denotes the ratio of the leader's gain and the follower's payment. It is usually between 2 and 10.
beta = 5;

g_keVec = [];
powerVec = [];

numSteps = 7;
for i = 1:numSteps
    g_ke = g_ke - 0.00000001;
    price = stackelberg_getOptPrice(p_max, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta);
    power = stackelberg_getOptTxPw(price, p_max, p_min, p_tx, g_ki, g_ie, g_ii, N);
    g_keVec(end + 1) = g_ke;
    powerVec(end + 1) = power;
end

g_keVec
powerVec
plot(g_keVec, powerVec);
