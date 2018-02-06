function decibel = decibelAdd(in, plus)
    decibel = 10 * log10(10^(in/10) + 10^(plus/10));
end

