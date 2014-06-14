function new_key permKey(key, round)
	bin_round = dec2bin(round) - '0';
	n_key = somaPoliMod(bin_round,key,2);
	new_key = [n_key 0];
end