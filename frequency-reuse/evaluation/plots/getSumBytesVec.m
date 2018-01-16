% Returns vector of sums, with one sum per file (repetition).
function [sumBytesVec, errorVecNeg, errorVecPos] = getSumBytesVec(filenames)
    sumBytesVec = [];
    errorVecPos = [];
    errorVecNeg = [];
    repVec = [];
    
    for i=1:size(filenames, 2)
        receiverBytesVec = csvread(char(filenames(i)));
        repVec = [repVec; nansum(receiverBytesVec)];
    end
    CI = getCI(repVec, 0.95);
    errorVecPos = [errorVecPos; CI(3)];
    sampleMean = mean(repVec);
    % Cap at 0.
    if sampleMean - CI(3) < 0
        errorVecNeg = [errorVecNeg; sampleMean];   
    else
        errorVecNeg = [errorVecNeg; CI(3)];   
    end        
    sumBytesVec = [sumBytesVec; mean(repVec)];
end

