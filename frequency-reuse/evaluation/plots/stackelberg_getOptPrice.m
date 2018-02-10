function price = stackelberg_getOptPrice(p_max, p_min, p_k, g_ke, g_ki, g_ie, g_ii, N, beta)    
    varA = p_k * g_ke;
    varB = 1 / log10(2);
    varC = -g_ie * ((p_k * g_ki + N) / g_ii) + N;       
	varDelta = varA * varB^2 * (varA + 4 * varC * (varA + varC) * (1 / ((N - varC) * beta)));	
	
	% Options correspond to respective set values in paper's algorithm.
	option1 = max(0, varB / (p_max * g_ie + N - varC));
	option2 = max(0, varB / (p_min * g_ie + N - varC));
	option3 = max(0, (varB / (N * beta)) - (varB / varA));
	option4 = max(0, (varB / varA) - (varB / ((varA + N) * beta)));
	option5 = max(0, (-varB * (varA + 2 * varC) + sqrt(varDelta)) / (2 * varC * (varA + varC)));
	
	% Evaluate the five price options' utility values.
	utility1 = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, option1);
	utility2 = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, option2);
	utility3 = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, option3);
	utility4 = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, option4);
	utility5 = stackelberg_utility_leader(p_k, g_ke, g_ki, g_ie, g_ii, N, beta, option5);
   
		
	price = option1;
    bestUtility = utility1;
    
	if utility2 > bestUtility 
		price = option2;
		bestUtility = utility2;
    end
	if utility3 > bestUtility 
		price = option3;
		bestUtility = utility3;
    end
	if utility4 > bestUtility 
		price = option4;
		bestUtility = utility4;
    end
	if utility5 > bestUtility 
		price = option5;
		bestUtility = utility5;
    end
    
    minPrice = varB / (p_max * g_ie + N - varC);
    maxPrice = varB / (p_min * g_ie + N - varC);
        
    price = min(maxPrice, price);
    price = max(minPrice, price);
end

