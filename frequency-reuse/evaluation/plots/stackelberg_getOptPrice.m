function price = untitled(p_max, p_min, p_tx, g_ke, g_ki, g_ie, g_ik, g_ii, N, beta)    
    varA = p_tx * g_ke;
    varB = 1 / log10(2);
    varC = -g_ie * ((p_tx * g_ki + N) / g_ii) + N;       
	varDelta = varA * varB^2 * (varA + 4 * varC * (varA + varC) * (1 / ((N - varC) * beta)));	
	
	% Options correspond to respective set values in paper's algorithm.
	option1 = varB / (p_max * g_ie + N - varC);
	option2 = varB / (p_min * g_ie + N - varC);
	option3 = (varB / (N * beta)) - (varB / varA);
	option4 = (varB / varA) - (varB / ((varA + N) * beta));
	option5 = (-varB * (varA + 2 * varC) + sqrt(varDelta)) / (2 * varC * (varA + varC));
	
	% Evaluate the five price options' utility values.
	utility1 = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, option1);
	utility2 = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, option2);
	utility3 = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, option3);
	utility4 = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, option4);
	utility5 = stackelberg_utility_leader(p_tx, g_ke, g_ki, g_ie, g_ii, N, beta, option5);
		
	bestOption = option1;
    bestUtility = utility1;
    
	if utility2 > bestUtility 
		bestOption = option2;
		bestUtility = utility2;
    end
	if utility3 > bestUtility 
		bestOption = option3;
		bestUtility = utility3;
    end
	if utility4 > bestUtility 
		bestOption = option4;
		bestUtility = utility4;
    end
	if utility5 > bestUtility 
		bestOption = option5;
		bestUtility = utility5;
    end
	
%     if bestOption > 0
        price = bestOption;
%     else
%         price = 0.01;
%     end    
end

