function CI = getCI(sampleVec, p)
    sampleSize = length(sampleVec);
    sampleMean = mean(sampleVec); 
    %sampleVariance = var(sampleVec); % Not needed.
    sampleDeviation = std(sampleVec);

    t = sampleSize - 1;
    z = tinv(p, t);

    CI=[sampleMean - ((z * sampleDeviation) / sqrt(sampleSize)), sampleMean + ((z * sampleDeviation) / sqrt(sampleSize)), (z * sampleDeviation) / sqrt(sampleSize)];
end
