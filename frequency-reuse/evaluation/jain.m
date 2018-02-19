function [fairness] = jain(xVec)
fairness = sum(xVec)^2 / (size(xVec, 2) * sum(xVec.^2));
end

