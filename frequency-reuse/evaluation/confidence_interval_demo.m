% 2 different simulations with 5 repetitions each.
powerVec = [123 312 231 232 162; 99 86 123 96 100]; 
% powerVec(1,:) are the 5 power values collected from repeating the first
% simulation 5 times.

% Confidence interval for first simulation.
ci1 = getCI(powerVec(1,:), 0.95);
% And for the second.
ci2 = getCI(powerVec(2,:), 0.95);

% ci1(1) = mean(powerVec(1,:) - ci(3)
% ci(2) = mean(powerVec(1,:) + ci(3)
% ci(3) = half the length of the confidence interval

figure;
hold on;
errorbar(1:2, [mean(powerVec(1,:)), mean(powerVec(2,:))], [ci1(3), ci2(3)], [ci1(3), ci2(3)]);
xlim([0 3]);
hold off;