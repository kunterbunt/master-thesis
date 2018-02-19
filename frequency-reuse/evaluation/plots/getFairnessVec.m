function fairnessVec = getFairnessVec(filenames)    
    repVec = [];    
    for i=1:size(filenames, 2)
        xVec = csvread(char(filenames(i)));
        repVec = [repVec; nanmean(xVec)];
    end        
    fairnessVec = jain(repVec');
end

