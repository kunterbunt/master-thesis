function [att] = getPathAttenuation(distanceInKilometers, frequencyInGHz)
    att = 20 * log10(distanceInKilometers) + 20 * log10(frequencyInGHz) + 92.45;
end

