function new_key = permKey(key, round)
	bin_round = dec2bin(round) - '0';
	new_key = somaPoliMod(bin_round,key,2);
	if (length(new_key) < 8)
		tam = 8 - length(new_key);
		new_key = [zeros([1,tam]) new_key];
	end
end