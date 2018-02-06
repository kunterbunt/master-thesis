function power = stackelberg_getOptTxPw(price, p_max, p_min, p_k, g_ki, g_ie, g_ii, N)
    
    %enumerator = (1 / (price * g_ie * log10(2)));
	%denominator = (p_tx * g_ki + N) / (g_ii);
%     price
%     a = (1 / (price * g_ie * log(2)))
%     b = ((p_k * g_ki + N) / (g_ii))    
	power = (1 / (price * g_ie * log(2))) - ((p_k * g_ki + N) / (g_ii));
%     power = abs(power) * p_max;
%     power = max(power, p_min);
%     power = min(power, p_max);
end

