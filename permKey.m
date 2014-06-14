function new_key = permKey(key, round)
	bin_round = dec2bin(round) - '0';
	n_key = somaPoliMod(bin_round,key,2);
	if (length(n_key) < 8)
		tam = 8 - length(n_key);
		new_key = [zeros(tam) n_key];
	end
end