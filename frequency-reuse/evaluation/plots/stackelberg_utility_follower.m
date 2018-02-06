function utility = stackelberg_utility_follower(price, p_i, p_k, g_ii, g_ki, g_ie, N)
    useful_signal = p_i * g_ii;
    interfering_signal = p_k * g_ki + N;
    fee = price * p_i * g_ie;
    utility = log2(1 + (useful_signal / interfering_signal)) - fee;
%     useful_signal = p_i + g_ii;
%     interfering_signal = p_k + g_ki;
%     interfering_signal = decibelAdd(interfering_signal, N);
%     utility = log2(1 + (useful_signal / interfering_signal)) - (price + p_i + g_ie);
end

