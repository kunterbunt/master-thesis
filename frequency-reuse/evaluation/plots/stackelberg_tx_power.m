gainEnbVec = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
powerVec = [5.06239, 10.0083, 14.8337, 19.5345, 23, 23, 23, 23, 23, 23];

figure;
hold on;
plot(0.1:0.1:1, repmat(23, 1, 10), '--', 'Color', 'k')
plot(gainEnbVec, powerVec)

powerVec = [2.5312, 5.00414, 7.41686, 9.76726, 12.0532, 14.2723, 16.4223, 18.5006, 20.5046, 22.4316];
plot(gainEnbVec, powerVec)

powerVec = [1.68746, 3.3361, 4.94457, 6.51151, 8.03544, 9.51487, 10.9482, 12.3337, 13.6697, 14.9544];
plot(gainEnbVec, powerVec)

powerVec = [4.60668, 9.10735, 13.4984, 17.776, 21.9363, 23, 23, 23, 23, 23];
plot(gainEnbVec, powerVec)

powerVec = [5.61817, 11.1071, 16.4622, 21.6791, 23, 23, 23, 23, 23, 23];
plot(gainEnbVec, powerVec)

xlabel('g_{ke}')
ylabel('P_{Tx,i} [dBm]')
legend({'P_{Tx,max}', 'g_{ki}=0.5, g_{ie}=0.1, g_{ii}=0.9', 'g_{ki}=0.5, g_{ie}=0.2, g_{ii}=0.9', 'g_{ki}=0.5, g_{ie}=0.3, g_{ii}=0.9', 'g_{ki}=0.1, g_{ie}=0.1, g_{ii}=0.9', 'g_{ki}=0.9, g_{ie}=0.1, g_{ii}=0.9'}, 'Location', 'west')
title('g=channel gain, k=leader, i=follower, e=eNodeB')
set(gca,'FontSize', 26)