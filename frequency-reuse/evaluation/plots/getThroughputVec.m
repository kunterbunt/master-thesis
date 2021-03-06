% Returns 
% 'throughputMat' has each user's throughput values in row dimension.
% Columns are users.
% 'meanThroughputVec' holds mean throughput over all repetitions for each
% user.
function [throughputMat, meanThroughputVec, errorVecNeg, errorVecPos] = getThroughputVec(filenames)
    determineSize = csvread(char(filenames(1)));    
    numUsers = size(determineSize, 1);
    numReps = size(filenames, 2);
    throughputMat = zeros(numUsers, numReps);
    errorVecPos = zeros(numUsers, 1);
    errorVecNeg = zeros(numUsers, 1);
    repVec = zeros(numReps, 1);
    
    for i=1:numReps
        repVec = csvread(char(filenames(i)));
        repVec(isnan(repVec)) = 0;
        throughputMat(:, i) = repVec;
    end
    %throughputMat(1, :) All throughput values for user 1.
    meanThroughputVec = mean(throughputMat, 2); % One value per user.
    
    for i=1:numUsers
        ci = getCI(throughputMat(i, :), 0.95); % CI for user i, using all row values.        
        errorVecPos(i) = ci(3);
        
        if meanThroughputVec(i) - ci(3) < 0            
            errorVecNeg(i) = meanThroughputVec(i);
        else
            errorVecNeg(i) = ci(3);
        end
    end
end

