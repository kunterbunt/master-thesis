function util = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, price)    
	varA = p_tx * g_ke;	
	varB = 1 / log10(2);	
	varC = -g_ie * ((p_tx * g_ki + N) / g_ii) + N;	
	util = log2(1 + ((varA * price) / (varC * price + varB))) + (varC - N) * beta * price + varB * beta;
end

