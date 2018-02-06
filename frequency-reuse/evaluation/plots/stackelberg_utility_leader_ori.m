function utility = stackelberg_utility_leader_ori(alpha_k, p_i, p_k, g_ke, g_ie, N, beta)
    utility = log2(1 + ((p_k * g_ke) / (p_i * g_ie + N))) + alpha_k * beta * p_i * g_ie;
end

