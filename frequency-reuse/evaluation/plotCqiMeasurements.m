cqis = [
    [15 15 15 15 15]; % 10m
    [10 15 14 15 15]; % 20m
    [5 15 9 15 13]; % 30m
    [2 13 5 14 9]; % 40m
    [2 9 3 11 6]; % 50m
    [2 8 2 9 4]; % 60m
    [2 5 2 7 2]; % 70m 
    [2 4 2 5 2]; % 80m
    [2 2 2 4 2]; % 90m
    [2 2 2 2 2]; % 100m    
    [2 2 2 2 2];
    [2 2 2 2 2];
    [2 2 2 2 2];
    [2 2 2 2 2];
    [2 2 2 2 2];
];
meanCqi = [];
errorCqiPos = [];
errorCqiNeg = [];
for i=1:size(cqis, 1)
    meanCqi = [meanCqi; mean(cqis(i,:))];    
    CIs = getCI(cqis(i,:), 0.95);
    errorCqiPos = [errorCqiPos; CIs(1) - mean(cqis(i,:))];
    errorCqiNeg = [errorCqiNeg; mean(cqis(i,:)) - CIs(2)];
end

sinrs = [
    [58.0511 64.9947 48.6232 62.5932 62.2213];
    [46.2849 53.2285 36.857 50.827 50.4552];
    [39.4021 46.3458 29.9743 43.9443 43.5724];
    [37.0617 41.4623 25.0909 39.0609 31.9998];
    [22.2243 45.9034  36.5094 35.273 33.2462];
    [19.2559 26.2959 28.9369 19.8033 39.8963];
    [16.6392 23.6792 26.3202 17.1866 30.7618];
    [10.4743 23.4359 26.3578 33.2903 28.4951];
    [8.47496 21.4365 15.8001 28.7113 33.5734];
    [6.68647 28.8474 17.7202 26.9228 31.7849];
    [5.06858 27.2295 16.1023 25.3049 30.1671];
    [3.59156 25.7525 14.6253 9.53889 28.69];
    [2.23283 24.3938 13.2665 21.9891 27.3313];
    [0.974849 23.1358 12.0086 26.0346 26.0733];
    [-0.196305 21.9646 10.8374 24.8634 24.9022]
];
meanSinr = [];
errorSinrPos = [];
errorSinrNeg = [];
for i=1:size(sinrs, 1)
    meanSinr = [meanSinr; mean(sinrs(i,:))];
    CIs = getCI(sinrs(i,:), 0.95);
    errorSinrPos = [errorSinrPos; CIs(1) - mean(sinrs(i,:))];
    errorSinrNeg = [errorSinrNeg; mean(sinrs(i,:)) - CIs(2)];
end

atts = [
    [55.402 54.5945 68.1581 61.5824 59.1233];
    [67.1682 66.3607 79.9243 73.3485 70.8895];
    [74.051 73.2434 86.807 80.2313 77.7723];
    [76.3914 78.1268 91.6904 85.1147 89.3448];
    [91.2288 73.6858 80.2719 88.9026 88.0984];
    [94.1972 93.2933 87.8444 104.372 81.4483];
    [96.8139 95.91 90.4611 106.989 90.5828];
    [102.979 96.1533 90.4235 90.8853 92.8495];
    [104.978 98.1527 100.981 95.4643 87.7712];
    [106.767 90.7418 99.0611 97.2528 89.5597];
    [108.385 92.3597 100.679 98.8707 91.1776];
    [109.862 93.8367 102.156 114.637 92.6546];
    [111.22 95.1954 103.515 102.186 94.0133];
    [112.478 96.4534 104.773 98.141 95.2713];
    [113.649 97.6246 105.944 99.3121 96.4425]
];
meanAtt = [];
errorAttPos = [];
errorAttNeg = [];
for i=1:size(atts, 1)
    meanAtt = [meanAtt; mean(atts(i,:))];
    CIs = getCI(atts(i,:), 0.95);
    errorAttPos = [errorAttPos; CIs(1) - mean(atts(i,:))];
    errorAttNeg = [errorAttNeg; mean(atts(i,:)) - CIs(2)];
end

figure
hold on;
yyaxis left
errorbar(10:10:150, meanCqi, errorCqiNeg, errorCqiPos)
title('Path attenuation, SINR and CQI over increasing distance')
xlabel('distance between transmitter and receiver [m]')
ylabel('CQI')
yyaxis right
ylabel('dB')
errorbar(10:10:150, meanSinr, errorSinrNeg, errorSinrPos)
errorbar(10:10:150, meanAtt, errorAttNeg, errorAttPos)
legend('CQI', 'SINR', 'Attenuation')
set(gca,'FontSize', 26)
