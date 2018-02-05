function utility = stackelberg_utility_follower(price, p_i, p_k, g_ii, g_ki, g_ie, N)
    utility = log2(1 + (p_i * g_ii) / (p_k * g_ki + N)) - price * p_i * g_ie;
end

