% Returns vector of means, with one mean per file (repetition).
function [meanVec, errorVecNeg, errorVecPos] = getMeanVec(filenames)
    meanVec = [];
    errorVecPos = [];
    errorVecNeg = [];
    repVec = [];
    
    for i=1:size(filenames, 2)        
        receiverBytesVec = csvread(char(filenames(i)));
        repVec = [repVec; nanmean(receiverBytesVec)];
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
    meanVec = [meanVec; mean(repVec)];
end

